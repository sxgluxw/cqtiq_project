package com.cqtiq.udp;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;

public class SendThread implements Runnable{

	private DatagramSocket ds ;
	
	
	



	public SendThread(DatagramSocket ds) {
		super();
		this.ds = ds;
	}






	@Override
	public void run() {
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
			
			String line = null;
			
			while((line = br.readLine()) != null) {
				if ("886".equals(line)) {
					break;
				}
				byte[] b = line.getBytes();
				
				DatagramPacket packet = new DatagramPacket(b, b.length,InetAddress.getByName("127.0.0.1"),61002);
				
				ds.send(packet);
				
//				ds.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
}
