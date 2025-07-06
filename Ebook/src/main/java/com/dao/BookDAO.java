package com.dao;

import java.util.List;

import com.model.bookDtls;

public interface BookDAO {
	public int addbook(bookDtls b);
	public List<bookDtls> getAllBooks();
	public bookDtls getbookbyId(int id);
	public int updateeditbook(bookDtls b);
	public int deletebook(int id);
	public List<bookDtls> getNewBook();
	public List<bookDtls> getRecentBook();
	public List<bookDtls> getoldBook();
	public List<bookDtls> getAllRecentBook();
	public List<bookDtls> getAllNewBook();
	public List<bookDtls> getAllOldBook();
	public List<bookDtls> getBookByOld(String email,String cat);
	public int oldBookDelete(String email,String cat,int id);
	public List<bookDtls> getBookBySearch(String ch);

}
