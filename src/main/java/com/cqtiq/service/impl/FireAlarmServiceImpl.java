package com.cqtiq.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqtiq.mapper.RxmqttMapper;
import com.cqtiq.mapper.TxmqttMapper;
import com.cqtiq.pojo.Rxmqtt;
import com.cqtiq.pojo.Txmqtt;
import com.cqtiq.service.FireAlarmService;

@Service
public class FireAlarmServiceImpl implements FireAlarmService {
	
	@Autowired
	private RxmqttMapper rxmqttMapper;
	
	@Autowired
	private TxmqttMapper txmqttMapper;

	@Override
	public void saveRireAlarm(Rxmqtt rxm) {
		//rxmqttMapper.deleteFristData();
		rxmqttMapper.insert(rxm);
	}

	@Override
	public List<Rxmqtt> getFireData() {
		rxmqttMapper.deleteFristData();
		return rxmqttMapper.selectDescFireData();
	}

	@Override
	public void updateRireAlarm(Rxmqtt rxmqtt) {
		// TODO Auto-generated method stub
		rxmqttMapper.updateByPrimaryKey(rxmqtt);
	}

	@Override
	public void savePushMessage(Txmqtt txm) {
		txmqttMapper.insert(txm);
//		txmqttMapper.deleteFristData();
	}

}
