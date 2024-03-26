package com.spring.myapp.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.myapp.dao.UserDao;
import com.spring.myapp.domain.Board;
import com.spring.myapp.domain.BoardReply;
import com.spring.myapp.domain.User;

@Repository("userDao")
public class UserDaoImpl implements UserDao{
	
	@Autowired
    private SqlSession sqlSession;
 
    public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;
    }
    
    @Override
	public int selectUserCount(User user) {
		return sqlSession.selectOne("selectUserCount", user);
	}
    
	@Override
	public int regUser(User user) {
		return sqlSession.insert("insertUser", user);
	}
	public int userLogin(User user) {
		return sqlSession.selectOne("userLogin", user);
	}
}
