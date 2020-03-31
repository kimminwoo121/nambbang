package co.nambbang.app.login;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.nambbang.app.common.Command;
import co.nambbang.app.dao.UsersDao;
import co.nambbang.app.login.util.Gmail;
import co.nambbang.app.login.util.SHA256;

public class AjaxIdPwCheck implements Command {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UsersDao dao = new UsersDao();
		String name = request.getParameter("username");
		String email = request.getParameter("email");
		
		String id=dao.emailFromidSearch(email);
		
		dao = new UsersDao();
		int check = dao.userIdPwCertification(name, email);
		
		if (check == 2) {// 존재 name,email
			
			StringBuffer temp = new StringBuffer();
			Random rnd = new Random();
			for (int i = 0; i < 5; i++) {
				int rIndex = rnd.nextInt(3);
				switch (rIndex) {
				case 0:
					// a-z
					temp.append((char) ((int) (rnd.nextInt(26)) + 97));
					break;
				case 1:
					// A-Z
					temp.append((char) ((int) (rnd.nextInt(26)) + 65));
					break;
				case 2:
					// 0-9
					temp.append((rnd.nextInt(10)));
					break;
				}
			}
		
			String temp2=temp.toString();
			dao = new UsersDao();
			int cer = dao.certificationUpdate(temp2,name,id,email);
			
			
			String host = "http://localhost:9090/yedamFinallProject";
			String from = "dhdyd227227@gmail.com";
			String to = "dhdyd227@naver.com";// 메일보내는 이메일
			String subject = "예담프로젝트를 위한 이메일 인증 메일";
			String content = "인증번호는 '" + temp + "' 입니다.";

			SHA256.getSHA256("dhdyd227@naver.com"); // 받는사람

			Properties p = new Properties();
			p.put("mail.smtp.user", from);
			p.put("mail.smtp.host", "smtp.googlemail.com");
			p.put("mail.smtp.port", "465");
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.debug", "true");
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback", "false");

			Authenticator auth = new Gmail();
			Session ses = Session.getInstance(p, auth);
			ses.setDebug(true);
			MimeMessage msg = new MimeMessage(ses);
			Address fromAddr = null;
			Address toAddr = null;

			try {
				fromAddr = new InternetAddress(from);
				toAddr = new InternetAddress(to);
			} catch (AddressException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				msg.setSubject(subject);
				msg.setFrom(fromAddr);
				msg.addRecipient(Message.RecipientType.TO, toAddr);
				msg.setContent(content, "text/html;charset=UTF8");
				Transport.send(msg);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			return "ajax:1"+id;
			
		} else {
			return "ajax:0"; //일치안함
			
		}

		
	}

}
