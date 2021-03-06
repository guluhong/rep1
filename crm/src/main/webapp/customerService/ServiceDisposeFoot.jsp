<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
            <th>创建人</th>
            <th>创建时间</th>
            <th>处理</th>
        </tr>
        <c:forEach items="${dislist.getList() }" var="ser">
	        <tr>
	            <td>${ser.svrCustName}</td>
	            <td>${ser.svrTitle }</td>
	            <td>${ser.svrType }</td>
	            <td>${ser.svrCreateBy }</td>
	            <td><fmt:formatDate value="${ser.svrCreateDate }" pattern="yyyy年MM月dd日"/></td>
	            <td><a href="/disposeCstservice?id=${ser.svrId }"><img src="../images/bt_deal.gif" style="border:0px"/></a></td>
	        </tr>
        </c:forEach>
    </table>
    <div id="pageDiv">
        <div id="leftPage">共有${dislist.getTotal() }条记录，当前第${dislist.getPageNum() }/${dislist.getPages() }页</div>
        <div id="rightPage">
            <input type="image" src="../images/first.gif" onclick="pageChange(1)"/>&nbsp;&nbsp;
            <input type="image" src="../images/back.gif" onclick="pageChange(${dislist.getPageNum()-1})"/>&nbsp;&nbsp;
            <input type="image" src="../images/next.gif" onclick="pageChange(${dislist.getPageNum()+1})"/>&nbsp;&nbsp;
            <input type="image" src="../images/last.gif" onclick="pageChange(${dislist.getPages()})"/>&nbsp;&nbsp;
            转到第<input type="text" size="1" id="chPage" />&nbsp;&nbsp;<input type="image" src="../images/go.gif" onclick="pageJump()"/>
        </div>
    </div>
</body>
</html>