package com.cqtiq.mapper;

import com.cqtiq.pojo.Echartdata;
import com.cqtiq.pojo.Gas;
import com.cqtiq.pojo.GasExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface GasMapper {
    int countByExample(GasExample example);

    int deleteByExample(GasExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Gas record);

    int insertSelective(Gas record);

    List<Gas> selectByExample(GasExample example);

    Gas selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Gas record, @Param("example") GasExample example);

    int updateByExample(@Param("record") Gas record, @Param("example") GasExample example);

    int updateByPrimaryKeySelective(Gas record);

    int updateByPrimaryKey(Gas record);
    
    List<Gas> selectDescGasData();
    
    void deleteFristData();
    
    Gas selectLastGasData();
}