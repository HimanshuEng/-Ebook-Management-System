package com.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="BookDetails")
public class bookDtls {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int bookid;
	private String bookname;
	private String author;
	private String price;
	private String bookCategory;
	private String status;
	private String photo;
	private String email;
	
	public bookDtls() {
		super();
		// TODO Auto-generated constructor stub
	}
	/*public bookDtls(int bookid, String bookname, String author, String price, String bookCategory, String status,
			String photo, String email) {
		super();
		this.bookid = bookid;
		this.bookname = bookname;
		this.author = author;
		this.price = price;
		this.bookCategory = bookCategory;
		this.status = status;
		this.photo = photo;
		this.email = email;
	}*/
	public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getBookCategory() {
		return bookCategory;
	}
	public void setBookCategory(String bookCategory) {
		this.bookCategory = bookCategory;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "bookDtls [bookid=" + bookid + ", bookname=" + bookname + ", author=" + author + ", price=" + price
				+ ", bookCategory=" + bookCategory + ", status=" + status + ", photo=" + photo + ", email=" + email
				+ ", getBookid()=" + getBookid() + ", getBookname()=" + getBookname() + ", getAuthor()=" + getAuthor()
				+ ", getPrice()=" + getPrice() + ", getBookCategory()=" + getBookCategory() + ", getStatus()="
				+ getStatus() + ", getPhoto()=" + getPhoto() + ", getEmail()=" + getEmail() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	

}
