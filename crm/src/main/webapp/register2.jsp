<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>在线短信平台-用户注册</title>
		<link type="text/css" rel="stylesheet" href="CSS/sms.css" />
		<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
	</head>
	<script type="text/javascript">
			$(function(){
				$("#but").click(function(){
					var user = $("#fm").serialize();
					$.ajax({
						url:"/registerCheck",
						type:"get",
						data:user,
						success:function(data){
							if(data=="false"){
								alert("该用户已被注册~");
							}
						},
						
					})
				})
			})
	</script>

	<body>
		<div id="regTitle" class="png"></div>
		<div id="regForm" class="userForm png">

			<form id="fm">
				<dl>
					<div id="error"></div>
					<dt>用 户 名：</dt>
					<dd><input type="text" name="userName" id="username" /></dd>
					<dt>密　　码：</dt>
					<dd><input type="password" name="userPassword" id="password" /></dd>
					<dt>确认密码：</dt>
					<dd><input type="password" name="affirm" id="affirm" /></dd>

				</dl>
				<div class="buttons">
					<input class="btn-reg png" id="but" type="button" name="register" value=" " />
					<input class="btn-reset png" type="reset" name="reset" value=" " />
				</div>
				<div class="goback">
					<a href="login.jsp" class="png">返回登录页</a>
				</div>
			</form>
		</div>
	</body>

</html>