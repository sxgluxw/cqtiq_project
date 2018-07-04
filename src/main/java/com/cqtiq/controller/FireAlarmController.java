package com.cqtiq.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import java.util.UUID;
import java.util.concurrent.ScheduledExecutorService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallbackExtended;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.eclipse.paho.client.mqttv3.MqttTopic;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cqtiq.mqtt.PushCallback;
import com.cqtiq.mqtt.RXPayload;
import com.cqtiq.mqtt.Server;
import com.cqtiq.pojo.FireAlarm;
import com.cqtiq.pojo.LineSections;
import com.cqtiq.pojo.Rxmqtt;
import com.cqtiq.pojo.Txmqtt;
import com.cqtiq.service.FireAlarmService;
import com.cqtiq.utils.CookieUtils;
import com.google.gson.Gson;

@Controller
public class FireAlarmController {
	
	private Gson g = new Gson();
	
	@Autowired
	private FireAlarmService fireAlarmService;
	
	
	@RequestMapping("/confirm/fireAlarm")
	@ResponseBody
	public String confirmFire(@RequestParam String msg,HttpServletRequest request,HttpServletResponse response) throws Exception {
		System.out.println(msg);
		String result = "";
		List<Rxmqtt> fireData = fireAlarmService.getFireData();
		//判断数据
		for (Rxmqtt rxmqtt : fireData) {
			FireAlarm fireAlarm = g.fromJson(rxmqtt.getData(), FireAlarm.class);
			if(Double.parseDouble(fireAlarm.getSmokescope().substring(0, 4)) >= 0.65) {
				if("2".equals(fireAlarm.getStatus())) {
					//处理数据
					fireAlarm.setStatus("1;"+msg);
					String json = g.toJson(fireAlarm);
					rxmqtt.setData(json);
					fireAlarmService.updateRireAlarm(rxmqtt);
					CookieUtils.deleteCookie(request, response, "alarm");
					CookieUtils.setCookie(request, response, "alarm", "200");
					
					//向设备发送数据，并存储
					
					Txmqtt txm = new Txmqtt();
					txm.setConfirmed("Y".getBytes()[0]);
					txm.setData(json);
					txm.setDevnum(rxmqtt.getDevNum());
					txm.setPort(rxmqtt.getPort());
					txm.setSign(UUID.randomUUID().toString());
					
					fireAlarmService.savePushMessage(txm);
					
					result =  "200";
				}
			}
		}
		CookieUtils.deleteCookie(request, response, "alarm");
		CookieUtils.setCookie(request, response, "alarm", "200");
		result = "200";
		return result;
	}
	
	@RequestMapping("/fire/fireData")
	@ResponseBody
	public List<FireAlarm> queryFireData(HttpServletRequest request,Model model,HttpServletResponse response) throws Exception{
		System.out.println("发送request"+request.toString());
		//模拟设备发送消息
		if(!"400".equals(CookieUtils.getCookieValue(request, "alarm"))) {
			Server server = new Server();
			RXPayload rx = createMessage(server,server.KEY);
			System.out.println(rx);
		}
		
		//处理数据并返回给页面
		List<Rxmqtt> list = fireAlarmService.getFireData();
		List<FireAlarm> listData = new ArrayList<>();
		for (Rxmqtt rxmqtt : list) {
			FireAlarm fireAlarm = g.fromJson(rxmqtt.getData().toString(), FireAlarm.class);
			fireAlarm.setSmokescope(fireAlarm.getSmokescope().substring(0, 4));
			listData.add(fireAlarm);
		}
		Collections.reverse(listData);
		
		//处理listData数据
		for (FireAlarm fireAlarm : listData) {
			//System.out.println(Double.parseDouble(fireAlarm.getSmokescope().substring(0, 4)) >= 0.65);
			if(Double.parseDouble(fireAlarm.getSmokescope().substring(0, 4)) >= 0.65) {
				//System.out.println("2".equals(fireAlarm.getStatus()));
				if("2".equals(fireAlarm.getStatus())) {
					request.setAttribute("alarm", "400");
					CookieUtils.deleteCookie(request, response, "alarm");
					CookieUtils.setCookie(request, response, "alarm", "400");
					System.out.println(CookieUtils.getCookieValue(request, "alarm")+request.getContextPath());
					response.sendRedirect(request.getContextPath()+"/fire_alarm");
					return listData;
				}
			}
		}
		CookieUtils.deleteCookie(request, response, "alarm");
		CookieUtils.setCookie(request, response, "alarm", "200");
		return listData;
		
	}
	
