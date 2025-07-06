package com.dao;

import java.util.List;

import com.model.User;

public interface UserDAO {
	public int userRegister(User us);
	public User login(String email,String password);
	public boolean updateProfile(User us);
	public boolean checkUser(String em);

}
