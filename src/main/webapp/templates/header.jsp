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
	let userId = <%= userId %>;
	let userName = '<%= userName %>';
	let userImage = '<%= userImage %>';
	let contextPath = '<%= contextPath %>';
	let userDevice = '<%= userDevice %>';
	console.log(userId);
	console.log(userName);
	console.log(userImage);
	console.log(contextPath);
	console.log(userDevice);
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