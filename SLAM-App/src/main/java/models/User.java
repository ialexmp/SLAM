package models;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import managers.ManageUsers;

public class User implements java.io.Serializable {
	
	/*
	 CREATE TABLE `users` (
  		`usr` varchar(255) NOT NULL,
  		`mail` varchar(255) NOT NULL,
  		`pwd` varchar(255) NOT NULL,
  		PRIMARY KEY (`usr`),
  		UNIQUE KEY `mail` (`mail`)
	 ); 
	*/
	
	private static final long serialVersionUID = 1L;
	
	private String firstName = "";
	private String lastName = "";
	private String user = "";
	private String mail = "";
	private String pwd1 = "";
	private String pwd2 = "";
	private boolean terms = false;
	private String birth = "";
	private String phoneNumber = "";
	private String state = "";
	private String securityQuestion = "";
	private String securityAnswer = "";
	private boolean isAdmin = false;
	
	public static boolean[] error = {false,false,false,false,false,false,false,false,false,false,false,false};
	
	public User() {
		
	}
	
	public String getUser() {
		return this.user;
	}
	
	public void setUser(String user) {
		ManageUsers manager = new ManageUsers();
		String regex = "^(?!.*(admin|badword2|badword3))[a-zA-Z0-9_]{4,20}$";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(user);
		if (matcher.matches() && !manager.isUsernameTaken(user)) {
			this.user = user;
		} else {
			error[0] = true;
		}
	}
	
	public void auxiliar_setUser(String user) {	
		this.user = user;
	}
	
	public String getMail() {
		return this.mail;
	}
	
	public void setMail(String mail) {
		String regex = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(mail);
		if (matcher.matches()) {
			this.mail = mail;
		} else {
			error[1]=true;
		}
	}
	
	public String getPwd1() {
		return this.pwd1;
	}
	
	public void setPwd1(String pwd1) {
		String regex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).+$";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(pwd1);
		/* TODO check restriction with pattern */
		if(matcher.matches()) {
			this.pwd1 = pwd1;
		} else {
			error[2] = true;
		}
	}
	
	public String getPwd2() {
		return this.pwd2;
	}
	
	public void setPwd2(String pwd2) {
		/* TODO check restriction with pattern and check if pwd1=pwd2*/
		if ( pwd2 == pwd1) {
			this.pwd2 = pwd2;
		} else {
			error[3] = true;
		}
	}
	
	public boolean[] getError() {
		return error;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		String regex = "^[A-Za-z]+$";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(firstName);
		/* TODO check restriction with pattern */
		if(matcher.matches()) {
			this.firstName = firstName;
		} else {
			error[4] = true;
		}
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		String regex = "^[A-Za-z]+$";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(lastName);
		/* TODO check restriction with pattern */
		if(matcher.matches()) {
			this.lastName = lastName;
		} else {
			error[5] = true;
		}
	}

	public boolean isTerms() {
		return terms;
	}

	public void setTerms(boolean terms) {
		if(terms == true) {
			this.terms = terms;
		} else {
			error[6] = true;
		}
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		String regex = "^\\d{4}-\\d{2}-\\d{2}$";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(birth);
		/* TODO check restriction with pattern */
		if(matcher.matches()) {
			this.birth = birth;
		} else {
			error[7] = true;
		}
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		String regex = "\\+\\d{1,3}[-.\\s]\\d{1,4}[-.\\s]?\\d{1,4}[-.\\s]?\\d{1,4}";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(phoneNumber);
		/* TODO check restriction with pattern */
		if(matcher.matches()) {
			this.phoneNumber = phoneNumber;
		} else {
			error[8] = true;
		}
	}
	
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getSecurityQuestion() {
		return securityQuestion;
	}

	public void setSecurityQuestion(String securityQuestion) {	
		if(!securityQuestion.equals("")) {
			this.securityQuestion = securityQuestion;
		} else {
			error[10] = true;
		}
	}

	public String getSecurityAnswer() {
		return securityAnswer;
	}

	public void setSecurityAnswer(String securityAnswer) {
		String regex = "^(?!.*(nigger|asshole|anal)).{4,}$";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(securityAnswer);
		if (matcher.matches()) {
			this.securityAnswer = securityAnswer;
		} else {
			error[11] = true;
		}
	}

	public boolean isAdmin() {
		return isAdmin;
	}

	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}
		
}
