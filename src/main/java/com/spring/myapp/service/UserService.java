package com.spring.myapp.service;

import java.util.List;
import java.util.Map;

import com.spring.myapp.domain.Board;
import com.spring.myapp.domain.BoardReply;
import com.spring.myapp.domain.User;

public interface UserService {
	
	int regUser(User user);
	
	int selectUserCount(User user);
	
	int userLogin(User user);
}
