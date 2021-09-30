package com.mima.app.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.mima.app.member.domain.MemberVO;

import lombok.extern.java.Log;

@Log
@Component("customLoginSuccess")
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{
	// 로그인 후에 Session유지를 위해 변경 p.30
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
		//MemberVO vo = (MemberVO) auth.getPrincipal();
		log.info(session.getAttribute("session").toString());
		
		log.info("ROLE NAMES: " + roleNames);
	
		response.sendRedirect("/app");
	}

}
