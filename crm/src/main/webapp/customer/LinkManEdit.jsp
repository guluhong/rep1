<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="../CSS/style2.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<form action="WljUpdateLinkmanByid" method="post">
		<input type="hidden" value="${wljSelectLinkmanByid.lkmCustNo}" name="lkmCustNo"/>
		<input type="hidden" value="${custId}" name="id"/>
		<input type="hidden" value="${custName}" name="name"/>
		<table class="tableEdit">
			<thead>
				<tr>
					<td colspan="4">编辑联系人</td>
				</tr>
			</thead>
			<tr>
				
				<th>姓名：</th>
				<td><input type="text" value="${wljSelectLinkmanByid.lkmName}" name="lkmName"/></td>
				<th>性别：</th>
				<td><input type="radio" value="男"  name="lkmSex"
					<c:if test="${wljSelectLinkmanByid.lkmSex=='男'}"> checked="checked" </c:if> />男&nbsp;&nbsp;
					<input type="radio" value="女"  name="lkmSex"
					<c:if test="${wljSelectLinkmanByid.lkmSex=='女'}"> checked="checked" </c:if> />女
				</td>
			</tr>
			<tr>
				<th>职位：</th>
				<td><input type="text" value="${wljSelectLinkmanByid.lkmPostion}"  name="lkmPostion"/></td>
				<th>固定电话：</th>
				<td><input type="text" value="${wljSelectLinkmanByid.lkmTel}"  name="lkmTel"/></td>
			</tr>
			<tr>
				<th>手机号码：</th>
				<td><input type="text" value="${wljSelectLinkmanByid.lkmMobile}"  name="lkmMobile"/></td>
				<th></th>
				<td></td>
			</tr>
			<tr>
				<th>备注：</th>
				<td colspan="3"><textarea name="lkmMemo">${wljSelectLinkmanByid.lkmMemo}</textarea></td>
			</tr>
			<tfoot>
				<tr>
					<td colspan="4"><input type="submit" value="确定" />&nbsp;&nbsp;
					<a href="/WljSelectLinkmans?id=${custId}&name=${custName}"><input type="button" value="关闭" /> </a></td>
				</tr>
			</tfoot>
		</table>
	</form>
</body>
</html>