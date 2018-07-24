package com.cqtiq.utils;


import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.cqtiq.utils.ReceiveMQ;

public class MqttUtils implements ServletContextListener{

	
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("小或");
		arg0.notify();
		
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("执行了");
		ServletContext context = arg0.getServletContext();
		System.out.println(context);
		ReceiveMQ.main(null);
	}
	
}
