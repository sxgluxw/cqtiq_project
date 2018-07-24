package com.cqtiq.service.impl;



import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cqtiq.mapper.LedlampMapper;
import com.cqtiq.pojo.Ledlamp;
import com.cqtiq.service.LedLampService;

@Service
public class LedLampServiceImpl implements LedLampService {

	@Autowired
	private LedlampMapper ledlampMapper;

	@Override
	public void saveByData(Ledlamp l ) {
		ledlampMapper.insert(l);
	}

	@Override
	public List<Ledlamp> selecetStatus() {
		List<Ledlamp> list = ledlampMapper.selectLastLedlampData();
		return list;
	}

	@Override
	public List<Integer> selectTimeData() {
		Date nowDate = new Date();
		Calendar calendar = Calendar.getInstance();  
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
		
		
		List<Ledlamp> list = ledlampMapper.selectTimeLedlampData();
//		System.out.println(list);
		
		List<Integer> listCount = new ArrayList<>();
		listCount.add(list.size());
		
		int count = 0;
		calendar.setTime(nowDate);
		int timecount =0;
		int desc = 7;
		while (desc > 0) {
			calendar.add(calendar.DATE, timecount);
//			System.out.println(calendar.getTime());
//			System.out.println(timecount);
			for (Ledlamp ledlamp : list) {
				if(sdf.format(calendar.getTime()).equals(sdf.format(ledlamp.getTime()))) {
					count++;
				}
			}
			listCount.add(count);
			count = 0;
			if(timecount == 0) {
				timecount --;
			}
			desc--;
		}
		Collections.reverse(listCount);
//		System.out.println(listCount);
		return listCount;
	}

	

}
