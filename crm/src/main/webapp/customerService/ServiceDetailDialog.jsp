<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title></title>
    <link href="../CSS/Style2.css" rel="stylesheet" type="text/css" />
</head>
<body>
<table class="tableEdit" style="width:500px;">
        <thead>
            <tr>
                <td colspan="4">服务信息</td>
            </tr>
        </thead>
        <tr>
            <th>客户姓名：</th>
            <td>${cstDetail.svrCustName }</td>
            <th>服务类型：</th>
            <td>${cstDetail.svrType }</td>
        </tr>
        <tr>
            <th>服务概要：</th>
            <td colspan="3">${cstDetail.svrTitle }</td>
        </tr>
        <tr>
            <th>详细信息：</th>
            <td colspan="3">${cstDetail.svrRequest }</td>
        </tr>
    <tr>
        <th>创建人：</th>
        <td>${cstDetail.svrDueTo }</td>
        <th>创建时间：</th>
        <td><fmt:formatDate value="${cstDetail.svrDueDate }" pattern="yyyy-MM-dd"/> </td>
    </tr>
    </table>
 <table class="tableEdit" style="width:500px;">
        <thead>
            <tr>
                <td colspan="4">服务处理</td>
            </tr>
        </thead>
        <tr>
            <th>服务处理：</th>
            <td colspan="3">${cstDetail.svrDeal }</td>
        </tr>
     <tr>
         <th>处理人：</th>
         <td>${cstDetail.svrDealBy }</td>
         <th>处理时间：</th>
         <td><fmt:formatDate value="${cstDetail.svrDealDate }" pattern="yyyy-MM-dd"/> </td>
     </tr>
    </table>
    <table class="tableEdit" style="width:500px;">
        <thead>
            <tr>
                <td colspan="4">服务反馈</td>
            </tr>
        </thead>
        <tr>
            <th>满意度：</th>
            <td>
            	<c:if test="${cstDetail.svrSatisfy==1 }">     		
						☆
            	</c:if>
            	<c:if test="${cstDetail.svrSatisfy==2 }">     		
						☆☆
            	</c:if>
            	<c:if test="${cstDetail.svrSatisfy==3 }">     		
						☆☆☆
            	</c:if>
            	<c:if test="${cstDetail.svrSatisfy==4 }">     		
						☆☆☆☆
            	</c:if>
            	<c:if test="${cstDetail.svrSatisfy==5 }">     		
						☆☆☆☆☆
            	</c:if>
            </td>
        </tr>
        <tr>
            <th>处理结果：</th>
            <td>${cstDetail.svrResule }</td>
        </tr>
        <tfoot>
            <tr>
                <td colspan="4">
                     <input type="button" value="返回" onclick="javascript:history.back(-1)"/>
                </td>
            </tr>
        </tfoot>
    </table>
</body>
</html>
