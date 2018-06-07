package com.cqtiq.mapper;

import com.cqtiq.pojo.LineSections;
import com.cqtiq.pojo.LineSectionsExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface LineSectionsMapper {
    int countByExample(LineSectionsExample example);

    int deleteByExample(LineSectionsExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(LineSections record);

    int insertSelective(LineSections record);

    List<LineSections> selectByExample(LineSectionsExample example);

    LineSections selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") LineSections record, @Param("example") LineSectionsExample example);

    int updateByExample(@Param("record") LineSections record, @Param("example") LineSectionsExample example);

    int updateByPrimaryKeySelective(LineSections record);

    int updateByPrimaryKey(LineSections record);
    
    List<LineSections> selectDescLineData();
    
    void deleteFristData();
}