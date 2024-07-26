package com.model;

public class MemberDTO {
	
	private String id; 
	private String pw; 
	private String name; 
	private String birth; 
	private String phone; 
	private String gender;
	private String kf;
	private String marry; 
	
	public MemberDTO(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}

	public MemberDTO(String id, String pw, String name, String birth, String phone, String gender, String kf,
			String marry) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.birth = birth;
		this.phone = phone;
		this.gender = gender;
		this.kf = kf;
		this.marry = marry;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getKf() {
		return kf;
	}

	public void setKf(String kf) {
		this.kf = kf;
	}

	public String getMarry() {
		return marry;
	}

	public void setMarry(String marry) {
		this.marry = marry;
	}




}