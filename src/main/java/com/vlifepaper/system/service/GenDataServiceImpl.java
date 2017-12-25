package com.vlifepaper.system.service;

import java.text.ParseException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vlifepaper.system.dao.AccessData;

/** @author 闫文雄
 * @date 2017年7月11日
 * @version 1.0
 * @description 生成随机数据，并且将数据插入到数据库中
 */
@Service(value="genDataService")
public class GenDataServiceImpl implements GenDataService {
	//操纵存取点线图数据的dao层
	@Autowired
	private AccessData accessData;
	
	/**
	 * @param String date, int val
	 * @return void
	 * @description 将动态生成的数据插入数据库
	 */
	public void storeGenData(String date, int val) {
		this.accessData.store(date, val);
	}

	/**
	 * @param int id
	 * @return Map<String,Object>
	 * @throws ParseException 
	 * @description 读取已经保存好的点线图数据
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Map<String, Object> accessGenData(String date) throws ParseException {
		List row  = this.accessData.access(date);
		Iterator iterator = row.iterator();
		Map<String, Object> map = new HashMap<String, Object>();
		if(iterator.hasNext()){
			map = (Map<String, Object>) iterator.next();
		}
		return map;
	}

}
