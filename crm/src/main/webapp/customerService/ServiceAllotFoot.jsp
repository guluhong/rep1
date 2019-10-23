<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            <th>服务分配</th>
            <th>操作</th>
        </tr>
        
        <c:forEach items="${list.getList() }" var="ser">
         	<tr>
	            <td>${ser.svrCustName}</td>
	            <td>${ser.svrTitle }</td>
	            <td>${ser.svrType }</td>
	            <td>${ser.svrCreateBy }</td>
	            <td><fmt:formatDate value="${ser.svrCreateDate }" pattern="yyyy年MM月dd日"/></td>
	            <td>
	                <select id="serName">
	                	<c:forEach items="${users }" var="uname">
	                		<c:if test="${ser.svrDueTo==uname.userName }">
	                			<option selected="selected">${uname.userName }</option>
	                		</c:if>
	                		<c:if test="${ser.svrDueTo!=uname.userName }">
	                			<option>${uname.userName }</option>
	                		</c:if>
	                	</c:forEach>
	                    
	                </select>
	                <input type="button" value="确定" onclick="upName(this,${ser.svrId},${ser.svrStatus })" />
	            </td>
	            <td>
	                <img src="../images/bt_del.gif" title="删除" style="border:0px" onclick="agreeDelete(${ser.svrId})"  />
	            </td>
        	</tr>
        </c:forEach>
        
    </table>
    <div id="pageDiv">
        <div id="leftPage">共有${list.getTotal() }条记录，当前第${list.getPageNum() }/${list.getPages() }页</div>
        <div id="rightPage">
            <input type="image" src="../images/first.gif" onclick="pageChange(1)"/>&nbsp;&nbsp;
            <input type="image" src="../images/back.gif" onclick="pageChange(${list.getPageNum()-1})"/>&nbsp;&nbsp;
            <input type="image" src="../images/next.gif" onclick="pageChange(${list.getPageNum()+1})"/>&nbsp;&nbsp;
            <input type="image" src="../images/last.gif" onclick="pageChange(${list.getPages()})"/>&nbsp;&nbsp;
            转到第<input type="text" size="1" id="chPage"/>&nbsp;&nbsp;<input type="image" src="../images/go.gif" onclick="pageJump()"/>
        </div>
    </div>
</body>
</html>