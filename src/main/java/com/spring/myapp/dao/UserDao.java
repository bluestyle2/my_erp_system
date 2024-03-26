package com.spring.myapp.dao;

import java.util.List;
import java.util.Map;

import com.spring.myapp.domain.Board;
import com.spring.myapp.domain.BoardReply;
import com.spring.myapp.domain.User;

public interface UserDao {
	
	int selectUserCount(User user);
	
	int regUser(User user);

	int userLogin(User user);
}
