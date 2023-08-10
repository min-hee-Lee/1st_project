package easyusers.service;

import org.apache.ibatis.session.SqlSession;

import common.exception.WrongEmailPasswordException;
import easyusers.dao.EasyusersDAO;
import easyusers.dto.AuthInfo;
import easyusers.dto.ChangePwdCommand;
import easyusers.dto.EasyusersDTO;


public class EasyusersServiceImp implements EasyusersService{
	
	private EasyusersDAO easyusersDao;
	
	private SqlSession sqlsession;
	
	public EasyusersServiceImp() {

	}

	public void setEasyusersDao(EasyusersDAO easyusersDao) {
		this.easyusersDao = easyusersDao;
	}
	
	//회원가입 후 바로 로그인 처리하기
	@Override
	public AuthInfo addEasyuserProcess(EasyusersDTO dto) {
		easyusersDao.insertEasyuser(dto);
		return new AuthInfo(dto.getEmail(), dto.getEasyuser_name(), dto.getEasyuser_pass());
	}

	//닉네임 중복체크
	@Override
	public boolean checkDuplicateNickname(String nick_name) {
	    int count = easyusersDao.selectByNickname(nick_name);
	    return (count> 0);
	}
	
	//로그인하기
	@Override
	public AuthInfo loginProcess(EasyusersDTO dto) {
		EasyusersDTO easyuser = easyusersDao.selectByEmail(dto.getEmail()); //null이 아니면 회원
		if(easyuser == null) { //null이면 해당 이메일이 없으므로 비회원
			throw new WrongEmailPasswordException();
	
		}
		
		if(!easyuser.matchPassword(dto.getEasyuser_pass())) {//입력한 비번과 DB에 저장된 비번이 일치하는지 확인
			throw new WrongEmailPasswordException();
	}

		return new AuthInfo(easyuser.getEmail(), easyuser.getEasyuser_name(), easyuser.getEasyuser_pass());
		
	}
	
	//회원정보 수정
	@Override
	public EasyusersDTO updateEasyuserProcess(String email) {
		return easyusersDao.selectByEmail(email);
	}
	
	//회원정보 수정 처리
	@Override
	public AuthInfo updateEasyuserProcess(EasyusersDTO dto) {
		easyusersDao.updateEasyuser(dto);
		EasyusersDTO easyuser = easyusersDao.selectByEmail(dto.getEmail());
		return new AuthInfo(easyuser.getEmail(), easyuser.getEasyuser_name(), easyuser.getEasyuser_pass());
	}

	//비밀번호 변경 처리
	@Override
	public void updatePassProcess(String email, ChangePwdCommand changePwd) {
		EasyusersDTO easyuser = easyusersDao.selectByEmail(email);
		if(easyuser == null)
			throw new WrongEmailPasswordException();
		easyuser.changePassword(changePwd.getCurrentPassword(), changePwd.getNewPassword());
		easyusersDao.updateByPass(easyuser);
		
	}

}











