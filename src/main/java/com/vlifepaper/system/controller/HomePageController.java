package com.vlifepaper.system.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/** @author 闫文雄
 * @date 2017年7月6日
 * @version 1.0
 * @description 此controller旨在为系统首页进行导航
 */
@Controller
@RequestMapping(value="/*")
public class HomePageController {
	private Logger logger = LoggerFactory.getLogger(HomePageController.class);
	
	@RequestMapping(value="/home")
	public String accessHomePage(){
		logger.info("this hahha ");
		return "home";
	}
}
