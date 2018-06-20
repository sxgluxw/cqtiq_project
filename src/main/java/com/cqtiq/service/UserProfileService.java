package com.cqtiq.service;

import com.cqtiq.pojo.User;
import com.cqtiq.pojo.Userprofile;

public interface UserProfileService {

	User selectUser(String username);

	User selectUserById(int userid);


	void updateUser(User user);

}
