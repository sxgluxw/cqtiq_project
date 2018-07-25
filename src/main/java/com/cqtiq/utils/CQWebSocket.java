package com.cqtiq.utils;

import java.io.IOException;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Component;


@ServerEndpoint(value="/websocket/information/{loginname}")
@Component
public class CQWebSocket {
	//用来记录当前在线连接数。
    private static int onlineCount = 0;

    //concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。
    private static CopyOnWriteArraySet<CQWebSocket> webSocketSet = new CopyOnWriteArraySet<CQWebSocket>();

    //与某个客户端的连接会话，需要通过它来给客户端发送数据
    private Session session;
    
    private String loginName; //登录名

    /**
     * 连接建立成功调用的方法*/
    @OnOpen
    public void onOpen(@PathParam("loginname")String loginname,Session session) throws IOException{//@PathParam("loginname")String loginname,
        this.session = session;
        this.loginName = loginname; 
        webSocketSet.add(this);     //加入set中
        addOnlineCount();           //在线数加1
        System.out.println(loginname+"加入！当前在线人数为" + getOnlineCount());
       //CommonConstant.CURRENT_WANGING_NUMBER.toString()
    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose() {
        webSocketSet.remove(this);  //从set中删除
        subOnlineCount();           //在线数减1
        System.out.println("有一连接关闭！当前在线人数为" + getOnlineCount());
    }

    /**
     * 收到客户端消息后调用的方法
     *
     * @param message 客户端发送过来的消息*/
    @OnMessage
    public void onMessage(String message, Session session) {
        System.out.println("来自客户端的消息:" + message);

        //群发消息
        for (CQWebSocket item : webSocketSet) {
            try {
				item.sendMessage(message);
			} catch (IOException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
        }
    }

    /**
     * 发生错误时调用
     */
    @OnError
    public void onError(Session session, Throwable error) {
        System.out.println("发生错误");
        error.printStackTrace();
    }


    public void sendMessage(String message) throws IOException {
//        this.session.getBasicRemote().sendText(message);
        this.session.getAsyncRemote().sendText(message);
        System.out.println("ou了");
        //this.session.getAsyncRemote().sendText(message);
    }


    /**
     * 群发自定义消息
     * */
    public static void sendInfo(String message) throws IOException {
    	System.out.println("来自客户端的消息:" + message);
        for (CQWebSocket item : webSocketSet) {
            item.sendMessage(message);
        }
    }


    public static synchronized int getOnlineCount() {
        return onlineCount;
    }

    public static synchronized void addOnlineCount() {
    	CQWebSocket.onlineCount++;
    }

    public static synchronized void subOnlineCount() {
    	CQWebSocket.onlineCount--;
    }
}
