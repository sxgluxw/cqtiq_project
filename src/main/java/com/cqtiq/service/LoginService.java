package com.cqtiq.service;

import com.cqtiq.pojo.User;

public interface LoginService {

	User queryUser(String username,String password);

}
