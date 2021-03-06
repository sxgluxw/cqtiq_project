package com.cqtiq.service.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqtiq.mapper.UserMapper;
import com.cqtiq.pojo.User;
import com.cqtiq.pojo.UserExample;
import com.cqtiq.pojo.UserExample.Criteria;
import com.cqtiq.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private UserMapper userMapper;

	@Override
	public User queryUser(String username, String password) {

		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(username);
		List<User> list = userMapper.selectByExample(example);
//		User user = userMapper.selectByPrimaryKey(1);
//		System.out.println("service:"+user+"password:"+password);
//		System.out.println(list.isEmpty());
		if(list.isEmpty()) {
			return null;
		}
		User user = list.get(0);
		if (user != null && user.getPassword().equals(password)) {
			return user;
		}
		return null;
	}

	@Override
	public User findByUsername(String username) {
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(username);
		List<User> list = userMapper.selectByExample(example );
		User user = new User();
		user = list.get(0);
		return user;
	}

}
