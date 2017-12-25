package com.vlifepaper.system.controller;


import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vlifepaper.system.model.CommonUtils;
import com.vlifepaper.system.model.LoginTag;
import com.vlifepaper.system.model.MailBean;
import com.vlifepaper.system.model.RegisterTag;
import com.vlifepaper.system.service.AccountService;
import com.vlifepaper.system.service.MailSenderService;

/** @author 闫文雄
 * @date 2017年7月7日
 * @version 1.0
 * @description 此controller为账户的登陆，注册服务。
 */
@Controller
@RequestMapping(value="/account")
@ResponseBody
public class AccountController {
	//用户账户服务
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private MailSenderService mailSenderService;
	
	/**
	 * @parm HttpServletRequest request,HttpServletResponse response
	 * @return String
	 * @description 账户登陆时，验证账号密码是否匹配。
	 */
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String loginAct(HttpServletRequest request,HttpServletResponse response){
		String requestStr = "";
		try {
			requestStr = CommonUtils.readJsonStr(request);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JSONObject requstJson = JSONObject.fromObject(requestStr);
		
		String account = requstJson.getString("userName");
		String passwd = requstJson.getString("passwd");
		JSONObject responseJson = new JSONObject();
		
		if(account == null || passwd == null){
			responseJson.accumulate("status", LoginTag.PASSWD_OR_ACCOUNT_NULL);
		}else {
			//TODO 检查account和passwd的格式问题
			Map<String,Object> map = accountService.verifyUser(account, passwd);
			Integer msg = (Integer) map.get("msg");
			if(LoginTag.SUCCESS.equals(msg)){
				//TODO FIXME 将map转为object
				request.getSession().setAttribute("user", map);
				responseJson.accumulate("status",LoginTag.SUCCESS);
			}else if (LoginTag.ACCOUNT_NOT_EXIST.equals(msg)) {
				responseJson.accumulate("status", LoginTag.ACCOUNT_NOT_EXIST);
			}else if (LoginTag.ACCOUNT_PASSWD_NOT_MATCH.equals(msg)) {
				responseJson.accumulate("status", LoginTag.ACCOUNT_PASSWD_NOT_MATCH);
			}		
		}
		return responseJson.toString();
	}
			
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String registerAct(HttpServletRequest request,HttpServletResponse response)  {
		String requestStr = "";
		try {
			requestStr = CommonUtils.readJsonStr(request);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		JSONObject requestJson = JSONObject.fromObject(requestStr);
		String account = requestJson.getString("userName-register");
		String passwd = requestJson.getString("passwd-register-first");
		String passwdRepeat = requestJson.getString("passwd-register-second");
		//TODO 进行服务器端的账号密码合法性校验，两次密码一致性校验
		JSONObject responseJson = new JSONObject();
		if(account == null || passwd == null){
			responseJson.accumulate("status", RegisterTag.ACCOUNT_PASSWD_NULL);
		}else if(false){
			//TODO 账号合法性校验
			responseJson.accumulate("status", RegisterTag.ACCOUNT_INVAILD);
		}
		else if(false){
			//TODO 密码合法性校验
			responseJson.accumulate("status", RegisterTag.PASSWD_INVAILD);
		}else if (!(passwd.equals(passwdRepeat))) {
			responseJson.accumulate("status", RegisterTag.PASSWD_NOT_SAME);
		}else {
			Map<String,Object> map = accountService.verifyUser(account, "");
			Integer msg = (Integer) map.get("msg");
			if(LoginTag.ACCOUNT_NOT_EXIST.equals(msg)){
				accountService.register(account, passwd);
				responseJson.accumulate("status", RegisterTag.SUCCESS);
			}
			else {
				responseJson.accumulate("status", RegisterTag.ACCOUNT_ALEADY_EXIST);
			}
		}
		return responseJson.toString();
	}
	
	
	/**
	 * 用户忘记密码时，给用户邮箱发送邮件，用于重置密码
	 * @return null
	 * @throws MessagingException 
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/forgotPasswd/{email}",method=RequestMethod.GET)
	public String sendValidateCode(@PathVariable("email")String email) throws UnsupportedEncodingException, MessagingException{
		String validateCode = CommonUtils.getValidateCode();
        MailBean mailBean = new MailBean();  
        mailBean.setFrom("tjuyanwenxiong@163.com");  
        mailBean.setFromName("闫文雄");  
        mailBean.setSubject("你好");  
        mailBean.setToEmails(new String[]{email});  
        
        accountService.storeValidateCode(email, validateCode);
        StringBuffer sb = new StringBuffer();  
        sb.append("<a href=\"http://localhost:8080/systemDemo2/account/resetPasswd/");  
        sb.append(email);  
        sb.append("/");  
        sb.append(validateCode);  
        sb.append("\"><b>点击这里重置密码</b></a>");  
        sb.append("<label>，您的验证码为：");
        sb.append(validateCode);
        sb.append("，24小时生效，否则重新验证，请尽快重置！</label>");
        
        mailBean.setContext(sb.toString());  
        mailSenderService.sendMail(mailBean); 
		return null;
	}
	
	@RequestMapping(value="/resetPasswd",method=RequestMethod.POST)
	public String resetPasswd(HttpServletRequest request,HttpServletResponse response){
		String email = request.getParameter("email");
		String validateCode = request.getParameter("validateCode");
		String passwd = request.getParameter("passwd");
		Integer res = accountService.verifyValidateCode(email, validateCode);
		if(res.equals(1)){
			accountService.resetPasswd(email,passwd);
		}
		return res.toString();
	}
	
	@RequestMapping(value="/resetPasswd2/{email}/{code}",method=RequestMethod.GET)
	public String resetPasswd2(HttpServletRequest request,HttpServletResponse response){
		
		return null;
	}
}
