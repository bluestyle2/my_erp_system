<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
<%-- <script src="${path}/resources/js/test.js"></script> --%>
<link href="../../resources/css/theme01.css" rel="stylesheet"/> 	

<script>
$(document).ready(function(){
	
	var idChk = false;
	
	$("#register").click(function(){
		//로그인부분 게시판과 연동하기
		var objParams = {
				user_id			: $("#user_id").val(),
				user_name	: $("#user_name").val(),
				user_pw		: $("#user_pw").val()
		};
		
		//ajax 호출
		$.ajax({
			url			:	"/registChk",
			dataType	:	"json",
			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
			type 		:	"post",
			data		:	objParams,
			success 	:	function(retVal){
				if(retVal.code == "00") {
					alert(retVal.msg);
					location.href = "/login";
				} else {
					alert(retVal.msg);
				}
				
			},
			error		:	function(request, status, error){
				console.log("AJAX_ERROR");
			}
		});
		
	});
	
	document.getElementById("user_id").addEventListener("blur", function() {
	    
		var objParams = {
				user_id			: $("#user_id").val(),
		};
		
		//ajax 호출
		$.ajax({
			url			:	"/idChk",
			dataType	:	"json",
			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
			type 		:	"post",
			data		:	objParams,
			success 	:	function(retVal){
				if(retVal.code == "00") {
					idChk = true;
					alert(retVal.msg)
				} else {
					idChk = false;
					alert(retVal.msg)
				}
			},
			error		:	function(request, status, error){
				console.log("AJAX_ERROR");
			}
		});
		
	});
	
});
</script>
<html>
		<body>
			<div style="height:40%" align="center">
			  <img src="../../resources/img/dbverimg.jpg" alt="dd3" style="max-width: 100%; max-height: 100%;">
   			</div>
   			<div style="height:30%">
	   			<div class="rgBar" align="center">
		   			<input type="text" id="user_id" name="user_id" placeholder="아이디"/>
		   			<br>
		   			<input type="text" id="user_name" name="user_name" placeholder="이름"/>
		   			<br>
		   			<input type="text" id="user_pw" name="user_pw" placeholder="비밀번호"/>
		   			<br>
		   			<input type="button" id="register" name="register" value="회원가입"/>
		   			</div>
	   			</div>
		</body>
</html>
	