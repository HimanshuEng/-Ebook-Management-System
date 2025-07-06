package com.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String email;
	private String phno;
	private String password;
	private String address;
	private String city;
	private String landmark;
	private String state;
	private String pincode;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public String getPassword() {
		return password;
	}
	
	
	public void setPassword(String password) {
		this.password = password;
	}
	
		
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhno() {
		return phno;
	}
	public void setPhno(String phno) {
		this.phno = phno;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getLandmark() {
		return landmark;
	}
	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPincode() {
		return pincode;
	}
	public void setPincode(String zip) {
		this.pincode = pincode;
	}
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", email=" + email + ", phno=" + phno + ", password=" + password
				+ ", address=" + address + ", city=" + city + ", landmark=" + landmark + ", state=" + state
				+ ", pincode=" + pincode + ", getId()=" + getId() + ", getName()=" + getName() + ", getPassword()="
				+ getPassword() + ", getEmail()=" + getEmail() + ", getPhno()=" + getPhno() + ", getAddress()="
				+ getAddress() + ", getCity()=" + getCity() + ", getLandmark()=" + getLandmark() + ", getState()="
				+ getState() + ", getPincode()=" + getPincode() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
	
	

}
