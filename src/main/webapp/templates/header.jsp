<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<%
	Long userId = (Long) session.getAttribute("userId");
	String userName = (String) session.getAttribute("userName");
	String userImage = (String) session.getAttribute("userImage");
	String userDevice = (String) session.getAttribute("userDevice");
	String contextPath = request.getContextPath();
	
	
	
%>

<script>
	var userId = <%= userId %>;
	var userName = '<%= userName %>';
	var userImage = '<%= userImage %>';
	var contextPath = '<%= contextPath %>';
	var userDevice = '<%= userDevice %>';
</script>

<% 
	if(userName != null){
		
%>
	    <script src="templates/headerForLogued.js"></script>
<% 
 	
	}else {
 		
%>
	    <script src="templates/headerForGuest.js"></script>
<% 		
 	
 	}
%>