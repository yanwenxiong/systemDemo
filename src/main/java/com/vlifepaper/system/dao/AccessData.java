package com.vlifepaper.system.dao;

import java.text.ParseException;
import java.util.List;

/** @author 闫文雄
 * @date 2017年7月11日
 * @version 1.0
 * @description 保存并且查询点线图数据
 */
public interface AccessData {
	public void store(String date,int val);
	
	public List access(String date) throws ParseException;
	
	public List access2(String preDate) throws ParseException;
}
