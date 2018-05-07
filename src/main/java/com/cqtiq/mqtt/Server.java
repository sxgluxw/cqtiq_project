package com.cqtiq.mqtt;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.eclipse.paho.client.mqttv3.MqttDeliveryToken;
  import org.eclipse.paho.client.mqttv3.MqttException;
  import org.eclipse.paho.client.mqttv3.MqttMessage;
 import org.eclipse.paho.client.mqttv3.MqttPersistenceException;
  import org.eclipse.paho.client.mqttv3.MqttTopic;
 import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;
 /**
  * 
  * Title:Server
  * Description: 服务器向多个客户端推送主题，即不同客户端可向服务器订阅相同主题
  * @author chenrl
  * 2016年1月6日下午3:29:28
  */
 public class Server {
 
//     public static final String HOST = "tcp://192.168.1.3:61613";
     public static final String HOST = "tcp://127.0.0.1:61613";
//     public static final String HOST = "tcp://192.168.31.174:1883";
     public static final String TOPIC = "toclient/124";
     public static final String TOPIC125 = "toclient/125";
     private static final String clientid = "server";
 
     private MqttClient client;
     public MqttTopic topic;
     private MqttTopic topic125;
     private String userName = "admin";
     private String passWord = "password";
 
     public MqttMessage message;
 
     public Server() throws MqttException {
         // MemoryPersistence设置clientid的保存形式，默认为以内存保存
         client = new MqttClient(HOST, clientid, new MemoryPersistence());
         connect();
     }
 
     private void connect() {
         MqttConnectOptions options = new MqttConnectOptions();
         options.setCleanSession(false);
         options.setUserName(userName);
         options.setPassword(passWord.toCharArray());
         // 设置超时时间
         options.setConnectionTimeout(10); 
         // 设置会话心跳时间
         options.setKeepAliveInterval(20);  
         //断线做重新连接。
//         options.setAutomaticReconnect(true);
         try {
             client.setCallback(new PushCallback());
            
             
             if (!client.isConnected()) {
                 client.connect(options);
                 System.out.println("连接成功");
             }else {//这里的逻辑是如果连接成功就重新连接
                 client.disconnect();
                 client.connect(new MqttConnectOptions());
                 System.out.println("连接成功");
             }
             
             topic = client.getTopic(TOPIC);
             topic125 = client.getTopic(TOPIC125);
         } catch (Exception e) {
             e.printStackTrace();
         }
     }

     public void publish(MqttTopic topic , MqttMessage message) throws MqttPersistenceException,
             MqttException {
         MqttDeliveryToken token = topic.publish(message);
         token.waitForCompletion();
         System.out.println("message is published completely! "
                 + token.isComplete());
     }
 
     public static void main(String[] args) throws MqttException {
  /*       Server server = new Server();
 
        server.message = new MqttMessage();
         server.message.setQos(2);
         server.message.setRetained(true);
         server.message.setPayload("给客户端124推送的信息".getBytes());
         System.out.println(new String(server.message.getPayload()));
         server.publish(server.topic , server.message);
         
         
         server.message = new MqttMessage();
         server.message.setQos(2);
         server.message.setRetained(true);
         server.message.setPayload("给客户端125推送的信息".getBytes());
         System.out.println(new String(server.message.getPayload()));
         server.publish(server.topic125 , server.message);
 
         System.out.println(server.message.isRetained() + "------ratained状态");*/
     }
 }