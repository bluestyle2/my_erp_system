<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script>
$(document).ready(function(){
	
	$("#login").click(function(){
		//로그인부분 게시판과 연동하기
		var objParams = {
				//<c:if test="${boardView.id != null}">
				user_id			: $("#user_id").val(),
				//</c:if>
				user_pw		: $("#user_pw").val(),
		};
		
		//ajax 호출
		$.ajax({
			url			:	"/loginChk",
			dataType	:	"json",
			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
			type 		:	"post",
			data		:	objParams,
			success 	:	function(retVal){
				if(retVal.code == "OK") {
					alert(retVal.message);
					location.href = "/board/list";	
				} else {
					alert(retVal.message);
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
			<div align="center">
    		<br>
    		</br>
  		<form action="#">
			<table border="1" width="1200px" >
   				<tr height="500px">
   					<td colspan="2" valign="top">
   					</td>
   				</tr>
   				<tr align="center" style=border:0px;>
   					<td colspan="2">	
   						<input type="text" id="user_id" name="user_id" style="width:200px;" maxlength="10" placeholder="아이디"/>
   					</td>
   				</tr>
   				<tr align="center" style=border:0px;>
   				<td colspan="2">
   				<input type="password" id="password" name="password" style="width:200px;" maxlength="10" placeholder="패스워드"/>
   				<td>
   				</tr>
   				<tr align="center" style=border:0px;>
   				<td colspan="3">
   						<button id="login" name="login">로그인</button>
   						<button id="delete" name="delete">회원가입</button>
				</td>
   				</tr>
   				<tr align="center" style=border:0px;>
   				<td>
   				계정이 기억나지 않으신가요? <button id="findIdPw" name="findIdPw">아이디/비밀번호 찾기</button>
   				</td>
   				</tr>
   			</table>
		</form>
   			</div>
</body>
</html>
	