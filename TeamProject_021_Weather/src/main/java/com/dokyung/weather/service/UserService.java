package com.dokyung.weather.service;

import java.util.List;

import com.dokyung.weather.model.UserVO;

public interface UserService {
	
	public List<UserVO> selectAll(); 
	public UserVO findById(String us_id); // ���̵�ã��
	public int insert(UserVO vo); // ȸ������
	public int update(UserVO vo); // ȸ������ ����
	public int delete(String us_id); // ȸ��Ż��
	public List<UserVO> login(String us_id, String us_pw); // �α���
	
	
	
}
