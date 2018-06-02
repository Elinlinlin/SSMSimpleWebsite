package com.som.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.som.entity.User;
import com.som.service.UserService;

@Controller
@RequestMapping(value="/user")
public class UserAction {
	@Resource
	private UserService userService;
	@RequestMapping(value="/checkLogin",method = RequestMethod.POST)//？POST方法 在url上以get形式表示参数
	public String checkLogin(User user,RedirectAttributes attributes){
		if(userService.checkLogin(user)){
			int role = userService.findRole(user);
			int uid = userService.findUid(user);
		    
			if(role == 0){
				return "/error.jsp";
			}
			else if (role == 1){
				attributes.addAttribute("uid", uid); 
				return "redirect:/stu/findHisStus.action"; 
				
			}
			else if (role == 2) {
				attributes.addAttribute("uid",uid);
				return "/stu/findOriStus.action";
			
			}
			else if (role == 3) {
			    return "/stu/findAllStus.action";
			}
			
			else{
				return "/MyJsp.jsp";
			}
		}
		else{
			return "/logerror.jsp";
		}	
	}
	@RequestMapping(value="/register")
	public String register(User user){
		List<Integer> allUser = userService.findAllUid();
		if(allUser.contains(user.getUid())==true){
		   return "/reerror.jsp";	
		}
		else{
		userService.register(user);
		return "/login.jsp";
		}
	}
	
	@RequestMapping(value="/findAllUser")
	public String findAllUser(Model model){
		List<User> users = userService.findAllUser();
		model.addAttribute("users",users);
		return "/userlist.jsp";
	}
	
	@RequestMapping(value="/deleteUserById")
	public ModelAndView deleteUserById(Model model,int uid){
		List<Integer> allUser = userService.findAllUid();
		if(allUser.contains(uid)==false){
		   return new ModelAndView("/usererror.jsp");	
		}
		else{
		userService.deleteUserById(uid);
		return new ModelAndView("/user/findAllUser.action");
		}
	}
	
	@RequestMapping(value="/findUserById")
	public ModelAndView findUserById(Model model,int uid){
		List<Integer> allUser = userService.findAllUid();
		if(allUser.contains(uid)==false){
		   return new ModelAndView("/usererror.jsp");	
		}
		else{
		User user = userService.findByUid(uid);
		model.addAttribute("user",user);
		return new ModelAndView("/editUser.jsp");
		}
	}
	
	@RequestMapping(value="/updateUser",method=RequestMethod.GET)
	public ModelAndView updateUser(Model model,User user){
		List<Integer> allUser = userService.findAllUid();
		if(allUser.contains(user.getUid())==false){
		   return new ModelAndView("/usererror.jsp");	
		}
		else{
		userService.update(user);
		return new ModelAndView("/user/findAllUser.action");
	}
	}
	
}
