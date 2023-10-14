<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String userName = (String) session.getAttribute("userName");
	String contextPath = request.getContextPath();
%>

<script>
	var contextPath = '<%= contextPath %>';
</script>

<% 
	if(userName != null){
		
%>
	    <script src="templates/footerForLogged.js"></script>
<% 
 	
	}else {
 		
%>
	    <script src="templates/footerForGuest.js"></script>
<% 		
 	
 	}
%>
