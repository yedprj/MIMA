package com.mima.app.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.mima.app.member.domain.MemberVO;

//로그인 후에 Session에 vo객체를 가져오기 위해 추가한 클래스 p.30
public class CustomUserDetailsService implements UserDetailsService{

	@Autowired private MemberService memberService;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberVO mvo = memberService.getUserById(username);
		
		if (mvo == null) {
			throw new UsernameNotFoundException("username" + username + "not found");
		}
		System.out.println("==================== Found user ====================");
		System.out.println("id : " + mvo.getUsername());
		return mvo;
	}
}
