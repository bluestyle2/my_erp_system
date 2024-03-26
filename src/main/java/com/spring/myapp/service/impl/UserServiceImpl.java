package com.spring.myapp.service.impl;

import java.sql.SQLDataException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionException;
import org.springframework.stereotype.Service;

import com.mysql.cj.jdbc.exceptions.SQLError;
import com.spring.myapp.dao.BoardDao;
import com.spring.myapp.dao.UserDao;
import com.spring.myapp.domain.Board;
import com.spring.myapp.domain.BoardReply;
import com.spring.myapp.domain.User;
import com.spring.myapp.service.BoardService;
import com.spring.myapp.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Resource(name="userDao")
	private UserDao userDao;

	@Override
	public int regUser(User user) {
		//아이디가 없으면 입력
		int result = 0;
		try {
			result = userDao.regUser(user);
		} catch (SqlSessionException e) {
			
		}
		return result;
	}
	
	public int selectUserCount(User user) {
		
		return userDao.selectUserCount(user);
		
	}
	
	public int userLogin(User user) {
		int result = 0;
		
		try {
			result = userDao.userLogin(user);
		} catch (Exception e) {
		}
		return result;
	}
}
