package com.cqtiq.mapper;

import com.cqtiq.pojo.Pageuser;
import com.cqtiq.pojo.PageuserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PageuserMapper {
    int countByExample(PageuserExample example);

    int deleteByExample(PageuserExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Pageuser record);

    int insertSelective(Pageuser record);

    List<Pageuser> selectByExample(PageuserExample example);

    Pageuser selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Pageuser record, @Param("example") PageuserExample example);

    int updateByExample(@Param("record") Pageuser record, @Param("example") PageuserExample example);

    int updateByPrimaryKeySelective(Pageuser record);

    int updateByPrimaryKey(Pageuser record);
    
    List<Pageuser> selectAll();
}