package com.vlifepaper.system.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vlifepaper.system.model.CommonUtils;
import com.vlifepaper.system.service.GenDataService;
import com.vlifepaper.system.timer.TimerGenData;

/** @author 闫文雄
 * @date 2017年7月12日
 * @version 1.0
 * @description 为点线图的数据交互请求进行服务
 */

@Controller
@RequestMapping("/logined")
@ResponseBody
public class CurveGraphController {
	@Autowired
	private TimerGenData timerGenData;
	
	@Autowired
	private GenDataService genDataService;
	
	@RequestMapping(value="/curveGraph/changeCron",method=RequestMethod.POST)
	public String setRefreshCron(HttpServletRequest request,HttpServletResponse response){
		String jsonStr = "";
		try {
			jsonStr = CommonUtils.readJsonStr(request);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JSONObject reqJSON = JSONObject.fromObject(jsonStr);
		Integer cron = reqJSON.getInt("cron");
		Integer old_cron = timerGenData.getCron();
		System.out.println("old cron is :" + old_cron);
		//设置获取随机数据的时间间隔
		if(cron != null && !(cron.equals(0)) && !cron.equals(old_cron)){
			timerGenData.setCron(cron);
		}
		return null;
	}
	
	@RequestMapping(value="/curveGraph/getGenData",method=RequestMethod.POST)
	public String getGenData(HttpServletRequest request,HttpServletResponse response) throws ParseException{
		String jsonStr = "";
		try {
			jsonStr = CommonUtils.readJsonStr(request);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JSONObject reqJSON = JSONObject.fromObject(jsonStr);
		String date = reqJSON.getString("date");

		Map<String, Object> map;
		if(date != null && !date.equals("")){
			map = genDataService.accessGenData(date);
			JSONObject respJson = new JSONObject();
			if((Timestamp)map.get("date") != null){
				long respDate = ((Timestamp)map.get("date")).getTime();
				respJson.accumulate("date", respDate);
				respJson.accumulate("value", map.get("value"));

				return respJson.toString();
			}
			
		}
		return null;
	}
}
