package com.vlifepaper.system.model;

/** @author 闫文雄
 * @date 2017年7月10日
 * @version 1.0
 * @description 注册请求的服务器状态
 */
public class RegisterTag extends BaseTag{
	//账号密码为空
	public static final Integer ACCOUNT_PASSWD_NULL = -2;
	
	//账号不合法
	public static final Integer ACCOUNT_INVAILD = -3;
	
	//密码不合法
	public static final Integer PASSWD_INVAILD = -4;
	
	//两次密码不一致
	public static final Integer PASSWD_NOT_SAME = -5;
	
	//账户已经存在
	public static final Integer ACCOUNT_ALEADY_EXIST = -6;
}
