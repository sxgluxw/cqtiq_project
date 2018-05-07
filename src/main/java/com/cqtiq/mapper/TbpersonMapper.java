package com.cqtiq.mapper;

import com.cqtiq.pojo.Tbperson;
import com.cqtiq.pojo.TbpersonExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbpersonMapper {
    int countByExample(TbpersonExample example);

    int deleteByExample(TbpersonExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Tbperson record);

    int insertSelective(Tbperson record);

    List<Tbperson> selectByExample(TbpersonExample example);

    Tbperson selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Tbperson record, @Param("example") TbpersonExample example);

    int updateByExample(@Param("record") Tbperson record, @Param("example") TbpersonExample example);

    int updateByPrimaryKeySelective(Tbperson record);

    int updateByPrimaryKey(Tbperson record);
}