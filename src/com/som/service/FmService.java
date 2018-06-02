package com.som.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.som.dao.IFmDao;
import com.som.entity.Fm;
import com.som.entity.Student;

@Service
public class FmService {
	@Resource
	private IFmDao fmDao;
	
	public Map<String,Integer> findPayMul(int pid){
		return fmDao.findMul(pid);
	}
	
	public List<Fm> findAllFm(){
		return fmDao.findAllFm();
	}

	public void deleteFmById(int pid){
		fmDao.deleteFmById(pid);
	}
	
	public Fm findFmById(int pid){
		return fmDao.findFmById(pid);
	}
	
	public void update(Fm fm){
		fmDao.update(fm);
	}
	
	public void addFm(Fm fm){
		fmDao.add(fm);
	}
	
	public List<Integer> findAllPid(){
		return fmDao.findAllPid();
	}
	

}
