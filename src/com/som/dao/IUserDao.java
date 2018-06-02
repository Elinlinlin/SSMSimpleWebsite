package com.som.dao;

import java.util.List;

import com.som.entity.User;

public interface IUserDao {
	public User find(User user);
	public int findRole(User user);
	public void add(User user);
	public int findUid(User user);
	public User findByUid(int uid);
	public User findAll();
	public void delete(int uid);
	public void insert(User user);
	public List<User> findAllUser();
	public void update(User user);
	public List<Integer> findAllUid();
	
}
