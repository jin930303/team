package com.mbc.team.member;


import org.springframework.stereotype.Service;

@Service
public interface MemberService {

	void memberinput(String id, String nickname, String pw, String name, String gender, String birth, String phone,
			String address, String email);

	int idcheck(String id);

	int nicknamecheck(String nickname);

	int nicknamecheck1(String nickname);

	void memberupdate( String nickname, String pw1, String name, String gender, String birth, String phone,
			String address, String email,String id);

	

	


	
	
	
}
