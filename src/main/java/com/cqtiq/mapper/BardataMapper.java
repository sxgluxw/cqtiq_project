package com.cqtiq.mapper;

import com.cqtiq.pojo.Bardata;
import com.cqtiq.pojo.BardataExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BardataMapper {
    int countByExample(BardataExample example);

    int deleteByExample(BardataExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Bardata record);

    int insertSelective(Bardata record);

    List<Bardata> selectByExample(BardataExample example);

    Bardata selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Bardata record, @Param("example") BardataExample example);

    int updateByExample(@Param("record") Bardata record, @Param("example") BardataExample example);

    int updateByPrimaryKeySelective(Bardata record);

    int updateByPrimaryKey(Bardata record);
}