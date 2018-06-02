package com.som.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.http.HttpServletRequest;
import javax.activation.*;
import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.NestedServletException;

import com.som.entity.Fm;
import com.som.entity.Student;
import com.som.entity.User;
import com.som.service.FmService;
import com.som.service.SendMail;
import com.som.service.StuService;
import com.sun.mail.util.MailSSLSocketFactory;

@Controller
@RequestMapping(value = "/stu")
public class StuAction {
	@Resource
	private StuService stuService;
	@Resource
	private FmService fmService;
	

	@RequestMapping(value = "/findStuById")
	public String findStuById(Model model,int id) {
		List<Student> stus = new ArrayList<Student>();
		Student stu = stuService.findStuById(id);
		if(stu == null){
			return "/error.jsp";
		}
		else{
		stus.add(stu);
		model.addAttribute("stus",stus);
		return "/findRes.jsp";
		}
	}
	
	@RequestMapping(value = "/findStuById1")
	public String findStuById1(Model model,int id) {
		Student stu = stuService.findStuById(id);
		if(stu == null){
			return "/error.jsp";
		}
		else{
		model.addAttribute("stu",stu);
		return "/editStu.jsp";
		}
	}
	
	@RequestMapping(value = "/findStuById2")
	public String findStuById2(Model model,int id) {
		Student stu = stuService.findStuById(id);
		if(stu == null){
			return "/error.jsp";
		}
		else{
		model.addAttribute("stu",stu);
		return "/editStuOri.jsp";
		}
	}//2权限
	
	@RequestMapping(value="/findStuByName")
	public String findStuByName(Model model,String name){
		List<Student> stus = stuService.findStuByName(name);
		if(stus == null){
			return "/error.jsp";
		}
		else{
		model.addAttribute("stus",stus);
		return "/findRes.jsp";
		}
		
	}
	
	@RequestMapping(value="/findStuByOrigin")
	public String findStuByOrigin(Model model,String origin){
		List<Student> stus = stuService.findStuByOrigin(origin);
		if(stus == null){
			return "/error.jsp";
		}
		else{
		model.addAttribute("stus",stus);
		return "/findRes.jsp";
		}
		
	}//2权限
	
	@RequestMapping(value="/findHisStus")
	public ModelAndView findHisStus(Model model,Student student,@RequestParam("uid") int uid){
		int id = uid;
		List<Student> stus = stuService.findHisStus(id);
		if(stus == null){
			return new ModelAndView("/error.jsp");
		}
		else{
		model.addAttribute("stus",stus);
		model.addAttribute("uid",uid);
		return new ModelAndView("/stu_hislist.jsp","uid",uid);
		}
	}//1权限 查询本工号对应stu
	
	@RequestMapping(value="/findOriStus")
	public ModelAndView findOriStus(Model model,Student student,@RequestParam("uid") int uid){
		int id = uid;
		List<Student> stus = stuService.findOrigin(id);
		if(stus == null){
			return new ModelAndView("/error.jsp");
		}
		else{
		model.addAttribute("stus",stus);
		model.addAttribute("uid",uid);
		return new ModelAndView("/stu_orilist.jsp","uid",uid);
		}
		//return "/stu_orilist.jsp";
	}//2权限 查询本origin下的stu
	
	@RequestMapping(value="/findAllStus")
	public ModelAndView findAllStus(Model model,@RequestParam("uid") int uid){
		
		List<Student> stus = stuService.findAllStus();
		if(stus == null){
			return new ModelAndView("/error.jsp");
		}
		else{
		model.addAttribute("stus",stus);
		model.addAttribute("uid",uid);
		return new ModelAndView("/stu_list.jsp","uid",uid);
		}
	}

	
	@RequestMapping(value="/addStu",method=RequestMethod.GET)
	public String addStu(Student stu,HttpServletRequest getRequest,RedirectAttributes attributes) throws Exception{
		List<Integer> allid = stuService.findAllId();
		
		if(allid.contains(stu.getId())==true){
			return "/adderror.jsp";
		}
		else{
		stuService.addStu(stu);
		String Suid = getRequest.getParameter("uid");
		int uid = Integer.valueOf(Suid);
		attributes.addAttribute("uid", uid); 
		return "redirect:/stu/findAllStus.action";
		}
		
	}
	
	@RequestMapping(value="/addStuOri")
	public String addStuOri(Student stu,@RequestParam("origin") int origin){
        List<Integer> allid = stuService.findAllId();
		
		if(allid.contains(stu.getId())==true){
			return "/adderror.jsp";
		}
		else{
		stuService.addStu(stu);
		return "forward:/stu/findOriStus.action";
		}
		
	}
	
	@RequestMapping(value="/deleteStuById")
	public String deleteStuById(int id,HttpServletRequest getRequest,RedirectAttributes attributes){
        List<Integer> allid = stuService.findAllId();
		if(allid.contains(id)==false){
			return "/delerror.jsp";
		}
		stuService.deleteStuById(id);
		String Suid = getRequest.getParameter("uid");
		int uid = Integer.valueOf(Suid);
		attributes.addAttribute("uid", uid); 
		return "redirect:/stu/findAllStus.action";
		
	}
	
	
	
	@RequestMapping(value="/updateStu",method=RequestMethod.GET)
	public String updateStu(Student stu,HttpServletRequest getRequest,RedirectAttributes attributes){
        List<Integer> allid = stuService.findAllId();
		
		if(allid.contains(stu.getId())==false){
			return "/adderror.jsp";
		}
		else{
		String Suid = getRequest.getParameter("uid");
		int uid = Integer.valueOf(Suid);
		stuService.updateStu(stu);
		attributes.addAttribute("uid", uid); 
		return "redirect:/stu/findAllStus.action";
		}
	}
	
