<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title></title>
    <link href="../CSS/Style2.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
    	function upDeal(id){
    		var deal=document.getElementById("deal").value;
    		location.href="/disUpdateDeal?id="+id+"&deal="+deal;
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
    <tr>
        <th>分配人：</th>
        <td>${cstSer.svrDueTo } </td>
        <th>分配时间：</th>
        <td><fmt:formatDate value="${cstSer.svrDueDate }" pattern="yyyy-MM-dd"/>  </td>
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
            <td colspan="3">
               <textarea id="deal"></textarea>
             </td>
        </tr>
         <tfoot>
            <tr>
                <td colspan="4">
                     <input type="button" value="确定" onclick="upDeal(${cstSer.svrId})"/>&nbsp;&nbsp;
                     <input type="button" value="返回" onclick="javascript:history.back(-1)" />
                </td>
            </tr>
        </tfoot>
    </table>
</body>
</html>
