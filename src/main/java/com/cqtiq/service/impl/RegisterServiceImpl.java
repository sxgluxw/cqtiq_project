package com.cqtiq.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqtiq.mapper.TPermissionMapper;
import com.cqtiq.mapper.TRoleMapper;
import com.cqtiq.mapper.UserMapper;
import com.cqtiq.pojo.TPermission;
import com.cqtiq.pojo.TRole;
import com.cqtiq.pojo.TRoleExample;
import com.cqtiq.pojo.User;
import com.cqtiq.pojo.UserExample;
import com.cqtiq.pojo.UserExample.Criteria;
import com.cqtiq.service.RegisterService;

@Service
public class RegisterServiceImpl implements RegisterService {

	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private TPermissionMapper permissionMapper;
	
	@Autowired
	private TRoleMapper roleMapper;
	
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
		//根据用户注册的名字保存role权限
		TRole role = new TRole();
		role.setRolename(user.getUsername());
		roleMapper.insert(role);
		
		//注册用户
		userMapper.insert(user);

		//根据role增加permission
		TRoleExample example = new TRoleExample();
		example.createCriteria().andRolenameEqualTo(user.getUsername());
		List<TRole> list = roleMapper.selectByExample(example );
		Integer id = list.get(0).getId();
		
		TPermission permission = new TPermission();
		permission.setPermissionname(user.getUsername()+":*");
		permission.setRoleid(id);
		permissionMapper.insert(permission);
	}

}
