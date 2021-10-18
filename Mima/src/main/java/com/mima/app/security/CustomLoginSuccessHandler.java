package com.mima.app.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.mima.app.member.domain.MemberVO;
import com.mima.app.push.service.PushService;

import lombok.extern.java.Log;

@Log
@Component("customLoginSuccess")
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{
	// 로그인 후에 Session유지를 위해 변경 p.30
	
	@Autowired PushService pushService;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {
		
		log.info("Login Success");
		
		List<String> roleNames = new ArrayList<>();
		
		auth.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		
		HttpSession session = request.getSession();
		session.setAttribute("session", auth.getPrincipal());
		

		log.info("!!!!!!!!"+session.getAttribute("session").toString());
		

		log.info("ROLE NAMES: " + roleNames);
		
		MemberVO mvo = (MemberVO) auth.getPrincipal();
		log.info(mvo.toString());
		
		// K. 10/18 push 알림내역 조회
		session.setAttribute("notice", pushService.selectMemberPush(mvo.getMemberNo()));
		
		//s:1004 노드에서 사용할 쿠키굽기
		Cookie cookie = new Cookie("userRole", mvo.getRole());	   
		cookie.setMaxAge(60*60*24*30);
		cookie.setPath("/");
	    response.addCookie(cookie);
	    System.out.println(cookie.getValue());
	    System.out.println("++++++++++++++++++++");
		
		response.sendRedirect("/app");
	}

}
