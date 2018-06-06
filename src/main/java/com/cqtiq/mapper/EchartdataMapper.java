package com.cqtiq.mapper;

import com.cqtiq.pojo.Echartdata;
import com.cqtiq.pojo.EchartdataExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EchartdataMapper {
    int countByExample(EchartdataExample example);

    int deleteByExample(EchartdataExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Echartdata record);

    int insertSelective(Echartdata record);

    List<Echartdata> selectByExample(EchartdataExample example);

    Echartdata selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Echartdata record, @Param("example") EchartdataExample example);

    int updateByExample(@Param("record") Echartdata record, @Param("example") EchartdataExample example);

    int updateByPrimaryKeySelective(Echartdata record);

    int updateByPrimaryKey(Echartdata record);
    
    Echartdata selectLastEchartData();
    
    void deleteFristData();
}