	@RequestMapping(value="/updateStuOri.action",method=RequestMethod.GET)
	public String updateStuOri(Student stu,HttpServletRequest getRequest,RedirectAttributes attributes){
        List<Integer> allid = stuService.findAllId();
		
		if(allid.contains(stu.getId())==false){
			return "/adderror.jsp";
		}
		else{
		String Suid = getRequest.getParameter("role");
		int uid = Integer.valueOf(Suid);
		attributes.addAttribute("uid", uid);    	
		stuService.updateStu(stu);
		return "redirect:/stu/findOriStus.action";//重定向并传递工号作为参数
		}
	}//2权限下修改信息的更新

	@RequestMapping(value="/outExcell")
	public String outExcell(Model model){
		List<Student> stus = stuService.findAllStus();
		model.addAttribute("stus",stus);
		return "/excell.jsp";
	}
	
	@RequestMapping(value="/culStuPayById")
	public String culStuPayById(Model model,int id){
		Map<String, Integer> m1 = stuService.findStuPayParm(id);//得到工资计算参数 pid,day,core,con	 
		int pid = m1.get("pid");
		int day = m1.get("day");
		int core = m1.get("core");
		int con = m1.get("con");	
		Map<String,Integer> m2 = fmService.findPayMul(pid);
		int daymul = m2.get("daymul");
		int coremul = m2.get("coremul");
		int conmul = m2.get("conmul");
		int basic = m2.get("basic");//得到工资计算系数daymul,coremul,conmul
		int pay = basic + daymul*day + core*coremul + con*conmul;
	    Map<String,Integer> m3 = new HashMap<String, Integer>();
	    m3.put("id", id);
	    m3.put("pay", pay);	    
		stuService.setStuPay(m3);//mapper返回键值对，利用键值对作输入参数 <String,cast>
		//计算工资并写入数据库
		return "forward:/stu/findAllStus.action";
	}
	
	@RequestMapping(value="/culStuPayByIdOri",method=RequestMethod.GET)
	public String culStuPayByIdOri(Model model,int id,HttpServletRequest getRequest,RedirectAttributes attributes){
		String Suid = getRequest.getParameter("uid");//为从findoristus传来的uid，源为登陆输入
		int uid = Integer.valueOf(Suid);
		attributes.addAttribute("uid", uid);
		Map<String, Integer> m1 = stuService.findStuPayParm(id);//得到工资计算参数 pid,day,core,con	 
		int pid = m1.get("pid");
		int day = m1.get("day");
		int core = m1.get("core");
		int con = m1.get("con");	
		Map<String,Integer> m2 = fmService.findPayMul(pid);
		int daymul = m2.get("daymul");
		int coremul = m2.get("coremul");
		int conmul = m2.get("conmul");
		int basic = m2.get("basic");//得到工资计算系数daymul,coremul,conmul
		int pay = basic + daymul*day + core*coremul + con*conmul;
	    Map<String,Integer> m3 = new HashMap<String, Integer>();
	    m3.put("id", id);
	    m3.put("pay", pay);	    
		stuService.setStuPay(m3);//mapper返回键值对，利用键值对作输入参数 <String,cast>
		return "redirect:/stu/findOriStus.action";
	}
	
	
	
	
	@RequestMapping(value="/sendEmailById",method=RequestMethod.GET)
	public String sendEmailById(Model model,int id,String etitle,String eword,HttpServletRequest getRequest,RedirectAttributes attributes) throws Throwable{
         List<Integer> allid = stuService.findAllId();
       		
		if(allid.contains(id)==false){
			return "/adderror.jsp";
		}
		else{
		String Suid = getRequest.getParameter("uid");//为从findAllstus传来的uid，源为登陆输入
		int fromid = Integer.valueOf(Suid);
		int toid = id;
		
		String fromemail = stuService.findEmail(fromid);
		String toemail = stuService.findEmail(toid);
		String emailpassword = stuService.findEmailWord(fromid);
		
		 Map<String,String> map= new HashMap<String,String>();
	        SendMail mail = new SendMail(fromemail,emailpassword);
	        map.put("mail.smtp.host", "smtp.qq.com");

	        //暂时未成功，需要调试
	        /*SendMail mail = new SendMail("14789****@sina.cn","***miya");
	        map.put("mail.smtp.host", "smtp.sina.com");*/
	        map.put("mail.smtp.auth", "true");
	        map.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	        map.put("mail.smtp.port", "465");
	        map.put("mail.smtp.socketFactory.port", "465");
	        mail.setPros(map);
	        mail.initMessage();
	        /*
	         * 添加收件人有三种方法：
	         * 1,单人添加(单人发送)调用setRecipient(str);发送String类型
	         * 2,多人添加(群发)调用setRecipients(list);发送list集合类型
	         * 3,多人添加(群发)调用setRecipients(sb);发送StringBuffer类型
	         */
	        List<String> list = new ArrayList<String>();
	        list.add(toemail);
	        
	        mail.setRecipients(list);
	        
	        mail.setSubject(etitle);
	    
	        mail.setDate(new Date());
	        mail.setFrom(fromemail);
     
	        mail.setContent(eword, "text/html; charset=UTF-8");
	        
	        System.out.println(mail.sendMessage());
		 
	    
		return "/sendSuccessful.jsp";
		}
	}
}
