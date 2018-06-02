package com.som.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.som.dao.IUserDao;
import com.som.entity.User;


/*
 * ���ڱ�ע�Ļ���demo
 */
@Service
public class UserServiceImpl extends UserService{

	@Autowired
	private IUserDao userDao;

	@Cacheable(value="common",key="'uid_'+#uid")
	/*
	 *������ֵ�ķ���ֵ�õ����� valueΪ�����ַ �µķ���ִ��ǰ�������к�����ͬkey��ֱ�Ӵӻ��淵�ؽ��
	 */
	public User selectByUid(Integer uid) {
		return userDao.findByUid(uid);
	}
	
	/*
	 * ����ֱ�Ӵӻ��淵�ؽ��
	 */
	@CachePut(value="common",key="#user.getUserName()")//Cache
	public void insert(User user) {
		userDao.insert(user);
	}

	/*
	 * ִ�л������λ�õĻ���
	 */
	@CacheEvict(value="common",key="'uid_'+#uid")
	public void delete(Integer uid) {
		userDao.delete(uid);
	}
}