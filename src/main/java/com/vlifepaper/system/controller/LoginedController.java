package com.vlifepaper.system.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/** @author 闫文雄
 * @date 2017年7月7日
 * @version 
 * @description
 *
 */
@Controller
@RequestMapping(value="logined")
public class LoginedController {
	
	@RequestMapping(value="home")
	public String loginedSucess(){
		return "loginedHome";
	}
	
	@RequestMapping(value="curveGraph")
	public String getCurveGraph(){
		return "curveGraph";
	}
	
	@RequestMapping(value="histogram")
	public String getHistogram(){
		return "Histogram";
	}

	@RequestMapping(value="bootstrap")
	public String getBootstrap(){
		return "bootstrap";
	}
}
