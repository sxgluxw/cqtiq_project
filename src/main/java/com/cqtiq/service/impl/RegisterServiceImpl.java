package com.cqtiq.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqtiq.mapper.UserMapper;
import com.cqtiq.pojo.User;
import com.cqtiq.pojo.UserExample;
import com.cqtiq.pojo.UserExample.Criteria;
import com.cqtiq.service.RegisterService;

@Service
public class RegisterServiceImpl implements RegisterService {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public boolean getUserByName(String username) {
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(username);
		List<User> list = userMapper.selectByExample(example );
		if(list.size()>0 && !list.isEmpty()) {
			return true;
		}
		return false;
	}

	@Override
	public void registerSave(User user) {
		userMapper.insert(user);
	}

}
