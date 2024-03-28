<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
<%-- <script src="${path}/resources/js/test.js"></script> --%>
<link href="../../resources/css/theme01.css" rel="stylesheet"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> 	
  <link href="../../resources/fancyTree/src/skin-win8/ui.fancytree.css" rel="stylesheet">
  <script src="../../resources/fancyTree/src/jquery-ui-dependencies/jquery.fancytree.ui-deps.js"></script>
  <script src="../../resources/fancyTree/src/jquery.fancytree.js"></script>
  <script src="../../resources/fancyTree/src/jquery.fancytree.dnd.js"></script>
  <script src="../../resources/fancyTree/src/jquery.fancytree.edit.js"></script>
  
<html>
<%@ include file="leftMenu.jsp" %>
<script>
$(document).ready(function(){
	$(function(){
	      $("#tree").fancytree();
	    });
	$("#tree").fancytree({
		checkbox: true,
		titleTabble: true,
	  	quicksearch: true
    });
});
</script>
	<body>
	<div>
	</div>
		<div class="offset-md-3 treeBox" style="width:30%;">
			<div id="tree"> 
				<ul id="treeData" style="display:none;">
					<li id="id1" title="Look, a tool tip!">item1 with key and tooltip
					<li id="id2">item2
					<li id="id3" class="folder">Folder <em>with some</em> children
				<ul><li id="id3.1">Sub-item 3.1
				<ul><li id="id3.1.1">Sub-item 3.1.1
					<li id="id3.1.2">Sub-item 3.1.2<li id="id3.1.3">Sub-item 3.1.3</ul><li id="id3.2">Sub-item 3.2
				<ul><li id="id3.2.1">Sub-item 3.2.1
					<li id="id3.2.2">Sub-item 3.2.2
				</ul>
				</ul>
					<li id="id4" class="expanded">Document with some children (expanded on init)
				<ul>
					<li id="id4.1"  class="active focused">Sub-item 4.1 (active and focus on init)
				<ul>
					<li id="id4.1.1">Sub-item 4.1.1
					<li id="id4.1.2">Sub-item 4.1.2
				</ul>
					<li id="id4.2">Sub-item 4.2
				<ul>
					<li id="id4.2.1">Sub-item 4.2.1
					<li id="id4.2.2">Sub-item 4.2.2
				</ul>
				<ul>
					
				</ul>
				</ul>
					<li id="id5">item5
					<li id="id6">item6
					<li id="id7">item7
				</ul>
			</div>
		</div>
	</body>
</html>
