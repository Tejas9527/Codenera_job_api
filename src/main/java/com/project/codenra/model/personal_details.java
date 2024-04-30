package com.project.codenra.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;

@Entity
public class personal_details {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String fullname;
	private String Email;
	private Long Phone;
	private String Graduation_details;
	private String master_details;
	private String resumename;
	@Lob
	private byte[] resume;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public Long getPhone() {
		return Phone;
	}

	public void setPhone(Long phone) {
		Phone = phone;
	}

	public String getGraduation_details() {
		return Graduation_details;
	}

	public void setGraduation_details(String graduation_details) {
		Graduation_details = graduation_details;
	}

	public String getMaster_details() {
		return master_details;
	}

	public void setMaster_details(String master_details) {
		this.master_details = master_details;
	}

	public String getResumename() {
		return resumename;
	}

	public void setResumename(String resumename) {
		this.resumename = resumename;
	}

	public byte[] getResume() {
		return resume;
	}

	public void setResume(byte[] resume) {
		this.resume = resume;
	}

	public personal_details(int id, String fullname, String email, Long phone, String graduation_details,
			String master_details,String resumename, byte[] resume) {
		this.id = id;
		this.fullname = fullname;
		this.Email = email;
		this.Phone = phone;
		this.Graduation_details = graduation_details;
		this.master_details = master_details;
		this.resumename=resumename;
		this.resume = resume;
	}

	public personal_details() {
	}
	
}
