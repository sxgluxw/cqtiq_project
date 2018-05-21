package com.cqtiq.service;

import com.cqtiq.pojo.User;

public interface RegisterService {

	boolean getUserByName(String username);

	void registerSave(User user);

}
