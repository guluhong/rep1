<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="../CSS/Style2.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/Style1.css" rel="stylesheet" type="text/css" />
</head>
<body>
	
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
            <th>开发状态</th>
            <td>
            	<c:if test="${salchance.chcStatus==1}">未指派</c:if>
	            <c:if test="${salchance.chcStatus==2}">开发中</c:if>
	            <c:if test="${salchance.chcStatus==3}">开发成功</c:if>
	            <c:if test="${salchance.chcStatus==4}">终止开发</c:if>
            </td>
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
            <td>${salchance.chcCreateBy }</td>
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
            <th>计划</th>
            <th>执行效果</th>
        </tr>
         <c:forEach items="${splist }" var="salplan">
        <tr>
            <td><fmt:formatDate value="${salplan.plaDate }" pattern="yyyy-MM-dd"/></td>
            <td>${salplan.plaTode }</td>
            <td>${salplan.plaResule }</td>
        </tr>
       	</c:forEach>
    </table>
</body>
</html>
