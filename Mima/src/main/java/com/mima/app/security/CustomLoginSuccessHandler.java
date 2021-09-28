package com.mima.app.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import lombok.extern.java.Log;

@Log
@Component("customLoginSuccess")
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {
		
		log.info("Login Success");
		
		List<String> roleNames = new ArrayList<>();
		
		auth.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		
		log.info("ROLE NAMES: " + roleNames);
		
		if (roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/app");
			return;
		}
		
		if (roleNames.contains("ROLE_PT")) {
			response.sendRedirect("/app");
			return;
		}
		
		response.sendRedirect("/app");
	}

}
