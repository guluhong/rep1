<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title></title>
    <link href="../CSS/Style2.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
    		function upResult(id){
    			var textResult=document.getElementById("textResult").value;
    			var satisfy=document.getElementById("satisfy").value;
    			if(satisfy=="☆☆☆☆☆"){
    				satisfy=5;
    			}else if(satisfy=="☆☆☆☆"){
    				satisfy=4;
    			}else if(satisfy=="☆☆☆"){
    				satisfy=3;
    			}else if(satisfy=="☆☆"){
    				satisfy=2;
    			}else if(satisfy=="☆"){
    				satisfy=1;
    			}
    			location.href="/resultUpdate?id="+id+"&svrSatisfy="+satisfy+"&svrResult="+textResult;
    		}
    </script>
</head>
<body>
<table class="tableEdit" style="width:500px;">
        <thead>
            <tr>
                <td colspan="4">服务信息（状态：${cstSer.svrStatus }）</td>
            </tr>
        </thead>
        <tr>
            <th>客户名称：</th>
            <td>${cstSer.svrCustName }</td>
            <th>服务类型：</th>
            <td>${cstSer.svrType }</td>
        </tr>
        
        <tr>
            <th>服务概要：</th>
            <td colspan="3">${cstSer.svrTitle }</td>
        </tr>
        <tr>
            <th>详细信息：</th>
            <td colspan="3">${cstSer.svrRequest }</td>
        </tr>
    <tr>
        <th>创建人：</th>
        <td>${cstSer.svrCreateBy }</td>
        <th>创建时间：</th>
        <td><fmt:formatDate value="${cstSer.svrCreateDate }" pattern="yyyy-MM-dd"/></td>
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
            <td colspan="3">${cstSer.svrDeal }</td>
        </tr>
     <tr>
         <th>处理人：</th>
         <td>${cstSer.svrDealBy }</td>
         <th>处理时间：</th>
         <td><fmt:formatDate value="${cstSer.svrDealDate }" pattern="yyyy-MM-dd"/></td>
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
                <select id="satisfy">
               		<option>☆</option>
               		<option>☆☆</option>
               		<option>☆☆☆</option>
               		<option>☆☆☆☆</option>
               		<option>☆☆☆☆☆</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>处理结果：</th>
            <td>
                <textarea id="textResult"></textarea>
             </td>
        </tr>
        <tfoot>
            <tr>
                <td colspan="4">		
                     <input type="button" value="确定" onclick="upResult(${cstSer.svrId})"/>&nbsp;&nbsp;
                     <input type="button" value="关闭" onclick="javascript:history.back(-1)" />
                </td>
            </tr>
        </tfoot>
    </table>
</body>
</html>
