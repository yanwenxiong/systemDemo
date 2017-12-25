package com.vlifepaper.system.service;

import java.io.UnsupportedEncodingException;  

import javax.mail.MessagingException;  
import javax.mail.internet.MimeMessage;  
  


import org.springframework.beans.factory.annotation.Autowired;  
import org.springframework.mail.javamail.JavaMailSenderImpl;  
import org.springframework.mail.javamail.MimeMessageHelper;  
import org.springframework.stereotype.Service;  

import com.vlifepaper.system.model.MailBean;

/** @author 闫文雄
 * @date 2017年7月17日
 * @version 1.0
 * @description 用163邮箱给用户邮箱发邮件
 */

@Service  
public class MailSenderService {  
    @Autowired  
    private JavaMailSenderImpl javaMailSenderImpl;  
      
    /**  
     * 创建MimeMessage  
     * @param mailBean  
     * @return  
     * @throws MessagingException   
     * @throws UnsupportedEncodingException   
     */  
    public MimeMessage createMimeMessage(MailBean mailBean) throws MessagingException, UnsupportedEncodingException{  
        MimeMessage mimeMessage = javaMailSenderImpl.createMimeMessage();  
        MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");  
        messageHelper.setFrom(mailBean.getFrom(), mailBean.getFromName());   
        messageHelper.setSubject(mailBean.getSubject());    
        messageHelper.setTo(mailBean.getToEmails());    
        messageHelper.setText(mailBean.getContext(), true); // html: true   
        return mimeMessage;  
    }  
      
    public void sendMail(MailBean mailBean) throws UnsupportedEncodingException, MessagingException{  
        MimeMessage msg = createMimeMessage(mailBean);  
        javaMailSenderImpl.send(msg);  
    }  
}  