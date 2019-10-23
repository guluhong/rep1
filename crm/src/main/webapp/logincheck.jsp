<%@page import="com.turing.entity.SysUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		SysUser user =  (SysUser)session.getAttribute("sysUserl");
		if(user==null){
			%>
			<script type="text/javascript">
				alert('您没有登录不可以访问~');
				location.href='login.jsp';
			</script>
			<% 
		}
	%>
</body>
</html>