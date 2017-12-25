package com.vlifepaper.system.service;

import java.util.Map;

/** @author 闫文雄
 * @date 2017年7月7日
 * @version 1.0
 * @description 账户服务，包括登陆和注册功能
 *
 */

public interface AccountService {
	public Map<String, Object> verifyUser(String account,String passwd);
	
	public void register(String account,String password);
	
	public void storeValidateCode(String email,String validateCode);
	
	public Integer verifyValidateCode(String email,String validateCode);
	
	public void resetPasswd(String email, String passwd);
}
