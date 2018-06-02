package com.som.service;

import org.junit.Test; 
import org.junit.runner.RunWith; 
import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.test.context.ContextConfiguration; 
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner; 
import org.springframework.transaction.annotation.Transactional;

import com.som.entity.User; 

@RunWith(SpringJUnit4ClassRunner.class) 
@ContextConfiguration("/spring.xml") 
@Transactional 
public class UserServiceTest {
	@Autowired
	private UserService userService;
	
	@Test
	public void testCheckLogin(){
		User user = new User();
		user.setPassword("123");
		user.setUid(1);
		user.setRole(3);
		user.setUsername("1");
		if(userService.checkLogin(user)==true){
			System.out.print("true");
		};
	}

}
