package com.vlifepaper.system.model;

/** @author 闫文雄
 * @date 2017年7月7日
 * @version 1.0
 * @description 登陆请求的服务器状态
 *
 */
public class LoginTag extends BaseTag{
	//账号或者密码为空
	public static final Integer PASSWD_OR_ACCOUNT_NULL = -2; 
	
	//账号不存在
	public static final Integer ACCOUNT_NOT_EXIST = -3;
	
	//账号密码不匹配
	public static final Integer ACCOUNT_PASSWD_NOT_MATCH = -4;
}
