package com.som.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.som.dao.IUserDao;
import com.som.entity.User;

@Service
@CacheConfig(cacheNames = "SysUser")
public class UserService {
	@Resource
	IUserDao userDao;
	
	@Transactional(readOnly = true)
	@Cacheable(value="user",key="checkLogin" )
	public boolean checkLogin(User user){
		if(userDao.find(user)!=null){
			return true;
		}
		else{
			return false;
		}
		
	}
	
	@Cacheable(value="user",key="findRole")
	public int findRole(User user){
		return userDao.findRole(user);
	}
	
	@Cacheable(value="user",key="findUsername")
	public String findUsername(User user){
		String username = null;
		username = user.getUsername();
		return username;
	}
	
	@Cacheable(value="user",key="findUid")
	public int findUid(User user){
		return userDao.findUid(user);
	}

	
	@CachePut(value="user",key="register")
	public void register(User user){
		userDao.add(user);
	}
	
	@Cacheable(value="user",key="findByUid")
	public User findByUid(int uid){
		User user = null;
		user = userDao.findByUid(uid);
		return user;
	}
	
	@Cacheable(value="user",key="findAllUser")
	public List<User> findAllUser(){
		return userDao.findAllUser();
	}
	
	@Cacheable(value="user",key="deleteUserById")
	public void deleteUserById(int uid){
		userDao.delete(uid);
	}
	
	@Cacheable(value="user",key="update")
	public void update(User user){
		userDao.update(user);
	}
	
	@Cacheable(value="user",key="findAllUid")
	public List<Integer> findAllUid(){
		return userDao.findAllUid();
	}
	
	/* ≤‚ ‘ª∫¥Ê
	 @Cacheable(value="UserUid",key="'uid_'+#uid")  
	public User getTestById(int uid) {  
	    return this.userDao.findByUid(uid);  
	}  
	      
	 @CacheEvict(value="UserUid",key="'uid_'+#uid")  
	 public void removeTestById(int uid) {  
	          
	 }  
	 */
}
