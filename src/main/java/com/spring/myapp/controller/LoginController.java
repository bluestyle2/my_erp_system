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
	
	//�Խñ� �� ����
    @RequestMapping(value = "/login")
    public String boardLogin(@RequestParam Map<String, Object> paramMap, Model model) {

        return "login";
    }

  //�Խñ� �� ����registChk
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
             retVal.put("msg", "ȸ�����Կ� �����߽��ϴ�. �α��� ȭ������ �̵��մϴ�.");
         }else {
        	 retVal.put("code", "01");
             retVal.put("msg", "ȸ�����Կ� �����߽��ϴ�. �ٽ� �õ����ּ���.");
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
        	 retVal.put("msg","�̹� ���ԵǾ��ִ� ���̵��Դϴ�.");
        	 retVal.put("code", "01");
         }else {
        	 retVal.put("msg","��밡���� ���̵��Դϴ�.");
        	 retVal.put("code", "00");
         }
         
        return retVal;
    }
    
  //AJAX ȣ�� (�α���)
    @RequestMapping(value="/loginChk", method=RequestMethod.POST)
    @ResponseBody
    public Object loginChk(@RequestParam Map<String, Object> paramMap) {

    	int result = 0;
    	
        //���ϰ�
        Map<String, Object> retVal = new HashMap<String, Object>();

        //�н����� ��ȣȭ
        ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
        String password = encoder.encodePassword(paramMap.get("user_pw").toString(), null);
        paramMap.put("user_pw", password);
        
        User user = new User(paramMap);
        result =  userService.userLogin(user);
        //�����Է�
        //int result = boardService.delReply(paramMap);
    	
        if(result>0){
            retVal.put("code", "00");
        }else{
            retVal.put("code", "01");
            retVal.put("msg", "���̵�, ��й�ȣ�� Ȯ�����ּ���.");
        }

        return retVal;

    }
    
}