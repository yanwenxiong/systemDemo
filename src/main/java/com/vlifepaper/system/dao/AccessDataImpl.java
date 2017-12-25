package com.vlifepaper.system.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

/** @author 闫文雄
 * @date 2017年7月11日
 * @version 1.0
 * @description 保存并且查询点线图数据
 *
 */

public class AccessDataImpl extends JdbcDaoSupport implements AccessData {
	
	/**
	 * @parm String date, int val
	 * @return void
	 * @description 保存动态生成的数据
	 */
	public void store(String date, int val) {
		String sql = "insert into data(date,value) values(?,?)";
		this.getJdbcTemplate().update(sql, new Object[]{date,val});
	}

	/**
	 * @param int id
	 * @return List
	 * @throws ParseException 
	 * @description 读取数据库中的数据
	 */
	public List access(String date) throws ParseException {
		String sql = "select * from data where date > ? limit 0,1";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List list = this.getJdbcTemplate().queryForList(sql, new Object[]{sdf.parse(date)});
		return list;
	}
	
	public List access2(String preDate) throws ParseException {
		String sql = "select * from data where date > ? limit 0,2";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List list = this.getJdbcTemplate().queryForList(sql, new Object[]{sdf.parse(preDate)});
		return list;
	}

}
