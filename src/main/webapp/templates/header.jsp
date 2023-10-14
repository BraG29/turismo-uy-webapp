<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	Long userId = (Long) session.getAttribute("userId");
	String userName = (String) session.getAttribute("userName");
	String userImage = (String) session.getAttribute("userImage");
	String contextPath = request.getContextPath();
%>
<html>
	<script>
		var userId = <%= userId %>;
		var userName = '<%= userName %>';
		var userImage = '<%= userImage %>';
		var contextPath = '<%= contextPath %>';
	</script>
	
	<% 
		if(userName != null){
			
	%>
		    <script src="templates/headerForLogged.js"></script>
	<% 
	 	
		}else {
	 		
	%>
		    <script src="templates/headerForGuest.js"></script>
	<% 		
	 	
	 	}
	%>
	

</html>