package com.cqtiq.utils;

import java.sql.Timestamp;
import java.util.Date;
import java.util.concurrent.ScheduledExecutorService;

import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallbackExtended;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.eclipse.paho.client.mqttv3.MqttTopic;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cqtiq.enumeration.DivNumInformation;
import com.cqtiq.pojo.Ledlamp;
@Component
public class ReceiveMQ {
	public static final String HOST = "tcp://192.168.31.174:1883";
	public static final String TOPIC = "toclient/124";
	private static final String clientid = "client124";
	private MqttClient client;
	private MqttConnectOptions options;
	private String userName = "admin";
	private String passWord = "password";

	private ScheduledExecutorService scheduler;
	
	@Autowired
	private  RestTemplateUtils restTemplate;

	public void recieveMessage() {
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
			options.setAutomaticReconnect(true);
			// 设置回调
			client.setCallback(new MqttCallbackExtended() {

				@Override
				public void messageArrived(String topic, MqttMessage message) throws Exception {
					// 消息抵达事件回调方法
					// 当客户端接收到消息时会被调用
					// 订阅方法执行时会被调用
					// System.out.println("接收消息主题:" + topic);

					// 获取服务质量信息
					// System.out.println("接收消息Qos:" + message.getQos());
					System.out.println("接收消息内容1 : " + new String(message.getPayload()));

					// 从字节流向消息体反序列化
					// RXPayload pld = g.fromJson(message.toString(), RXPayload.class);
					// System.out.println("接收消息内容 2: " +pld);

					// getRxAndSave(pld,"cqtiq12345678910");
					// message.clearPayload();
					// message.setPayload(null);
//					LedLampServiceImpl ledLampService = new LedLampServiceImpl();
//					ledLampService.saveByData( new String(message.getPayload()));
					try {
						
						String[] data = new String(message.getPayload()).split(";");
						Ledlamp ledlamp = new Ledlamp();
						int num = data.length;
						if (num >= 3) {
							System.out.println("问题");
							if (DivNumInformation.getList().contains(Integer.parseInt(data[0]))) {
								ledlamp.setDevnum(DivNumInformation.getByNum(Integer.parseInt(data[0])).getDivnum());
							}
							ledlamp.setId(1);
							ledlamp.setData(data[2]);
							ledlamp.setPort(Integer.parseInt(data[1]));
							ledlamp.setTime(new Timestamp(new Date().getTime()));
							ledlamp.setGatewaycount(0);
							ledlamp.setGatewayid("dfsdf");
							ledlamp.setLosecount(2);
							System.out.println("问题");
							System.out.println(ledlamp);
							ledlamp.save(restTemplate);
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}

				@Override
				public void deliveryComplete(IMqttDeliveryToken token) {
					// TODO Auto-generated method stub

				}

				@Override
				public void connectionLost(Throwable cause) {
					// System.out.println("连接断开，可以做重连");
				}

				@Override
				public void connectComplete(boolean reconnect, String serverURI) {
					// TODO Auto-generated method stub

				}

			});
			MqttTopic topic = client.getTopic(TOPIC);
			// setWill方法，如果项目中需要知道客户端是否掉线可以调用该方法。设置最终端口的通知消息
			options.setWill(topic, "close".getBytes(), 2, true);

			client.connect(options);
			
			 if (!client.isConnected()) {
	                client.connect(options);
	                System.out.println("连接成功");
	            }else {//这里的逻辑是如果连接成功就重新连接
	                client.disconnect();
	                client.connect(options);
	                System.out.println("连接成功");
	            } 
			// 订阅消息
			int[] Qos = { 1 };
			String[] topic1 = { TOPIC };
			client.subscribe(topic1, Qos);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		ReceiveMQ mqclient = new ReceiveMQ();
		mqclient.recieveMessage();
	}
	
	
}
