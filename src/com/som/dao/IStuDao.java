package com.som.dao;

import java.util.List;
import java.util.Map;

import com.som.entity.Student;
import com.som.entity.User;

public interface IStuDao {
	public Student findById(int id);

	public List<Student> findByName(String name);

	public List<Student> findByOrigin(String origin);

	public List<Student> findAll();

	public void add(Student stu);

	public void deleteById(int id);

	public void update(Student stu);

	public List<Student> findHis(int id);

	public String findOri(int id);//根据stu.id查询对应的origin
	
	public List<Student> findThisOri(String origin);

	public Map<String, Integer> findPayParm(int id);
	
	public void setPay(Map<String,Integer> m1);
	
	public String findEmail(int id);
	
	public String findEmailWord(int id);
	
	public List<Integer> findAllId();
	
}
