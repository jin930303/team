package com.mbc.team.member;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

@Service
public interface MemberService {

	void memberinput(MemberDTO memberDTO);

	ArrayList<MemberDTO> memberout();
	
	int idcheck(String id);

	int nicknamecheck(String nickname);

	int nicknamecheck1(String nickname);

	void memberupdate(String nickname, String pw1, String name, String gender, String birth, String phone,
			String address, String email, String id);

	int emailcheck(String email);

	int phonecheck(String phone);

	void memberdelete(String id);

	

}
