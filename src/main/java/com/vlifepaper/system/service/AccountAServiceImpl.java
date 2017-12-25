package com.vlifepaper.system.service;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vlifepaper.system.dao.AccountDao;
import com.vlifepaper.system.model.LoginTag;
import com.vlifepaper.system.model.ValidateTag;

/** @author 闫文雄
 * @date 2017年7月7日
 * @version 1.0
 * @description 账户服务实现，包括登陆和注册功能
 *
 */
@Service(value="accountService")
public class AccountAServiceImpl implements AccountService {
	//数据库服务
	@Autowired
	private AccountDao accountDao;
	
	/**
	 * @parm String account, String passwd
	 * @return  Map<String, Object>
	 * @description 查询数据库，验证该用户的登陆
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Map<String, Object> verifyUser(String account, String passwd) {
		Map map = new HashMap();
		List rows = accountDao.searchUser(account);
		Iterator iterator = rows.iterator();
		if(iterator.hasNext()){
			map = (Map) iterator.next();
			String correctPasswd = (String) map.get("password");
			if(passwd.equals(correctPasswd)){
				map.put("msg", LoginTag.SUCCESS);
			}else {
				map.put("msg", LoginTag.ACCOUNT_PASSWD_NOT_MATCH);
			}
		}else {
			map.put("msg", LoginTag.ACCOUNT_NOT_EXIST);
		}
		return map;
 	}

	/**
	 * @parm String account, String password
	 * @return void
	 * @description 用户注册
	 */
	public void register(String account, String password) {
		String userId = generateId();
		accountDao.addUser(account, password, userId);
	}

	/**
	 * @parm String account
	 * @return String
	 * @description 生成用户的userId
	 */
	private String generateId() {
		String userId = UUID.randomUUID().toString().replace("-", "");
		return userId;
	}


	public void storeValidateCode(String email, String validateCode) {
		long timeStamp = (new Date()).getTime();
		List row = accountDao.searchValidate(email);
		Iterator it = row.iterator();
		if(it.hasNext()){
			accountDao.updateValidate(email, timeStamp, validateCode);
		}else{
			accountDao.storeValidate(email, timeStamp, validateCode);
		}
	}

	public Integer verifyValidateCode(String email, String validateCode) {
		long timeStamp = (new Date()).getTime();
		List rows = accountDao.searchValidate(email);
		Iterator it = rows.iterator();
		Map map;
		if(it.hasNext()){
			map = (Map) it.next();
			long storeTimeStamp = ((Timestamp)map.get("time")).getTime();
			if(timeStamp - storeTimeStamp > 24*3600*1000){
				return ValidateTag.VALIDATE_OUTDATE;
			}else{
				String storeValidateCode = (String)map.get("code");
				if(storeValidateCode.equals(validateCode)){
					return ValidateTag.SUCCESS;
				}else{
					return ValidateTag.VALIDATE_NOT_CORRECT;
				}
			}
		}else{
			return ValidateTag.VALIDATE_NOT_EXIST;
		}
	}

	/**
	 * 为账户重置密码
	 * @param email
	 * @param passwd
	 * @return void 
	 */
	public void resetPasswd(String email, String passwd) {
		accountDao.resetPasswd(email,passwd);
	}

}
