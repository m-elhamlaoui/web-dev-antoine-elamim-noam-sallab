package com.inpt.beans;

public class User {
	private String name;
	private String email;
	private String pass;
	private String repass;
	private String mobile;
	
	public String getName() {
		return name;
	}
	public void setName(String name) throws BeanException{
		if (name == null || name.equals("")) {
			throw new BeanException("InvalidUname");
		} else {
			this.name = name;
		}
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) throws BeanException {
		if (email == null || email.equals("")) {
			throw new BeanException("InvalidUemail");
		} else {
			this.email = email;
		}
	}
	
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) throws BeanException {
		if (pass == null || pass.equals("")) {
			throw new BeanException("InvalidUpwd");
		} else if (pass.length()<8) {
			throw new BeanException("WeakUpwd");
		} else {
			this.pass = pass;
		}
	}
	
	public String getRepass() {
		return repass;
	}
	public void setRepass(String repass) throws BeanException {
		if (!repass.equals(pass)) {
			throw new BeanException("InvalideConfirmePwd");
		} else {
			this.repass = pass;
		}
	}
	
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) throws BeanException {
		if (mobile == null || mobile.equals("")) {
			throw new BeanException("InvalidUmobile");
		} else if (mobile.length() != 10) {
			throw new BeanException("InvalidMobileLength");
		} else {
			this.mobile = mobile;
		}
	}
	
}
