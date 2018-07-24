package com.cqtiq.enumeration;

import java.util.ArrayList;
import java.util.List;

public enum DivNumInformation {
	DivNum_One(1,"led001"),
	DivNum_Two(2,"led002"),
	DivNum_Three(3,"led003");
	
	private int num ;
	private String divnum;
	
	private DivNumInformation(int num, String divnum) {
		this.num = num;
		this.divnum = divnum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getDivnum() {
		return divnum;
	}

	public void setDivnum(String divnum) {
		this.divnum = divnum;
	}
	
	/**
	 * 根据num判断枚举值
	 */
	public static DivNumInformation getByNum(Integer num) {
		for (DivNumInformation d : DivNumInformation.values()) {
			if (num.intValue() == d.getNum()) {
				return d ;
			}
		}
		return null;
	}
	
	/**
	 * 获取所有num的集合
	 */
	public static List<Integer> getList(){
		List<Integer> list = new ArrayList<>();
		for (DivNumInformation d : DivNumInformation.values()) {
			list.add(d.num);
		}
		return list;
	}
}
