package com.cqtiq.udp;

import java.io.IOException;
 import java.net.DatagramPacket;
 import java.net.DatagramSocket;
 import java.net.InetAddress;
 import java.net.SocketException;
 
 /*
  * 对于里面创建对象的部分进行优化直接链式编程
  * java.net.BindException: Address already in use: Cannot bind
  * 该端口已经被使用了，有可能是第二次调用或者第一次调用的时候该端口被其它程序使用。
  */
 public class ReceiveDemo {
     public static void main(String[] args) throws IOException {
         // 创建接收端数socket对象,指定端口。
         DatagramSocket ds = new DatagramSocket(10086);
         // 接收数据
         byte[] buf = new byte[1024];
         // int length = buf.length;
         DatagramPacket dp = new DatagramPacket(buf, buf.length);
         ds.receive(dp); // 将接受的数据放进dp数据报包中
         // 解析数据，获取IP地址以及数据报包中的内容
         // InetAddress address = dp.getAddress();
         // String ip = address.getHostAddress();
         // byte[] bys = dp.getData();
         // int len = dp.getLength(); // 数据报包的实际长度
 
         String ip = dp.getAddress().getHostAddress();
         String s = new String(dp.getData(), 0, dp.getLength());

         System.out.println(ip + ":--" + s);
 
         // 释放资源
         ds.close();
 
     }
 }