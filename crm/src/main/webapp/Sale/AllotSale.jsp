<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<link href="../CSS/Style2.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery-3.4.1.js" ></script>
</head>
<%
		Date d = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-年MM月-dd日");
		String now = df.format(d);
	%>
<script type="text/javascript">
		function con(chcid){
			var index = document.getElementById("custname").selectedIndex;
			var custname = document.getElementById("custname").options[index].text; //指派人
			var dueid = document.getElementById("custname").value; //指派人id
			if(confirm('确定分配？')){
				location.href="/updatechccustname?chcid="+chcid+"&custname="+custname+"&dueid="+dueid;					
			}  
		}
		
		$(function(){
		        $("select option").each(function() {
		            text = $(this).text();
		            if($("select option:contains("+text+")").length > 1)
		                $("select option:contains("+text+"):gt(0)").remove();
		        });
		})
		
	</script>
<body>
	<table class="tableEdit">
		<thead>
			<tr>
				<td colspan="4">销售机会分配</td>
			</tr>
		</thead>
		<tr>
			<th>客户名称：</th>
			<td>${salchance.chcCustName }</td>
			<th>机会来源</th>
			<td>${salchance.chcSource }</td>
		</tr>
		<tr>
			<th>成功几率：</th>
			<td>${salchance.chcRate }</td>
			<th></th>
			<td></td>
		</tr>
		<tr>
			<th>联系人：</th>
			<td>${salchance.chcLinkman }</td>
			<th>联系电话：</th>
			<td>${salchance.chcTel }</td>
		</tr>
		<tr>
			<th>概要：</th>
			<td colspan="3">${salchance.chcTitle }</td>
		</tr>
		<tr style="height: 100px">
			<th>机会描述：</th>
			<td colspan="3" style="vertical-align: top">${salchance.chcDesc }</td>
		</tr>
		<tr>
			<th>创建人：</th>
			<td>${salchance.chcCreateBy }</td>
			<th>创建时间：</th>
			<td><fmt:formatDate value="${salchance.chcCreateDate }"
					pattern="yyyy-年MM月-dd日" /></td>
		</tr>
		<tr>
			<th>指派人：</th>
			<td><select id="custname">
					<c:forEach items="${cstlist }" var="clist">
						<option value="${clist.custManagerId }">${clist.custManagerName }</option>
					</c:forEach>
			</select></td>
			<th>指派时间：</th> <
			<td><%=now %></td>
		</tr>
		<tfoot>
			<tr>
				<td colspan="4"><input type="button" value="确定"
					onclick="con(${salchance.chcId})" />&nbsp;&nbsp; <input
					type="button" value="返回" onclick="javascript:history.back(-1);" />
				</td>
			</tr>
		</tfoot>
	</table>
</body>
</html>
