package com.team.weather.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.team.weather.dao.MemberDao;
import com.team.weather.model.MemberVO;
import com.team.weather.service.MemberService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImplV1 implements MemberService {
	
	protected final MemberDao memDao;
	@Override
	public MemberVO join(MemberVO memberVO) {
		//ȸ�� ���� ������ List ���
		//List<MemberVO> members = memDao.selectAll();
		memDao.insert(memberVO);
		return memberVO;
	}
	
	
	// ���������� ������
	@Override
	public MemberVO update(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return null;
	}

	

	@Override
	public MemberVO findById(String id) {
		// TODO Auto-generated method stub
		MemberVO memberVO = memDao.findById(id.trim());
		return memberVO;
	}

	@Override
	public MemberVO login(MemberVO memberVO, Model model) {
		// TODO Auto-generated method stub
		MemberVO findVO = memDao.findById(memberVO.getUs_id()); // ������ ���̵� �ִ��� �ľ���
		if(findVO == null ) { // ������ 
			model.addAttribute("MSG","NOT_USERID"); // ���� ���̵� �޼��� ����
			return null; // Controller�� null�� ����
		}
		if(findVO.getUs_pw().equals(memberVO.getUs_pw())) { // findById�� �����־� findVO�� �����Ͱ� ��� ����, ���������� ���۵� pw �����Ͱ��� ������ ����VO
			return findVO;
		}
		model.addAttribute("MSG", "NEQ_PASS"); // pw equals �ϴ� if������ return���� ������� �н����尡 Ʋ���������� null�� ����
		return null;
	}

}
