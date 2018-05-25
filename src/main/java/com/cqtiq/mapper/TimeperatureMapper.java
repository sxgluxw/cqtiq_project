package com.cqtiq.mapper;

import com.cqtiq.pojo.Timeperature;
import com.cqtiq.pojo.TimeperatureExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TimeperatureMapper {
    int countByExample(TimeperatureExample example);

    int deleteByExample(TimeperatureExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Timeperature record);

    int insertSelective(Timeperature record);

    List<Timeperature> selectByExample(TimeperatureExample example);

    Timeperature selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Timeperature record, @Param("example") TimeperatureExample example);

    int updateByExample(@Param("record") Timeperature record, @Param("example") TimeperatureExample example);

    int updateByPrimaryKeySelective(Timeperature record);

    int updateByPrimaryKey(Timeperature record);
    
    void deleteFristData();
    
    Timeperature selectLastData();
}