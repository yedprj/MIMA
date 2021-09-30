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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	// 아이디 찾기 p-29
	@PostMapping("/findMemberId")
	@ResponseBody
	public String findMemberId(@RequestBody MemberVO vo) {
		String memberId = memberService.findMemberId(vo);
	
		return memberId;
	}
	
	// 비밀번호 찾기 p-29
	@PostMapping("/resetPassword")
	@ResponseBody
	public int findPassword(@RequestBody MemberVO vo) {
		int result = memberService.findPassword(vo);
		
		return result;
	}
	
	// 비밀번호 초기화 메일 보내기 e.30
	@RequestMapping(value="/resetPwMail", method=RequestMethod.GET)
	@ResponseBody
	public String resetPwMailGet(String email, String memberId) throws Exception {
		
		logger.info("이메일 인증번호");
		logger.info("인증번호 : " + email);
		
		String pswd = "";
		StringBuffer sb = new StringBuffer();
		StringBuffer sc = new StringBuffer("!@#$%^&*");		// 특수문자 모음, {}[] 같은 비호감 문자 제거
		String message = "";
		int result = 0;
		
		// 대문자 4개를 임의 발생
		// 첫 글자 대문자
		sb.append((char)((Math.random() * 26) + 65));
		
		// 아스키 코드 65(A)부터 26글자 중 택 1	
		for(int i = 0; i < 3; i++) {
			sb.append((char)((Math.random() * 26) + 65));
		}
		
		// 소문자 4개를 임의발생
		// 아스키 코드 97(a)부터 26글자 중 택 1
		for (int i = 0; i < 4; i++) {
			sb.append((char)((Math.random() * 26) + 97));
		}
		
		// 숫자 2개를 임의 발생
		// 아스키코드 48(1) 부터 10글자 중 택 1
		for (int i = 0; i < 2; i++) {
			sb.append((char)((Math.random() * 10) + 48));
		}
		
		// 특수 문자를 2개 발생시켜 랜덤하게 중간에 끼워 넣는다.
		// 대문자 3개중 1개
		sb.setCharAt(((int)(Math.random()*3)+1), sc.charAt(((int)(Math.random()*sc.length()-1))));
		// 소문자 4개중 1개
		sb.setCharAt(((int)(Math.random()*4)+4), sc.charAt(((int)(Math.random()*sc.length()-1))));
		
		pswd = sb.toString();
		
		logger.info("무작위 비밀번호=============" + pswd);
		
		String setFrom1 = "dngur1278@gmail.com";
		String toMail1 = email;
		String title1 = "초기화 된 비밀번호 입니다.";
		String content1 = "회원님께서 초기화 하신 비밀번호는"
						 +pswd + "입니다."
						 +"<br><br>"
						 +"초기화된 비밀번호로 로그인 하신 후 변경해주세요.";
		
		try {
			MimeMessage message1 = mailSender.createMimeMessage();
			MimeMessageHelper helper1 = new MimeMessageHelper(message1, true, "utf-8");
			helper1.setFrom(setFrom1);
			helper1.setTo(toMail1);
			helper1.setSubject(title1);
			helper1.setText(content1,true);
			mailSender.send(message1);
			
			// 비밀번호 업데이트 e.30
			MemberVO vo = new MemberVO();
			vo.setMemberId(memberId);
			vo.setPassword(bCryptPasswordEncoder.encode(pswd));
			vo.setEmail(email);
			result = memberService.passwordResetUpdate(vo);
			
			
			if (result == 1) {
				message = "success";
			}else {
				message = "fail";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return message;
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
		String setFrom = "dngur1278@gmail.com";
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
