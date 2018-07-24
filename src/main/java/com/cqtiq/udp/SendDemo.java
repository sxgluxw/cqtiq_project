package com.cqtiq.udp;

import java.io.IOException;
 import java.net.DatagramPacket;
 import java.net.DatagramSocket;
 import java.net.InetAddress;
 import java.net.SocketException;
 
 public class SendDemo {
     public static void main(String[] args) throws IOException {
         // 发送端socket对象
         DatagramSocket ds = new DatagramSocket();
 
         // 数据打包
        byte[] bys = "java".getBytes();
         // int len = bys.length;
         // InetAddress address = InetAddress.getByName("lpp-PC");
         // int port = 10086;
         
         DatagramPacket dp = new DatagramPacket(bys, bys.length,
                 InetAddress.getByName("192.168.31.174"), 61002);
 
         // 发送数据
         ds.send(dp);
 
         // 释放资源
         ds.close();
     }
 }
