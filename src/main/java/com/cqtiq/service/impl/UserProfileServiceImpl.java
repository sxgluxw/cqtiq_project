package com.cqtiq.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqtiq.mapper.UserMapper;
import com.cqtiq.pojo.User;
import com.cqtiq.pojo.UserExample;
import com.cqtiq.pojo.Userprofile;
import com.cqtiq.service.UserProfileService;
@Service
public class UserProfileServiceImpl implements UserProfileService {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public User selectUser(String username) {
		UserExample example = new UserExample();
		example.createCriteria().andUsernameEqualTo(username);
		List<User> list = userMapper.selectByExample(example );
		User user  = list.get(0);
		return user;
	}

	@Override
	public User selectUserById(int userid) {
		Integer id = userid;
		User user = userMapper.selectByPrimaryKey(id);
		return user;
	}


	@Override
	public void updateUser(User user) {
		userMapper.updateByPrimaryKey(user);
	}

}
