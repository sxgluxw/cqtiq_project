package com.cqtiq.udp;

import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;

public class UDFMain {
	public static void main(String[] args) {
		
		/*InetAddress address;
		try {
			address = InetAddress.getByName("192.168.31.174");
			String name = address.getHostName();
			System.out.println(name);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
		try {
			DatagramSocket dsSend = new DatagramSocket();
//			DatagramSocket dsReceive0 = new DatagramSocket(61000);
//			DatagramSocket dsReceive1 = new DatagramSocket(61001);
			DatagramSocket dsReceive2 = new DatagramSocket(61002);
			
			SendThread st = new SendThread(dsSend);
//			ReceiveThread rt0 = new ReceiveThread(dsReceive0);
//			ReceiveThread rt1 = new ReceiveThread(dsReceive1);
			ReceiveThread rt2 = new ReceiveThread(dsReceive2);
			// 线程开启
			Thread sendThread = new Thread(st);
//			Thread receiverThread0 = new Thread(rt0);
//			Thread receiverThread1 = new Thread(rt1);
			Thread receiverThread2 = new Thread(rt2);
			
			sendThread.start();
//			 receiverThread0.start();
//			 receiverThread1.start();
			 receiverThread2.start();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
