package com.vlifepaper.system.model;

import org.springframework.stereotype.Component;

/** @author 闫文雄
 * @date 2017年7月7日
 * @version 
 * @description
 *
 */

@Component
public class User {
	//用户的id
	private String userId;
	
	//用户的用户名
	private String userName;
	
	//用户的密码
	private String passwd;
	
	//用户的昵称
	private String nickName;
	
	//用户的生日
	private String authorith;

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public void setAuthorith(String string) {
		this.authorith = string;
	}

	public String getUserId() {
		return userId;
	}

	public String getUserName() {
		return userName;
	}

	public String getPasswd() {
		return passwd;
	}

	public String getNickName() {
		return nickName;
	}

	public String getAuthorith() {
		return authorith;
	}
	
	
}
