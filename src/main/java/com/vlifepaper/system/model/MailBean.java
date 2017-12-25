package com.vlifepaper.system.model;

/** @author 闫文雄
 * @date 2017年7月17日
 * @version 1.0
 * @description 邮件内容bean
 */
public class MailBean {
	//邮件发送人
	private String from;  
	
	//邮件发送人账号
    private String fromName;  
    
    //发给哪些人
    private String[] toEmails;  
    
    //邮件主题
    private String subject;  
    
    //邮件正文
	private String context; 
    
    public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getFromName() {
		return fromName;
	}

	public void setFromName(String fromName) {
		this.fromName = fromName;
	}

	public String[] getToEmails() {
		return toEmails;
	}

	public void setToEmails(String[] strings) {
		this.toEmails = strings;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}
}
