package com.vlifepaper.system.model;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/** @author 闫文雄
 * @date 2017年7月7日
 * @version 1.0
 * @description 常用的工具类
 */
public class CommonUtils {
	//jackson用来转换json的对象
	private static ObjectMapper objectMapper = new ObjectMapper();
	
	
	/**
	 * @param json
	 * @return Map<String,Object>
	 * @description 将最简单的json字符串转为map
	 */
	@SuppressWarnings("unchecked")
	public static Map<String, Object> json2Map(String json){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = objectMapper.readValue(json, Map.class);
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map;
	}
	
	
	/**
	 * @parm HttpServletRequest request
	 * @return String
	 * @throws UnsupportedEncodingException 
	 * @description 读取request中的json字符信息
	 */
	public static String readJsonStr(HttpServletRequest request) throws UnsupportedEncodingException{
		StringBuffer sb = new StringBuffer();
		String line = "";
		try {
			BufferedReader reader = request.getReader();
			while((line = reader.readLine()) != null){
				sb.append(line);
			}
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String requestStr = URLDecoder.decode(sb.toString(), "utf-8");
		return requestStr;
	}
	
	/**
	 * @return int
	 * @description 生成1000-10000之间的随机数，包括两端
	 */
	public static int randomVal(){
		Random random = new Random((new Date()).getTime());
		return (random.nextInt(9001) + 1000);
	}
	
	/**
	 * @return String
	 * @description 获取当前时间，以yyyy-MM-dd HH:mm:ss形式给出
	 */
	public static String getTime(){
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(date);
	}
	
	/**
	 * 生成6位随机数字
	 * @param 
	 * @return String
	 */
	public static String getValidateCode(){
		Random random = new Random((new Date()).getTime());
		StringBuffer sb = new StringBuffer();
		for(int i = 0; i < 6; i++){
			sb.append(random.nextInt(10));
		}
		return sb.toString();
	}
}
