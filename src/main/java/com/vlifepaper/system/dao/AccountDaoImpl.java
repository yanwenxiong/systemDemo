package com.vlifepaper.system.dao;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

/** @author 闫文雄
 * @date 2017年7月7日
 * @version 1.0
 * @description 数据库服务实现，包括查询用户和插入新用户功能。
 */
public class AccountDaoImpl extends JdbcDaoSupport implements AccountDao {
	/**
	 * @param String account
	 * @return List
	 * @description 查询数据库，提取该用户的记录
	 */
	public List searchUser(String account) {
		String sql = "select * from user where username = ?";
		List list = this.getJdbcTemplate().queryForList(sql,new Object[]{account});
		return list;
	}

	/**
	 * 向数据库中增加新的用户记录
	 * @param account
	 * @param password
	 * @param userId
	 * @return void
	 */
	public void addUser(String account, String password,String userId) {
		String sql = "insert into user(userid,username,password) values(?,?,?)";
		this.getJdbcTemplate().update(sql, new Object[]{userId,account,password});
	}

	/**
	 * 查询某email的验证码条目
	 * @param email
	 * @return List
	 */
	public List searchValidate(String email) {
		String sql = "select * from validate where email = ?";
		List list = this.getJdbcTemplate().queryForList(sql,new Object[]{email});
		return list;
	}

	/**
	 * 将验证码存入数据库中保存
	 * @param email
	 * @param timeStamp
	 * @param validateCode
	 * @return void
	 */
	public void storeValidate(String email, long timeStamp, String validateCode) {
		String sql = "insert into validate values(?,?,?)";
		this.getJdbcTemplate().update(sql,new Object[]{email,validateCode,(new Timestamp(timeStamp))});
	}
	
	/**
	 * 更新用户的验证码
	 * @param email
	 * @param timeStamp
	 * @param validateCode
	 * @return void
	 */
	public void updateValidate(String email, long timeStamp, String validateCode){
		String sql = "update validate set code = ?,time = ? where email = ?";
		this.getJdbcTemplate().update(sql,new Object[]{validateCode,(new Timestamp(timeStamp)),email});
	}

	/**
	 * 重置用户密码
	 * @param email
	 * @param passwd
	 * @return void
	 */
	public void resetPasswd(String email, String passwd) {
		String sql = "update user set password = ? where username = ?";
		this.getJdbcTemplate().update(sql, new Object[]{passwd,email});
	}

}
