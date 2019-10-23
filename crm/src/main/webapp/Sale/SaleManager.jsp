<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title></title>
    <link href="../CSS/Style1.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/Style2.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
</head>
 <script>
        function skip(obj){
			$.ajax({
				type:"get",
				url:"/findManagerLikeAndPage",
				async:true,
				data:$.param({"pageNum":obj})+'&'+$("#managerdata").serialize(),
				success:function(){
					location.href="/Sale/SaleManager.jsp";
				}
			});
		}
        
        function assignSkip(){
        	var pagenum = document.getElementById("pagenum").value;
        	$.ajax({
        		type:"get",
        		url:"/findManagerLikeAndPage",
        		data:$.param({"pageNum":pagenum} )+'&'+$("#managerdata").serialize(),
        		success:function(){
					location.href="/Sale/SaleManager.jsp";k
				}
        	});
        }
        function succeedc(chcid){
        	var custname = document.getElementById("custname").value;
        	location.href="/scUpdateStatus?sign=3&chcid="+chcid+"&custname="+custname;
        }
 </script>
<body>
<div id="desDiv">
    <span>客户开发计划</span><br />
    制定客户开发计划和记录开发进度
</div>
<form id="managerdata">
    <table class="tableEdit">
        <tr>
            <th>客户名称：</th>
            <td><input type="text" name="chcCustName" value="${salchance.chcCustName}"/></td>
            <th>联系人：</th>
            <td><input type="text" name="chcLinkman" value="${salchance.chcLinkman}"/></td>
        </tr>
        <tr>
            <th>概要：</th>
            <td><input type="text" name="chcTitle" value="${salchance.chcTitle}"/></td>
            <th>开发状态：</th>
            <td>
                <select name="chcStatus">
                 	<c:choose>
		                <c:when test="${salchance.chcStatus==2 }">
		                    <option value="0">全部</option>
		                    <option selected="selected" value="2">开发中</option>
		                    <option value="3">开发成功</option>
		                    <option value="4">终止开发</option>
		                </c:when>
		                <c:when test="${salchance.chcStatus==3 }">
		                    <option value="0">全部</option>
		                    <option value="2">开发中</option>
		                    <option selected="selected" value="3">开发成功</option>
		                    <option value="4">终止开发</option>
		                </c:when>
		                <c:when test="${salchance.chcStatus==4 }">
		                    <option value="0">全部</option>
		                    <option value="2">开发中</option>
		                    <option value="3">开发成功</option>
		                    <option selected="selected" value="4">终止开发</option>
		                </c:when> 
		                <c:otherwise>
		                    <option selected="selected" value="0">全部</option>
		                    <option value="2">开发中</option>
		                    <option value="3">开发成功</option>
		                    <option value="4">终止开发</option>
		                </c:otherwise>   
                    </c:choose>
                </select>
            </td>
        </tr>
        <tfoot>
            <tr>
                <td colspan="8"><input type="button" value="查询" onclick="skip(1)"/></td>
            </tr>
        </tfoot>
    </table>
 </form>   
    <br/>
<div id="dataDiv">
    <div id="headDiv">
    </div>
    <table class="dataTable">
        <tr>
            <th>客户名称</th>
            <th>概要</th>
            <th>联系人</th>
            <th>联系电话</th>
            <th>创建时间</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
         <c:forEach items="${sclistpage.getList() }" var="sc">
        <tr>
        
             <td>${sc.chcCustName }</td>
             <input type="hidden" id="custname" value="${sc.chcCustName }">
	         <td>${sc.chcTitle }</td>
	         <td>${sc.chcLinkman }</td>
	         <td>${sc.chcTel }</td>
             <td><fmt:formatDate value="${sc.chcCreateDate }" pattern="yyyy年MM月dd日"/></td>
            <td>
	            <c:if test="${sc.chcStatus==1}">未指派</c:if>
	            <c:if test="${sc.chcStatus==2}">开发中</c:if>
	            <c:if test="${sc.chcStatus==3}">开发成功</c:if>
	            <c:if test="${sc.chcStatus==4}">终止开发</c:if>
            </td>
            <td>
	            <c:if test="${sc.chcStatus==2}">
	            	<a href="/scAndMaSelect?chcid=${sc.chcId }"><img title="制定计划" src="../images/bt_plan.gif" style="border:0px" /></a>
               		<a href="/scAndMaSelect2?chcid=+${sc.chcId }"><img title="执行计划" src="../images/bt_feedback.gif" style="border:0px" /></a>
               		<img title="开发成功" src="../images/bt_yes.gif" style="border:0px" onclick="succeedc(${sc.chcId })" />
               		<a href="/scUpdateStatus?sign=4&chcid=${sc.chcId }"><img title="开发终止" src="../images/11.gif" style="border:0px" /></a>
	            </c:if>
	            <c:if test="${sc.chcStatus==3}">
	            	<a href="/selectTotal?chcid=${sc.chcId }"><img title="查看" src="../images/bt_orders.gif" /></a>
	            </c:if>
	            <c:if test="${sc.chcStatus==4}">
	            	<a href="/selectTotal?chcid=${sc.chcId }"><img title="查看" src="../images/bt_orders.gif" /></a>
	            </c:if>
            </td>  
        </tr>
       </c:forEach>
       
    </table>
    
   <div id="pageDiv">
        <div id="leftPage">共有${sclistpage.getTotal()}条记录，当前第${sclistpage.getPageNum() }/${sclistpage.getPages() }页</div>
        <div id="rightPage">
            <input type="image" src="../images/first.gif" id="firstPage" onclick="skip(1)"/>&nbsp;&nbsp;
            <input type="image" src="../images/back.gif" id="prePage" value="${sclistpage.getPageNum()-1 }" onclick="skip(this.value)"/>&nbsp;&nbsp;
            <input type="image" src="../images/next.gif" id="nextPage" value="${sclistpage.getPageNum()+1 }" onclick="skip(this.value)"/>&nbsp;&nbsp;
            <input type="image" src="../images/last.gif" id="lastPage" value="${sclistpage.getPages() }" onclick="skip(this.value)"/>&nbsp;&nbsp;
            	转到第<input type="text" size="1" id="pagenum"/>&nbsp;&nbsp;<input type="image" src="../images/go.gif"  onclick="assignSkip()"/>
        </div>
    </div>
</div>
</body>
</html>
