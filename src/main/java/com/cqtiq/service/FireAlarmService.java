package com.cqtiq.service;

import java.util.List;

import com.cqtiq.pojo.Rxmqtt;
import com.cqtiq.pojo.Txmqtt;

public interface FireAlarmService {

	void saveRireAlarm(Rxmqtt rxm);

	List<Rxmqtt> getFireData();

	void updateRireAlarm(Rxmqtt rxmqtt);

	void savePushMessage(Txmqtt txm);

}
