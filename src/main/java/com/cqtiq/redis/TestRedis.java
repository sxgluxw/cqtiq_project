package com.cqtiq.redis;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.redis.core.*;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool; 
public class TestRedis {
	private JedisClientPool jedisClientPool;
	
	@Test
	public void testJedisPool() throws Exception {
		// 第一步：创建一个JedisPool对象。需要指定服务端的ip及端口。
		JedisPool jedisPool = new JedisPool("192.168.31.174", 6379);
		// 第二步：从JedisPool中获得Jedis对象。
		Jedis jedis = jedisPool.getResource();
//		jedis.del("jedis");
		// 第三步：使用Jedis操作redis服务器。
		jedis.set("jedis", "test");
		String result = jedis.get("redisToken1");
		System.out.println(result);
		// 第四步：操作完毕后关闭jedis对象，连接池回收资源。
		jedis.close();
		// 第五步：关闭JedisPool对象。
		jedisPool.close();
	}

	@Test
	public void testJedisPool1() throws Exception {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:/applicationContext.xml");
		JedisClient jedisClient = applicationContext.getBean(JedisClient.class);
		jedisClient.set("frist", "100");
		String result = jedisClient.get("frist");
		System.out.println(result);
	}
	
}
