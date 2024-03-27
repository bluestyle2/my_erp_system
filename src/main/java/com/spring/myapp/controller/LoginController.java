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
public class LoginController {

	@Autowired
    UserService userService;
	
	//게시글 상세 보기
    @RequestMapping(value = "/login")
    public String boardLogin(@RequestParam Map<String, Object> paramMap, Model model) {

        return "login";
    }

  //게시글 상세 보기registChk
    @RequestMapping(value = "/register")
    public String register(@RequestParam Map<String, Object> paramMap, Model model) {

        return "register";
    }
    
    @RequestMapping(value = "/registChk")
    @ResponseBody
    public Map<String,Object> registChk(@RequestParam Map<String, Object> paramMap, Model model) {
    	
    	Map<String, Object> retVal = new HashMap<String, Object>();
    	int result = 0;
	    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	    Date today = new Date();
    	
    	 ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
         String password = encoder.encodePassword(paramMap.get("user_pw").toString(), null);
         
         paramMap.put("user_pw", password);
         
         User user = new User(paramMap);
         user.setRegistDate(formatter.format(today));
         result = userService.regUser(user); 

         if(result > 0) {
        	 retVal.put("code", "00");
             retVal.put("msg", "회원가입에 성공했습니다. 로그인 화면으로 이동합니다.");
         }else {
        	 retVal.put("code", "01");
             retVal.put("msg", "회원가입에 실패했습니다. 다시 시도해주세요.");
         }
         
        return retVal;
    }

    @RequestMapping(value = "/idChk")
    @ResponseBody
    public Map<String,Object> idChk(@RequestParam Map<String, Object> paramMap, Model model) {
    	int result = 0;
    	
    	Map<String, Object> retVal = new HashMap<String, Object>();
    	
    	User user = new User(paramMap);
    	
//         paramMap.put("id", paramMap.get("user_id"));
         
         result = userService.selectUserCount(user);
         
         if(result > 0) {
        	 retVal.put("msg","이미 가입되어있는 아이디입니다.");
        	 retVal.put("code", "01");
         }else {
        	 retVal.put("msg","사용가능한 아이디입니다.");
        	 retVal.put("code", "00");
         }
         
        return retVal;
    }
    
  //AJAX 호출 (로그인)
    @RequestMapping(value="/loginChk", method=RequestMethod.POST)
    @ResponseBody
    public Object loginChk(@RequestParam Map<String, Object> paramMap) {

    	int result = 0;
    	
        //리턴값
        Map<String, Object> retVal = new HashMap<String, Object>();

        //패스워드 암호화
        ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
        String password = encoder.encodePassword(paramMap.get("user_pw").toString(), null);
        paramMap.put("user_pw", password);
        
        User user = new User(paramMap);
        result =  userService.userLogin(user);
        //정보입력
        //int result = boardService.delReply(paramMap);
    	
        if(result>0){
            retVal.put("code", "00");
        }else{
            retVal.put("code", "01");
            retVal.put("msg", "아이디, 비밀번호를 확인해주세요.");
        }

        return retVal;

    }
    
}