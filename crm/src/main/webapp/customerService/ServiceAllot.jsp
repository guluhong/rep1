<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title></title>
    <link href="../CSS/Style1.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/Style2.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/xcConfirm.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="../js/xcConfirm.js"></script>
	<script type="text/javascript">
		 $(function(){
			 pageChange(1);
		 })
			
		//用ajax实现翻页
		function pageChange(value){
			$.ajax({
				url:"/allotPage",
				type:"post",
				data:{
					"pageNum":value,
					"svrCustName":$("#svrCustName").val(),
					"svrTitle":$("#svrTitle").val(),
					"svrType":$("#svrType option:checked").text(),
					"svrStatus":$("#svrStatus option:checked").text(),
					"bDate":$("#bDate").val(),
					"lDate":$("#lDate").val()
				},
				async:true,
				dataType:"html",
				success:function(data){
					$("#dataDiv").html(data);
				},
				error:function(){
					
				}
			})
		}	
	 
		//实现输入文本翻页
		function pageJump(){
			var pageNum= document.getElementById("chPage").value;
			$.ajax({
				url:"/allotPage",
				type:"post",
				data:{
					"pageNum":pageNum,
					"svrCustName":$("#svrCustName").val(),
					"svrTitle":$("#svrTitle").val(),
					"svrType":$("#svrType option:checked").text(),
					"svrStatus":$("#svrStatus option:checked").text(),
					"bDate":$("#bDate").val(),
					"lDate":$("#lDate").val()
				},
				async:true,
				dataType:"html",
				success:function(data){
					$("#dataDiv").html(data);
				},
				error:function(){
					alert("请输入页数");	
				}
			})
		}
		
		//修改服务
		function upName(val,svrId,status){
			var name=document.getElementById("serName").value;
			location.href="/upService?id="+svrId+"&status="+status+"&name="+$(val).prev().children("option:checked").val();
		}
		
		//删除
		function agreeDelete(id){ 
			var txt="确定删除吗?";
			window.wxc.xcConfirm(txt,window.wxc.xcConfirm.typeEnum.warning,{
				onOk:function(){
					location.href="/reduceService?id="+id;
				}
			})
		}
		

	</script>
</head>
<body>
<div id="desDiv">
    <span>服务分配</span><br />
    对于客户提出的咨询、建议、投诉等服务分配专人进行处理
</div>
	   <table class="tableEdit">
	       <tr>
	           <th>
	               客户名称：
	           </th>
	           <td>
	               <input type="text" name="svrCustName" id="svrCustName"/>
	           </td>
	           <th>
	               概要：
	           </th>
	           <td>
	               <input type="text" name="svrTitle" id="svrTitle"/>
	           </td>
	           <th>
	               服务类型：
	           </th>
	           <td>
	               <select name="svrType" id="svrType" >
	                   <option selected="selected">全部</option>
	                   <option>咨询</option>
	                   <option>投诉</option>
	                   <option>建议</option>
	               </select>
	           </td>
	       </tr>
	       <tr>
	           <th>
	               创建日期：
	           </th>
	           <td colspan="3">
	               <input type="date" name="bDate" id="bDate"/>&nbsp;-&nbsp;<input type="date" name="lDate" id="lDate"/>
	           </td>
	           <th>
	               状态：
	           </th>
	           <td>
	               <select name="svrStatus" id="svrStatus" >
	                   <option>全部</option>
	                   <option selected="selected">新创建</option>
	                   <option>已分配</option>
	                   <option>已处理</option>
	                   <option>已反馈</option>
	                   <option>已归档</option>
	               </select>
	           </td>
	       </tr>
	       <tfoot>
	           <tr>
	               <td colspan="8">
	                   <input type="button" value="查询" onclick="pageChange(1)" />
	               </td>
	           </tr>
	       </tfoot>
	   </table>
<div id="dataDiv">
    <div id="headDiv"></div>
</div>
</body>
</html>
