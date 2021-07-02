package com.dokyung.weather.service.impl;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.dokyung.weather.model.UserVO;
import com.dokyung.weather.service.UserService;

@Service
public class UserServiceImplV1 implements UserService {

	protected final JdbcTemplate jdbcTemplate;

	public UserServiceImplV1(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public List<UserVO> selectAll() {
		// TODO �ߺ��˻��
		String sql = " SELECT * FROM tbl_user ";
		
		List<UserVO> user = jdbcTemplate.query(sql, new BeanPropertyRowMapper<UserVO>(UserVO.class));
		return user;
		
	}

	@Override
	public UserVO findById(String us_id) {
		// TODO ȸ�� ã��
		String sql = " SELECT * FROM tbl_user ";
		sql += " WHERE us_id = ? ";
		
		Object[] params = new Object[] { us_id };
		
		UserVO vo = (UserVO) jdbcTemplate.query(sql, params, new BeanPropertyRowMapper<UserVO>(UserVO.class));
		
		
		return vo;
	}

	@Override
	public int insert(UserVO vo) {
		// TODO ȸ�����
		String sql = " INSERT INTO tbl_user ";
		sql += " ( us_name, us_id, us_pw, us_sex, us_city, us_dist ) ";
		sql += " VALUES( ?,?,?,?,?,? )";
		
		Object[] params = new Object[] { vo.getUs_id(), vo.getUs_id(), vo.getUs_pw(), vo.getUs_sex(), vo.getUs_city(), vo.getUs_dist() };
		return jdbcTemplate.update(sql, params);
	}

	@Override
	public int update(UserVO vo) {
		// TODO ȸ������ ����
		String sql = " UPDATE tbl_user SET ";
		sql += " us_name = ?, " ;
		sql += " us_pw = ?, " ;
		sql += " us_sex = ?, " ;
		sql += " us_city = ?, " ;
		sql += " us_dist = ? " ;
		sql += " WHERE us_id = ? " ;
		
		Object[] params = new Object[] { vo.getUs_name(), vo.getUs_pw(), vo.getUs_sex(), vo.getUs_sex(), vo.getUs_city(), vo.getUs_dist() };
		return jdbcTemplate.update(sql, params);
		
	}

	@Override
	public int delete(String us_id) {
		// TODO ȸ��Ż��
		String sql = " DELETE FROM tbl_user ";
		sql += " WHERE us_id = ? ";
		Object[] params = new Object[] { us_id };
		
		
		return jdbcTemplate.update(sql,params);
	}

	@Override
	public List<UserVO> login(String us_id, String us_pw) {
		// TODO �α���
		String sql = " SELECT * FROM tbl_user ";
		sql += " WHERE us_id = ? AND us_pw = ? ";

		Object[] params = new Object[] { us_id, us_pw };
		List<UserVO> vo =  jdbcTemplate.query(sql, params, new BeanPropertyRowMapper<UserVO>(UserVO.class));
		return vo;
	}

}
