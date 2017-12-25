package com.vlifepaper.system.model;

/** @author 闫文雄
 * @date 2017年7月18日
 * @version 1.0
 * @description 验证码相关操作的状态
 */
public class ValidateTag extends BaseTag{
	//验证码不存在
	public static final Integer VALIDATE_NOT_EXIST = -2;
	
	//验证码过期
	public static final Integer VALIDATE_OUTDATE = -3;
	
	//验证码不正确
	public static final Integer VALIDATE_NOT_CORRECT = -4;
}
