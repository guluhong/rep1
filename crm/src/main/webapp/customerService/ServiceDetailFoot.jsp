<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="dataTable">
        <tr>
            <th>客户名称</th>
            <th>概要</th>
            <th>服务类型</th>
            <th>创建时间</th>
            <th>创建人</th>
            <th>分配时间</th>
            <th>处理人</th>
            <th>查看</th>
        </tr>
        <c:forEach items="${detaillist.getList() }" var="ser">
        	<tr>
	            <td>${ser.svrCustName}</td>
	            <td>${ser.svrTitle }</td>
	            <td>${ser.svrType }</td>
	            <td><fmt:formatDate value="${ser.svrCreateDate }" pattern="yyyy年MM月dd日"/></td>
	            <td>${ser.svrCreateBy }</td>
	            <td><fmt:formatDate value="${ser.svrDueDate }" pattern="yyyy年MM月dd日"/></td>
	            <td>${ser.svrDealBy }</td>
	            <td><a href="/detailCstService?id=${ser.svrId }"><img src="../images/bt_orders.gif" title="查看" style="border:0px" /></a></td>
        	</tr>
        </c:forEach>
        
    </table>
    <div id="pageDiv">
        <div id="leftPage">共有${detaillist.getTotal() }条记录，当前第${detaillist.getPageNum() }/${detaillist.getPages() }页</div>
        <div id="rightPage">
            <input type="image" src="../images/first.gif" onclick="pageChange(1)"/>&nbsp;&nbsp;
            <input type="image" src="../images/back.gif" onclick="pageChange(${detaillist.getPageNum()-1})"/>&nbsp;&nbsp;
            <input type="image" src="../images/next.gif" onclick="pageChange(${detaillist.getPageNum()+1})"/>&nbsp;&nbsp;
            <input type="image" src="../images/last.gif" onclick="pageChange(${detaillist.getPages()})"/>&nbsp;&nbsp;
            转到第<input type="text" size="1"  id="chPage" />&nbsp;&nbsp;<input type="image" src="../images/go.gif" onclick="pageJump()"/>
        </div>
    </div>
</body>
</html>