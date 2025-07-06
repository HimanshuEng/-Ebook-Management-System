package com.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Cart {
	@Id
    @GeneratedValue
    (strategy = GenerationType.IDENTITY)
	private int cid;
	private int bid;
	private int uid;
	private String bookName;
	private String author;
	private double price;
	private double totalPrice;
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getBid() {
		return bid;
	}
	@Override
	public String toString() {
		return "cart [cid=" + cid + ", bid=" + bid + ", uid=" + uid + ", bookName=" + bookName + ", author=" + author
				+ ", price=" + price + ", totalPrice=" + totalPrice + "]";
	}
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

}
