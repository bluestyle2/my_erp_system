package com.spring.myapp.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64.Decoder;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.myapp.domain.User;
import com.spring.myapp.service.BoardService;
import com.spring.myapp.service.UserService;

@Controller
public class AdminController {

	@Autowired
    UserService userService;
	
	//何辑 包府 其捞瘤
    @RequestMapping(value = "/groupAdd")
    public String groupAdd(@RequestParam Map<String, Object> paramMap, Model model) {

        return "groupAdd";
    }
    
}