<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
<%-- <script src="${path}/resources/js/test.js"></script> --%>
<link href="../../resources/css/theme01.css" rel="stylesheet"/> 	
  <link href="../../resources/fancyTree/src/skin-win8/ui.fancytree.css" rel="stylesheet">
  <script src="../../resources/fancyTree/src/jquery-ui-dependencies/jquery.fancytree.ui-deps.js"></script>
  <script src="../../resources/fancyTree/src/jquery.fancytree.js"></script>
<html>
<%@ include file="leftMenu.jsp" %>
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
	
	$("#tree").contextmenu({
		  delegate: "span.fancytree-title",
		  menu: [
		          {title: "Cut", cmd: "cut", uiIcon: "ui-icon-scissors"},
		          {title: "Copy", cmd: "copy", uiIcon: "ui-icon-copy"},
		          {title: "Paste", cmd: "paste", uiIcon: "ui-icon-clipboard", disabled: false },
		          {title: "----"},
		          {title: "Edit", cmd: "edit", uiIcon: "ui-icon-pencil", disabled: true },
		          {title: "Delete", cmd: "delete", uiIcon: "ui-icon-trash", disabled: true },
		          {title: "More", children: [
		            {title: "Sub 1", cmd: "sub1"},
		            {title: "Sub 2", cmd: "sub1"}
		            ]}
		          ],
		  beforeOpen: function (event, ui) {

		    // 트리의 모든 노드 돌면서 이전에 선택한 노드 모두 제거
		    fancytree.getTree().visit(function (node){
		      node.setSelected(false);
		      node.setActive(false);

		      // 우 클릭으로 선택한 노드 활성화
		      if (node.span.lastChild == ui.target[0]) {
		        node.setSelected(true);
		      }
		    });

		  }
		});
	
});
</script>
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
	   			
	   			 <div id="tree">    <ul id="treeData" style="display: none;">      <li id="id1" title="Look, a tool tip!">item1 with key and tooltip      <li id="id2">item2      <li id="id3" class="folder">Folder <em>with some</em> children        <ul>          <li id="id3.1">Sub-item 3.1            <ul>              <li id="id3.1.1">Sub-item 3.1.1              <li id="id3.1.2">Sub-item 3.1.2              <li id="id3.1.3">Sub-item 3.1.3            </ul>          <li id="id3.2">Sub-item 3.2            <ul>              <li id="id3.2.1">Sub-item 3.2.1              <li id="id3.2.2">Sub-item 3.2.2            </ul>        </ul>      <li id="id4" class="expanded">Document with some children (expanded on init)        <ul>          <li id="id4.1"  class="active focused">Sub-item 4.1 (active and focus on init)            <ul>              <li id="id4.1.1">Sub-item 4.1.1              <li id="id4.1.2">Sub-item 4.1.2            </ul>          <li id="id4.2">Sub-item 4.2            <ul>              <li id="id4.2.1">Sub-item 4.2.1              <li id="id4.2.2">Sub-item 4.2.2            </ul>        </ul>    </ul>  </div>
	   			
		</body>
</html>
