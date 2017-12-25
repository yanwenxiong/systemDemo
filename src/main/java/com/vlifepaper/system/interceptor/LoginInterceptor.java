package com.vlifepaper.system.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/** @author 闫文雄
 * @date 2017年7月10日
 * @version 1.0
 * @description 登陆拦截器，未登录用户不允许访问用户登录后的页面。
 */
public class LoginInterceptor implements HandlerInterceptor {
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object handler) throws Exception{
		HttpSession session = request.getSession();
		Map<String, Object> map = (Map<String, Object>) session.getAttribute("user");
		if(map != null){
			String username = (String) map.get("username");
			if(username != null){
				return true;
			}
		}
		response.sendRedirect(request.getContextPath() + "/home");
		return false;
	}


	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}


	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
}
