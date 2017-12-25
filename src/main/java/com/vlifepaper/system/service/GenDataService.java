package com.vlifepaper.system.service;

import java.text.ParseException;
import java.util.Map;

/** @author 闫文雄
 * @date 2017年7月11日
 * @version 1.0
 * @description 生成随机数据，并且将数据插入到数据库中
 */
public interface GenDataService {
	public void storeGenData(String date,int val);
	
	public Map<String, Object> accessGenData(String date) throws ParseException;
}
