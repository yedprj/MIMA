package com.mima.app.member.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mima.app.member.domain.MemberVO;
import com.mima.app.member.service.MemberService;


@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired MemberService memberService;
	
	@Autowired 
	private JavaMailSender mailSender;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	// 일반 회원가입 폼으로 이동
	@GetMapping("/joinForm")
	public String joinForm() { 
		
		return "member/joinForm";
	}
	
	// 파트너 회원가입 폼으로 이동
	@GetMapping("/partnerJoinForm")
	public String partnerJoinForm() {
		
		return "member/partnerJoinForm";
	}
	
	// 아이디 중복 체크
	@PostMapping("/IdCheck")
	@ResponseBody
	public int idCheck(@RequestBody MemberVO vo) {
		int result = memberService.idCheck(vo);
		
		return result;
	}
	
	// 닉네임 중복 체크
	@PostMapping("/nickNameCheck")
	@ResponseBody
	public int nickNameCheck(@RequestBody MemberVO vo) {
		int result = memberService.nickNameCheck(vo);
		
		return result;
	}
	
	// 의사 약사 면허 체크
	@PostMapping("/licenseCheck")
	@ResponseBody
	public int licenseCheck(@RequestBody MemberVO vo) {
		int result = memberService.licenseCheck(vo);
		
		return result;
	}
	
	// 이메일 인증
	@RequestMapping(value="/mailCheck", method=RequestMethod.GET)
	@ResponseBody
	public String mailcheckGet(String email) throws Exception {
		
		logger.info("이메일 인증번호");
		logger.info("인증번호 : " + email);
		
		// 인증번호 난수 생성
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		
		logger.info("인증번호" + checkNum);
		
		// 이메일 보내기
		String setFrom = "yedampark123@naver.com";
		String toMail = email;
		String title = "회원가입 이메일 입니다.";
		String content = "저희 Mima를 방문해주셔서 감사합니다." +
						 "<br><br>" +
						 "인증번호는 " + checkNum + "입니다." +
						 "<br>" +
						 "해당 인증번호를 확인란에 기입하여 주세요.";
		try {
			
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		String num = Integer.toString(checkNum);
		
		return num;
	}
	
	// 회원가입
	@PostMapping("/joinMember")
	@ResponseBody
	public int joinMember(@RequestBody MemberVO vo) {
		
		vo.setPassword(bCryptPasswordEncoder.encode(vo.getPassword()));
		int result = memberService.memberInsert(vo);
		
		return result;
	}
	
	// 파트너 회원가입
	@PostMapping("/partnerJoinMember")
	@ResponseBody
	public int partnerJoinMember(@RequestBody MemberVO vo) {
		int result = memberService.partnerMemberInsert(vo);
		
		return result;
	}
	
	
}
