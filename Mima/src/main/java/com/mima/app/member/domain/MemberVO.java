package com.mima.app.member.domain;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;

@SuppressWarnings("serial")
@Data
public class MemberVO implements UserDetails{
	private int memberNo;		// 회원번호
	private String memberId;	// 아이디
	private String password;	// 비밀번호
	private String nickname;	// 닉네임
	private String role;		// 권한 (롤)
	private String name;		// 이름
	private String identifyNo;	// 주민등록번호
	private String gender;		// 성별
	private String addr1;		// 주소
	private String addr2;		// 상세주소
	private String addr3;		// 참고주소
	private String postcode;	// 우편번호
	private String email;		// 이메일
	private String phone;		// 전화번호
	private String license;		// 의사, 약사 면허
	private String status;		// 승인 유무
	private String ptProfilePhoto;	// 환자 프로필 사진
	private Date regDate;		// 등록일
	private Date editDate;		// 수정일
	
	// Session 때문에 추가 코드 p.30
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> authList = new ArrayList<GrantedAuthority>();
		authList.add(new SimpleGrantedAuthority(role));
		return authList;
	}
	@Override
	public String getUsername() {
		return memberId;
	}
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	@Override
	public boolean isEnabled() {
		return true;
	}
}
