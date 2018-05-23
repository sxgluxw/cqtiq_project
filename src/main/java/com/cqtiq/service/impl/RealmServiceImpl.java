package com.cqtiq.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqtiq.mapper.TPermissionMapper;
import com.cqtiq.mapper.TRoleMapper;
import com.cqtiq.pojo.TPermission;
import com.cqtiq.pojo.TPermissionExample;
import com.cqtiq.pojo.TRole;
import com.cqtiq.pojo.TRoleExample;
import com.cqtiq.pojo.TRoleExample.Criteria;
import com.cqtiq.pojo.User;
import com.cqtiq.service.RealmService;

@Service
public class RealmServiceImpl implements RealmService {

	@Autowired
	private TRoleMapper roleMapper;
	
	@Autowired
	private TPermissionMapper permissionMapper;
	
	@Override
	public List<TRole> findByUser(User user) {
		TRoleExample example = new TRoleExample();
		Criteria criteria = example.createCriteria();
		criteria.andRolenameEqualTo(user.getUsername());
		List<TRole> list = roleMapper.selectByExample(example );
		return list;
	}
	@Override
	public List<TPermission> findByPermission(User user) {
		TPermissionExample example = new TPermissionExample();
		com.cqtiq.pojo.TPermissionExample.Criteria criteria = example.createCriteria();
		criteria.andPermissionnameEqualTo(user.getPassword());
		List<TPermission> list = permissionMapper.selectByExample(example);
		return list;
	}

}
