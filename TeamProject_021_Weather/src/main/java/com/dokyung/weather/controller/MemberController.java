package com.dokyung.weather.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dokyung.weather.model.UserVO;
import com.dokyung.weather.service.UserService;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	
	protected final UserService uService;
	
	public MemberController(UserService uService) {
		this.uService = uService;
	}
	
	
	// ȸ������
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String join(UserVO vo) {
		uService.insert(vo);
		
		return "/login";
	}
	
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginGet(String id, String pw) {
		
		
		return "/login";
	}
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginPost(String id, String pw) {
		List<UserVO> userList = uService.login(id, pw);
		return "redirect:/";
	}

}