	public RXPayload createMessage(Server server,String key) throws Exception {
		RXPayload rx = new RXPayload();
		//设备编号
		rx.setDevNum("cqtiq_aaa01");
		//消息生成时间
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd  HH:mm:ss");
		LineSections saveLine = new LineSections();
		rx.setTime(sdf.format(System.currentTimeMillis()));
		
		//消息端口号
		rx.setPort(1883);
		//网关数量
		rx.setGatewayCount(2);
		//网关ID
		rx.setGetawayId(UUID.randomUUID().toString());
		
		//data数据
		Random random = new Random();
		float a = random.nextFloat() / 2 + 0;
		BigDecimal b = new BigDecimal(a).setScale(2, BigDecimal.ROUND_HALF_UP);
		FireAlarm sSrc = new FireAlarm();
		sSrc.setSmokescope(b+"%ft");
		String fireAS = g.toJson(sSrc);
		
		String encrypt = rx.Encrypt(fireAS.toString(), key);
		//data数据
		rx.setData(encrypt);
		
		//System.out.println("打包好的："+rx);
		//模拟网关发送信息
		server.message = new MqttMessage();
        server.message.setQos(2);
        server.message.setRetained(true);
        Gson g = new Gson();
        String json = g.toJson(rx);
        server.message.setPayload(json.getBytes());
        //System.out.println("发送出去的"+new String(server.message.getPayload()));
        server.publish(server.topic , server.message);
      //接收消息并存储数据
      	recieveMessage() ;
		return rx;
	}
	
	
	//向设备发送消息
	public void pushMessage(Server server,String key,Txmqtt tx) throws Exception {
		RXPayload rx = new RXPayload();
		String encrypt = rx.Encrypt(tx.getData(), key);
		tx.setData(encrypt);
		//System.out.println("打包好的："+rx);
		//模拟网关发送信息
		server.message = new MqttMessage();
		server.message.setQos(2);
		server.message.setRetained(true);
		Gson g = new Gson();
		String json = g.toJson(tx);
		server.message.setPayload(json.getBytes());
		//System.out.println("发送出去的"+new String(server.message.getPayload()));
		server.publish(server.topic , server.message);
		//接收消息并存储数据
	}
	
	public static final String HOST = "tcp://192.168.31.174:1883";  
	public static final String TOPIC = "toclient/124";  
	private static final String clientid = "client124";  
	private MqttClient client;  
	private MqttConnectOptions options;  
	private String userName = "admin";
	private String passWord = "password";
	
	

