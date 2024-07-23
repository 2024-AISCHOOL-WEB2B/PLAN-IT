package com.model;

public class MemberDTO {
	
	private String id; 
	private String pw; 
	private String email; 
	private String addr; 
	private String name; 
	private String birth; 
	private String marry; 
	private String gender;
	
	
	
	
	public MemberDTO(String id, String pw, String email, String addr, String name, String birth, String gender,
			String marry) {
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.addr = addr;
		this.name = name;
		this.birth = birth;
		this.marry = marry;
		this.gender = gender;
	}
	
	
	public MemberDTO(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}




	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getMarry() {
		return marry;
	}
	public void setMarry(String marry) {
		this.marry = marry;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	} 
	
	
	
	
}
