package com.spring.myapp.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {

	//게시글 상세 보기
    @RequestMapping(value = "/login")
    public String boardLogin(@RequestParam Map<String, Object> paramMap, Model model) {

        return "login";
    }

  //게시글 상세 보기
    @RequestMapping(value = "/userRegister")
    public String userRegister(@RequestParam Map<String, Object> paramMap, Model model) {

        return "register";
    }

  //AJAX 호출 (로그인)
    @RequestMapping(value="/loginChk", method=RequestMethod.POST)
    @ResponseBody
    public Object loginChk(@RequestParam Map<String, Object> paramMap) {

        //리턴값
        Map<String, Object> retVal = new HashMap<String, Object>();

        //패스워드 암호화
        ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
        String password = encoder.encodePassword(paramMap.get("reply_password").toString(), null);
        paramMap.put("reply_password", password);

        //정보입력
        //int result = boardService.delReply(paramMap);
    	int result = 0;
        if(result>0){
            retVal.put("code", "OK");
        }else{
            retVal.put("code", "FAIL");
            retVal.put("message", "삭제에 실패했습니다. 패스워드를 확인해주세요.");
        }

        return retVal;

    }

}