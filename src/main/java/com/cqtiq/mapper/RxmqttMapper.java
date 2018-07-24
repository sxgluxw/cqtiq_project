package com.cqtiq.mapper;

import com.cqtiq.pojo.Rxmqtt;
import com.cqtiq.pojo.RxmqttExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface RxmqttMapper {
    int countByExample(RxmqttExample example);

    int deleteByExample(RxmqttExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Rxmqtt record);

    int insertSelective(Rxmqtt record);

    List<Rxmqtt> selectByExample(RxmqttExample example);

    Rxmqtt selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Rxmqtt record, @Param("example") RxmqttExample example);

    int updateByExample(@Param("record") Rxmqtt record, @Param("example") RxmqttExample example);

    int updateByPrimaryKeySelective(Rxmqtt record);

    int updateByPrimaryKey(Rxmqtt record);
    
    void deleteFristData();
    
    List<Rxmqtt> selectDescFireData();
}