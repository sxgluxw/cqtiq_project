package com.cqtiq.mapper;

import com.cqtiq.pojo.Ledlamp;
import com.cqtiq.pojo.LedlampExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface LedlampMapper {
    int countByExample(LedlampExample example);

    int deleteByExample(LedlampExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Ledlamp record);

    int insertSelective(Ledlamp record);

    List<Ledlamp> selectByExample(LedlampExample example);

    Ledlamp selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Ledlamp record, @Param("example") LedlampExample example);

    int updateByExample(@Param("record") Ledlamp record, @Param("example") LedlampExample example);

    int updateByPrimaryKeySelective(Ledlamp record);

    int updateByPrimaryKey(Ledlamp record);
    
    List<Ledlamp> selectLastLedlampData();
    
    List<Ledlamp> selectTimeLedlampData();
}