package com.project.Controller;

import java.io.IOException;
import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.Member.MemberDTO;
import com.project.Member.MemberService;
import com.project.Member.FileUpload;

@Controller
public class MemberController {

	@Inject BCryptPasswordEncoder pwdEncoder;
	@Autowired private MemberService ms;
	@Autowired private FileUpload fs;
	
	@GetMapping("/login")
	public void login() {}
	
	@PostMapping("login")
	public ModelAndView login(MemberDTO dto,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDTO login = ms.selectOne(dto.getId());
		if(dto != null && login != null) {
			boolean pwdMatch = pwdEncoder.matches(dto.getPw(),login.getPw());
			session.setAttribute("login", login != null && pwdMatch == true ? login : null);
		}
		mav.addObject("msg",session.getAttribute("login") == null && login == null ? "아이디 또는 비밀번호가 잘못되었습니다." : "");
		mav.setViewName(session.getAttribute("login") == null &&login == null ? "login" : "home");
		return mav;
	}
	
	@GetMapping("/signup")
	public void signup() {}

	
	@PostMapping("/signup")
	public ModelAndView signup(MemberDTO dto,@RequestParam HashMap<String,String> formData) {
		ModelAndView mav = new ModelAndView("home");
		dto.setBirth(formData.get("Y") + "-" + formData.get("M") + "-" + formData.get("D"));
		dto.setPw(pwdEncoder.encode(dto.getPw()));
		if(dto.getProfile() == null) {
			dto.setProfile("anon.png");
		}
		int row = ms.insertuser(dto);
		mav.addObject("msg", row == 1 ? "회원가입이 완료되었습니다" : "회원가입이 실패되었습니다.");
		return mav;
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("chat")
	public void chat() {}
	
	
	@GetMapping("mypage")
	public void mypage() {}
	

	@SuppressWarnings("unused")
	@PostMapping("mypage")
		public ModelAndView mypage(MultipartRequest request,MemberDTO dto,HttpSession session) throws IllegalStateException, IOException {
			ModelAndView mav = new ModelAndView();
			MultipartFile file = request.getFile("File");
				if(file.getOriginalFilename() == "" && dto.getProfile() != "anon.png") {
					dto.setProfile(dto.getProfile());
					
				}
				else if(file.getOriginalFilename() == "" ) {
					dto.setProfile("anon.png");
				}
				else { 
				boolean flag = fs.uploadFile(file);
				if(flag) {
					if(file.getOriginalFilename() != null) {
						dto.setProfile(file.getOriginalFilename());			
						}
					}
				}
			
			int row = ms.updatepro(dto,session);
			return mav;
		}
	
	
}

