package com.som.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.som.dao.IUserDao;
import com.som.entity.User;


/*
 * 基于标注的缓存demo
 */
@Service
public class UserServiceImpl extends UserService{

	@Autowired
	private IUserDao userDao;

	@Cacheable(value="common",key="'uid_'+#uid")
	/*
	 *方法的值的返回值得到缓存 value为缓存地址 新的方法执行前若缓存中含有相同key则直接从缓存返回结果
	 */
	public User selectByUid(Integer uid) {
		return userDao.findByUid(uid);
	}
	
	/*
	 * 不会直接从缓存返回结果
	 */
	@CachePut(value="common",key="#user.getUserName()")//Cache
	public void insert(User user) {
		userDao.insert(user);
	}

	/*
	 * 执行会清除该位置的缓存
	 */
	@CacheEvict(value="common",key="'uid_'+#uid")
	public void delete(Integer uid) {
		userDao.delete(uid);
	}
}