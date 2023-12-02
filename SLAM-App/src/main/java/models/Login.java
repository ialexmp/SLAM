package models;
import managers.ManageUsers;

public class Login {

	private String user = "";
	private String pwd1 = "";
	private String newpwd = "";
	private String newpwd2 = "";
	private String securityQuestion = "";
	private String securityAnswer = "";
	private boolean[] error = {false,false,false,false};
	
	public String getUser(){
		return this.user;
	}
	
	public void setUser(String user){
		ManageUsers manager = new ManageUsers();
		if (manager.checkUser(user) && !isComplete()) {
			this.user = user;
		} else {
			error[0] = true;
		}
	}
	
	public String getPwd1() {
		return this.pwd1;
	}

	public void setPwd1(String pwd1) {
		ManageUsers manager = new ManageUsers();
		if (manager.checkPwd(this.user, pwd1)) {
			this.pwd1 = pwd1;
		} else {
			error[1] = true;
		}
	}

	public String getNewpwd() {
		return newpwd;
	}

	public void setNewpwd(String newpwd) {
		ManageUsers manager = new ManageUsers();
		if (manager.checkPwd(this.user, newpwd)) {
			error[2] = true;
		} else {
			if (manager.updatePwd(this.user, newpwd)) {
				this.newpwd = newpwd;
			}
		}
	}

	public String getNewpwd2() {
		return newpwd2;
	}

	public void setNewpwd2(String newpwd2) {
		if(this.newpwd == newpwd2) {
			this.newpwd2 = newpwd2;
		}
	}


	public String getSecurityQuestion() {
		return securityQuestion;
	}

	public void setSecurityQuestion() {
		ManageUsers manager = new ManageUsers();
		this.securityQuestion = manager.getSecurityQuestionAndAnswer(this.user)[0];
	}

	public String getSecurityAnswer() {
		return this.securityAnswer;
	}

	public void setSecurityAnswer(String securityAnswer) {
		ManageUsers manager = new ManageUsers();
		if (securityAnswer.equals(manager.getSecurityQuestionAndAnswer(this.user)[1])) {
			this.securityAnswer = securityAnswer;
		} else {
			error[3] = true;
		}
	}
	
	
	public boolean[] getError() {
		return error;
	}
	
	public boolean isComplete() {
		System.out.println("\n\nSecurityAnswer: "+ this.securityAnswer);
		System.out.println("User:" + this.user);
		System.out.println("Newpwd: "+ this.newpwd);
		if((hasValue(this.user) && hasValue(this.pwd1)) || (hasValue(this.securityAnswer) && hasValue(this.newpwd))) {
		    return true;
		}
		return false;
	}
	
	private boolean hasValue(String val) {
		return((val != null) && (!val.equals("")));
	}



	
}