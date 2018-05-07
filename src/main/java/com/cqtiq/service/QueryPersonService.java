package com.cqtiq.service;

import java.util.List;

import com.cqtiq.pojo.Tbperson;
import com.cqtiq.pojo.User;

public interface QueryPersonService {

	Tbperson queryPerson(Integer id);

	List<Tbperson> queryList();

	void updatePerson(Tbperson tbperson);

	void saveUser(Tbperson user);

	void deleteUser(int parseInt);

}
