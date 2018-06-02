package com.som.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.som.entity.Fm;
import com.som.entity.Student;
import com.som.service.FmService;

@Controller
@RequestMapping(value = "/fm")
public class FmAction {
	@Resource
	private FmService fmService;
	
	@RequestMapping(value="/deleteFmById")
	public String deleteFmById(Model model,int pid){
        List<Integer> allfm = fmService.findAllPid();
		
		if(allfm.contains(pid)==false){
			return "/fmerror.jsp";
		}
		else{
		fmService.deleteFmById(pid);
		return "forward:/fm/findAllFm.action";
		}
	}
	
	@RequestMapping(value="/findAllFm")
	public String findAllFm(Model model){
		
		List<Fm> fm = fmService.findAllFm();
		model.addAttribute("fm",fm);
		fmService.findAllFm();
		return "/SetFm.jsp";
	}
	
	@RequestMapping(value="/findFmById")
	public String findFmById(Model model,Fm fm){
		 List<Integer> allfm = fmService.findAllPid();
			
			if(allfm.contains(fm.getPid())==false){
				return "/fmerror.jsp";
			}
			else{
		model.addAttribute("fm",fm);
		return "/editFm.jsp";
			}
	}

	@RequestMapping(value="/updateFm",method=RequestMethod.GET)
	public String updateFm(Model model,Fm fm){
		 List<Integer> allfm = fmService.findAllPid();
			
			if(allfm.contains(fm.getPid())==false){
				return "/fmerror.jsp";
			}
			else{
		fmService.update(fm);
		return "forward:/fm/findAllFm.action";
			}
	}
	
	@RequestMapping(value="/addFm")
	public String addFm(Model model,Fm fm){
		 List<Integer> allfm = fmService.findAllPid();
			
			if(allfm.contains(fm.getPid())==true){
				return "/fmerror.jsp";
			}
			else{
		fmService.addFm(fm);
		return "forward:/fm/findAllFm.action";
			}
	}
}
