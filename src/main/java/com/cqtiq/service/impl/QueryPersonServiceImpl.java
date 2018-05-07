package com.cqtiq.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqtiq.mapper.TbpersonMapper;
import com.cqtiq.pojo.Tbperson;
import com.cqtiq.pojo.TbpersonExample;
import com.cqtiq.pojo.TbpersonExample.Criteria;
import com.cqtiq.pojo.User;
import com.cqtiq.service.QueryPersonService;

@Service
public class QueryPersonServiceImpl implements QueryPersonService {
	
	@Autowired
	private TbpersonMapper tbpersonMapper;

	@Override
	public Tbperson queryPerson(Integer id) {
		Tbperson tbperson = tbpersonMapper.selectByPrimaryKey(id);
		return tbperson;
	}

	@Override
	public List<Tbperson> queryList() {
		TbpersonExample example = new TbpersonExample();
		List<Tbperson> list = tbpersonMapper.selectByExample(example );
		return list;
	}

	@Override
	public void updatePerson(Tbperson tbperson) {
		TbpersonExample example = new TbpersonExample();
		Criteria criteria = example.createCriteria();
		criteria.andIdEqualTo(tbperson.getId());
		tbpersonMapper.updateByExample(tbperson, example );
		tbpersonMapper.updateByPrimaryKey(tbperson);
	}

	@Override
	public void saveUser(Tbperson user) {
		tbpersonMapper.insert(user);
	}

	@Override
	public void deleteUser(int id) {
		tbpersonMapper.deleteByPrimaryKey(id);
	}

}
