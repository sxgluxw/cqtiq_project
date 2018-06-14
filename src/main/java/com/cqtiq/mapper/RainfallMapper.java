package com.cqtiq.mapper;

import com.cqtiq.pojo.Rainfall;
import com.cqtiq.pojo.RainfallExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface RainfallMapper {
    int countByExample(RainfallExample example);

    int deleteByExample(RainfallExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Rainfall record);

    int insertSelective(Rainfall record);

    List<Rainfall> selectByExample(RainfallExample example);

    Rainfall selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Rainfall record, @Param("example") RainfallExample example);

    int updateByExample(@Param("record") Rainfall record, @Param("example") RainfallExample example);

    int updateByPrimaryKeySelective(Rainfall record);

    int updateByPrimaryKey(Rainfall record);
    
    List<Rainfall> selectDescRainData();
    
    void deleteFristData();
    
    Rainfall selectFirstRainData();
}