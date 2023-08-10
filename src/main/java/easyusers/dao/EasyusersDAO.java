package easyusers.dao;

import easyusers.dto.EasyusersDTO;

public interface EasyusersDAO {

	public int insertEasyuser(EasyusersDTO dto);
	public EasyusersDTO selectByEmail(String email);
	
	public int selectByNickname(String nick_name); //닉네임 중복확인
	
	public void updateEasyuser(EasyusersDTO dto); //회원정보 수정
	public void updateByPass(EasyusersDTO dto); //비밀번호 수정
}
