package com.vlifepaper.system.dao;


import java.util.List;

/** @author 闫文雄
 * @date 2017年7月7日
 * @version  1.0
 * @description 数据库服务，包括查询用户和插入新用户功能。
 */

public interface AccountDao {
	public List searchUser(String account);
	
	public void addUser(String account,String password,String userId);
	
	public List searchValidate(String email);
	
	public void storeValidate(String email,long timeStamp,String validateCode);
	
	public void updateValidate(String email,long timeStamp,String validateCode);

	public void resetPasswd(String email, String passwd);
}
