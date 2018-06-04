package com.cqtiq.service;

import com.cqtiq.pojo.Pageuser;
import com.github.pagehelper.PageInfo;

public interface PageUserService{

	PageInfo<Pageuser> findAll(int page, int pageSize);

}
