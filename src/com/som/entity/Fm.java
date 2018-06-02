package com.som.entity;

public class Fm {
	private Integer pid;
	private Integer daymul;
	private Integer coremul;
	private Integer conmul;
	private Integer basic;
	
	public Fm(){
		
	}
	
	public Fm(Integer pid,Integer daymul,Integer coremul,Integer conmul,Integer basic){
		this.pid = pid;
		this.daymul = daymul;
		this.conmul = conmul;
		this.coremul = coremul;
		this.basic = basic;
	}
	
	public Integer getPid(){
		return pid;
	}
	
	public void setPid(Integer pid){
		this.pid = pid;
	}
	
	public Integer getDaymul(){
		return daymul;
	}
	
	public void setDaymul(Integer daymul){
		this.daymul = daymul;
	}
	public Integer getConmul(){
		return conmul;
	}
	
	public void setConmul(Integer conmul){
		this.conmul = conmul;
	}
	public Integer getBasic(){
		return basic;
	}
	
	public void setBasic(Integer basic){
		this.basic = basic;
	}
	
	public Integer getCoremul(){
		return coremul;
	}
	
	public void setCoremul(Integer coremul){
		this.coremul = coremul;
	}
}
