package com.cqtiq.service;

import java.util.List;

import com.cqtiq.pojo.TPermission;
import com.cqtiq.pojo.TRole;
import com.cqtiq.pojo.User;

public interface RealmService {

	List<TRole> findByUser(User user);

	List<TPermission> findByPermission(User user);

}
