package com.cqtiq.mapper;

import com.cqtiq.pojo.Rxmqtt;
import com.cqtiq.pojo.Txmqtt;
import com.cqtiq.pojo.TxmqttExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TxmqttMapper {
	int countByExample(TxmqttExample example);

	int deleteByExample(TxmqttExample example);

	int deleteByPrimaryKey(Integer id);

	int insert(Txmqtt record);

	int insertSelective(Txmqtt record);

	List<Txmqtt> selectByExample(TxmqttExample example);

	Txmqtt selectByPrimaryKey(Integer id);

	int updateByExampleSelective(@Param("record") Txmqtt record, @Param("example") TxmqttExample example);

	int updateByExample(@Param("record") Txmqtt record, @Param("example") TxmqttExample example);

	int updateByPrimaryKeySelective(Txmqtt record);

	int updateByPrimaryKey(Txmqtt record);

	void deleteFristData();

	List<Txmqtt> selectDescFireData();
}