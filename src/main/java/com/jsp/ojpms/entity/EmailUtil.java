package com.jsp.ojpms.entity;


import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtil {
	
	private static final String FROM="divyamahajan3003@gmail.com";
	private static final String PASSWORD="aybzvuaykseqyuhn";
	
	public static void sendEmail(String to, String subject,String textMessage)
	{
		Properties properties = new Properties();
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		
		
		Session session=Session.getDefaultInstance(properties, new Authenticator() {
                                 protected PasswordAuthentication getPasswordAuthentication() {
                                	   return new PasswordAuthentication(FROM,PASSWORD);
                                	 
                                 }
			
			
								});
		
		try {
		  Message message = new MimeMessage(session);
		  message.setSubject(subject);
		  message.setText(textMessage);
		  message.setFrom(new InternetAddress(FROM));
		  message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
		   
		  Transport.send(message);
		  System.out.println("EMAIL SENT....");
		}catch(Exception e) {
			
			e.printStackTrace();
		}
				
				
	}

}
