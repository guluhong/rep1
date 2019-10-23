<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>在线短信平台-用户注册</title>
<link type="text/css" rel="stylesheet" href="CSS/sms.css" />
</head>
<script type="text/javascript">
		function check(){	
			var username = document.getElementById("username");
			var password = document.getElementById("password");
			var affirm = document.getElementById("affirm");
			if(username.value == ""){
				alert("用户名不能为空！");
				return false;
			}else if(password.value == ""){
				alert("密码不能为空！");
				return false;
			}else if(password.value != affirm.value){
				alert("两次密码不一样！");
				return false;
			}
			return true;
		}
		
</script>
<body>
<div id="regTitle" class="png"></div>
<div id="regForm" class="userForm png">

	<form action="/register" onsubmit = "return check()" method="post">
		<dl>
		    <div id="error"></div>
			<dt>用 户 名：</dt>
			<dd><input type="text" name="userName" id="username"/></dd>
			<dt>密　　码：</dt>
			<dd><input type="password" name="userPassword" id="password"/></dd>
			<dt>确认密码：</dt>
			<dd><input type="password" name="affirm" id="affirm"/></dd>
			
		</dl>
		<div class="buttons">
			<input class="btn-reg png" type="submit" name="register" value=" " />
			<input class="btn-reset png" type="reset" name="reset" value=" " />
		</div>
		<div class="goback"><a href="login.jsp" class="png">返回登录页</a></div>
	</form>
</div>
</body>
</html>