package com.som.dao;

import java.util.List;
import java.util.Map;

import com.som.entity.Fm;




public interface IFmDao {
	
	public Map<String,Integer> findMul(int pid);
	
	public List<Fm> findAllFm();
	
	public void deleteFmById(int pid);
	
	public Fm findFmById(int pid);
	
	public void update(Fm fm);
	
	public void add(Fm fm);
	
	public List<Integer> findAllPid();
	

}
