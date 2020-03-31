package co.nambbang.app.login.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator{
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("dhdyd227227@gmail.com", "@rlaqkq1212");
	}
}
