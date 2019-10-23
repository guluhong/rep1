<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="../CSS/Style2.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/Style1.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<%
		Date d = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String now = df.format(d);
	%>
	<script>
	function save1(spid,chcid,obj){
		var tode =obj.parentNode.previousElementSibling.firstElementChild;
		location.href="/spupdatetode?spid="+spid+"&tode="+tode.value+"&chcid="+chcid;
	}
		function deletesp(spid){
			var chcid = ${salchance.chcId}
			if(confirm("确定删除？")){
				location.href="/deletesp?spid="+spid+"&chcid="+chcid;
			}
		}
		
		
	</script>
    <table class="tableEdit">
        <thead>
            <tr>
                <td colspan="4">客户信息</td>
            </tr>
        </thead>
        <tr>
            <th>客户名称：</th>
            <td>
                ${salchance.chcCustName }
            </td>
            <th>机会来源</th>
            <td>${salchance.chcSource }</td>
        </tr>
        <tr>
            <th>成功几率：</th>
            <td>
                ${salchance.chcRate }
            </td>
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
        <tr style="height:100px">
            <th>机会描述：</th>
            <td colspan="3" style="vertical-align:top">${salchance.chcDesc }</td>
        </tr>
        <tr>
            <th>创建人：</th>
            <td>admin</td>
            <th>创建时间：</th>
            <td><fmt:formatDate value="${salchance.chcCreateDate }" pattern="yyyy-MM-dd"/></td>
        </tr>
        <tr>
            <th>指派人：</th>
            <td>${salchance.chcDueTo }</td>
            <th>指派时间：</th>
            <td><fmt:formatDate value="${salchance.chcDueDate }" pattern="yyyy-MM-dd"/></td>
        </tr>
    </table>
    <p>
    </p>
    <table class="dataTable">
        <tr>
            <th>日期</th>
            <th>计划项</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${splist }" var="salplan">
	        <tr>
	            <td><fmt:formatDate value="${salplan.plaDate }" pattern="yyyy-MM-dd"/> </td>
	            <td><input type="text" style="width:500px"  value="${salplan.plaTode }"/></td>
	            <td>															
	               <img title="保存" src="../images/edt.gif" style="border:0px" onclick="save1(${salplan.plaId},${salplan.plaChcId},this)"/>&nbsp;&nbsp;
	               <img title="删除" src="../images/del.gif" onclick="deletesp(${salplan.plaId })" />
	            </td>
	        </tr>
       </c:forEach>
    </table>
    <p></p>
    <form action="/salPlanInsert">
	    <table class="tableEdit">
	        <thead>
	            <tr>
	                <td colspan="4">新增计划</td>
	            </tr>
	        </thead>
	        <tr>
	            <th>日期：</th>
	            <td>
	            	<input type="hidden" name="plaChcId" value="${ salchance.chcId}"/>
	                <input type="text" name="plaDate" readonly="readonly" value="<%=now%>"/>
	            </td>
	            <th>计划项</th>
	            <td><input type="text" name="plaTode" style="width:500px" /></td>
	        </tr>
	        <tfoot>
	            <tr>
	                <td colspan="4">
	                    <input type="submit" value="添加" />&nbsp;&nbsp;
	                    <a href="/salManagerList"><input type="button" value="返回"/></a>
	                </td>
	            </tr>
	        </tfoot>
	    </table>
    </form>
</body>
</html>