	private ScheduledExecutorService scheduler; 
	public void  recieveMessage() {
		    try {  
	            // host为主机名，clientid即连接MQTT的客户端ID，一般以唯一标识符表示，MemoryPersistence设置clientid的保存形式，默认为以内存保存  
	            client = new MqttClient(HOST, clientid, new MemoryPersistence());  
	            // MQTT的连接设置  
	            options = new MqttConnectOptions();  
	            // 设置是否清空session,这里如果设置为false表示服务器会保留客户端的连接记录，这里设置为true表示每次连接到服务器都以新的身份连接  
	            options.setCleanSession(true);  
	            // 设置连接的用户名  
	            options.setUserName(userName);  
	            // 设置连接的密码  
	            options.setPassword(passWord.toCharArray());  
	            // 设置超时时间 单位为秒  
	            options.setConnectionTimeout(10);  
	            // 设置会话心跳时间 单位为秒 服务器会每隔1.5*20秒的时间向客户端发送个消息判断客户端是否在线，但这个方法并没有重连的机制  
	            options.setKeepAliveInterval(20); 
	         // 断线自动重连选项
	            //options.setAutomaticReconnect(true);
	            // 设置回调  
	            client.setCallback(new MqttCallbackExtended() {
					
					@Override
					public void messageArrived(String topic, MqttMessage message) throws Exception {
	                    // 消息抵达事件回调方法
	                    // 当客户端接收到消息时会被调用
	                    //订阅方法执行时会被调用
	                    //System.out.println("接收消息主题:" + topic);

	                    // 获取服务质量信息
	                   // System.out.println("接收消息Qos:" + message.getQos());
	                   // System.out.println("接收消息内容1 : " + new String(message.getPayload())); 
	                    
	                    // 从字节流向消息体反序列化
	                    RXPayload pld = g.fromJson(message.toString(), RXPayload.class);
	                    //System.out.println("接收消息内容 2: " +pld);
	                    
	                    getRxAndSave(pld,"cqtiq12345678910");
	                    //message.clearPayload();
	                    message.setPayload(null);
	                    
					}
					
					@Override
					public void deliveryComplete(IMqttDeliveryToken token) {
						// TODO Auto-generated method stub
						
					}
					
					@Override
					public void connectionLost(Throwable cause) {
						//System.out.println("连接断开，可以做重连");
					}

					@Override
					public void connectComplete(boolean reconnect, String serverURI) {
						// TODO Auto-generated method stub
						
					}
					
					
				});  
	            MqttTopic topic = client.getTopic(TOPIC);  
	            //setWill方法，如果项目中需要知道客户端是否掉线可以调用该方法。设置最终端口的通知消息    
	            options.setWill(topic, "close".getBytes(), 2, true);  
	              
	            client.connect(options);
	          /*  if (!client.isConnected()) {
	            client.connect(options);
	                System.out.println("if连接成功");
	            }else {//这里的逻辑是如果连接成功就重新连接
	                client.disconnect();
	                client.connect(new MqttConnectOptions());
	                System.out.println("else连接成功");
	            }*/ 
	            //订阅消息  
	            int[] Qos  = {1};  
	            String[] topic1 = {TOPIC};  
	            client.subscribe(topic1, Qos);  
	            
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
	}
	
	public void getRxAndSave(RXPayload rx,String sKey) throws Exception {
		//HttpServletRequest request = getRequest1();
		//System.out.println("这步执行了"+request);
		SimpleDateFormat sdf1 = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
		SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
		//解密并反序列化FireAlarm
		String decrypt = rx.Decrypt(rx.getData(), sKey);
		FireAlarm firealarm = g.fromJson(decrypt.toString(), FireAlarm.class);
		//将rxpayload反序列化成rxmqtt
	    String RXjson = g.toJson(rx);
	    Rxmqtt rxm = g.fromJson(RXjson.toString(), Rxmqtt.class);
	    
        double smokescope = Double.parseDouble(firealarm.getSmokescope().substring(0, 4));

        //判断data数据中smokescope烟雾浓度数据
        if(smokescope>0.65) {
        	firealarm.setStatus("2");
        	firealarm.setTime(sdf2.format(sdf1.parse(rxm.getTime())));
        }else {
        	firealarm.setStatus("1");
        	firealarm.setTime(sdf2.format(sdf1.parse(rxm.getTime())));
        }
        String data = g.toJson(firealarm);
        rxm.setData(data);
       // System.out.println(CookieUtils.getCookieValue(request, "alarm"));
        //if(!"400".equals(CookieUtils.getCookieValue(request, "alarm"))) {
        	fireAlarmService.saveRireAlarm(rxm);
       // }else {
        	
        //}
	}
	
	
}
