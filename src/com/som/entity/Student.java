package com.som.entity;

public class Student {
	private Integer id;
	private String name;
	private String origin;
	private Integer role;
	private String place;
	private Integer core;
	private Integer pid;
	private Integer pay;
	private Integer day;
	private String email;
	private String goal;
	private Integer con;
	private String emailword;
	
	
	public Student() {
	
	}

	public Student(Integer id, String name, String origin,Integer role,String place,Integer core,Integer pid,Integer pay,Integer day,Integer con,String email,String goal,String emailword) {
		this.id = id;
		this.name = name;
		this.origin = origin;
		this.role = role;
		this.place = place;
		this.core = core;
		this.pid = pid;
		this.pay = pay;
		this.day = day;
		this.email = email;
		this.goal = goal;
		this.con = con;
		this.emailword = emailword;
	}

	public Integer getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getOrigin() {
		return origin;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}
	
	public Integer getRole(){
		return role;
	}
	
	public String getPlace(){
		return place;
	}
	
	public void setRole(Integer role){
		this.role = role;
	}
	
	public void setPlace(String place){
		this.place = place;
	}
	
	public Integer getCore(){
		return core;
	}
	
	public void setCore(Integer core){
		this.core = core;
	}
	public Integer getPid(){
		return pid;
	}
	
	public void setPid(Integer pid){
		this.pid = pid;
	}
	public Integer getPay(){
		return pay;
	}
	
	public void setPay(Integer pay){
		this.pay = pay;
	}
	public Integer getDay(){
		return day;
	}
	
	public void setDay(Integer day){
		this.day = day;
	}
	public Integer getCon(){
		return con;
	}
	
	public void setCon(Integer con){
		this.con = con;
	}
	public String getEmail(){
		return email;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	public String getGoal(){
		return goal;
	}
	
	public void setGoal(String goal){
		this.goal = goal;
	}
	
	public String getEmailword(){
		return emailword;
	}
	
	public void setEmailword(String emailword){
		this.emailword = emailword;
	}

}
