package com.spring.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.vo.MemberVO;
import com.spring.vo.SessionVO;

@Repository
public class MemberDAO extends DBConn {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "mapper.loginjoin";
	
	
	//�α��� üũ
	public SessionVO loginCheck(String id, String pass) {
		Map param = new HashMap<String, String>();
		param.put("id", id);
		param.put("pass",pass);
		return sqlSession.selectOne(namespace+".login", param);
		/*
		String sql = " select count(*) from daangn_member where id=? and pass=? ";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs=pstmt.executeQuery();
			int num=0;
			if(rs.next()) {
				num = rs.getInt(1);
			}
			
			if(num!=0) {
				result=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		*/
	}
	
	//���̵� �ߺ� üũ
	public boolean idCheck(String id) {
		boolean result=false;
		int sessionresult = sqlSession.selectOne(namespace+".idcheck", id);
		if(sessionresult!=0) result=true;
		return result;
	}
	
	//ȸ������ ����
	public boolean join_proc(MemberVO vo) {
		boolean result = false;
		int sessionresult = sqlSession.insert(namespace+".join_proc", vo);
		if(sessionresult!=0) result=true;
		return result;
	}
	
}