package com.som.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.som.dao.IStuDao;
import com.som.entity.Student;

@Service
public class StuService {
	@Resource
	private IStuDao stuDao;
	
	public Student findStuById(int id){
		return stuDao.findById(id);
	}
	
	
	public List<Student> findStuByName(String name){
		return stuDao.findByName(name);
	}
	
	public List<Student> findStuByOrigin(String origin){
		return stuDao.findByOrigin(origin);
	}
	
	public List<Student> findHisStus(int id){
		return stuDao.findHis(id);
	}
	
	/*
	public List<Student> findOriStus(User user){
		return stuDao.findOri(user);
	}
	*/
	
	public List<Student> findAllStus(){
		return stuDao.findAll();
	}
	
	
	
	public void addStu(Student stu){
		stuDao.add(stu);
	}
	
	public void deleteStuById(int id){
		stuDao.deleteById(id);
	}
	
	public void updateStu(Student stu){
		stuDao.update(stu);
	}
	
	public List<Student> findOrigin(int id){
		String origin = stuDao.findOri(id);
		return stuDao.findThisOri(origin);
	}
	
	public Map<String, Integer> findStuPayParm(int id){
		return stuDao.findPayParm(id);// ·µ»Ølist<> pid,day,core,con
	}
	
	public void setStuPay(Map<String,Integer> m1){
		stuDao.setPay(m1);
	}
	
	public String findEmail(int id){
		return stuDao.findEmail(id);
	}
	
	public String findEmailWord(int id){
		return stuDao.findEmailWord(id);
	}
	
	public List<Integer> findAllId(){
		return stuDao.findAllId();
	}
	
}
