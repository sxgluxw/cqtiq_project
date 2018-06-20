package com.cqtiq.pojo;

public class Userprofile {
	private int userid;
	private String username;
	private String old_password;
	private String password;
	private String re_password;
	private String email;
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getOld_password() {
		return old_password;
	}
	public void setOld_password(String old_password) {
		this.old_password = old_password;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRe_password() {
		return re_password;
	}
	public void setRe_password(String re_password) {
		this.re_password = re_password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "Userprofile [userid=" + userid + ", username=" + username + ", old_password=" + old_password
				+ ", password=" + password + ", re_password=" + re_password + ", email=" + email + "]";
	}
	
	
}
