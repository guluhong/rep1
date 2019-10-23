<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <style>
    	.Ckmsg{
    		color:red;
    		font-weight: bold;
    	}
    </style>
    <link href="../CSS/Style2.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery-3.4.1.js" ></script>
    <script>
	    $(function(){
	    	var today=new Date();
	    	var submitTime=today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate(); 
	    	$("#nowDate").attr('value',submitTime)
	    })
	    
    	
	    function checkName(obj){
	    	var flag=true;
	    	$("#nameMsg").text("");
	    	if(obj.value==""||obj.value==null){
	    		flag=false;
	    		$("#nameMsg").text("客户名称不能为空");
	    	}
	    	return flag;
	    }
	    function checkSource(obj){
	    	var flag=true;
	    	$("#sourceMsg").text("");
	    	if(obj.value==""||obj.value==null){
	    		flag=false;
	    		$("#sourceMsg").text("机会来源不能为空");
	    	}
	    	return flag;
	    }
	    function checkRate(obj){
	    	var flag=true;
	    	$("#rateMsg").text("");
	    	if(obj.value==""||obj.value==null){
	    		flag=false;
	    		$("#rateMsg").text("成功几率不能为空");
	    	}
	    	return flag;
	    }
	    function checkLinkman(obj){
	    	var flag=true;
	    	$("#linkmanMsg").text("");
	    	if(obj.value==""||obj.value==null){
	    		flag=false;
	    		$("#linkmanMsg").text("联系人不能为空");
	    	}
	    	return flag;
	    }
	    function checkTel(obj){
	    	var flag=true;
	    	$("#telMsg").text("");
	    	if(obj.value==""||obj.value==null){
	    		flag=false;
	    		$("#telMsg").text("联系人电话不能为空");
	    	}
	    	return flag;
	    }
	    function checkTitle(obj){
	    	var flag=true;
	    	$("#titleMsg").text("");
	    	if(obj.value==""||obj.value==null){
	    		flag=false;
	    		$("#titleMsg").text("概要不能为空");
	    	}
	    	return flag;
	    }
	    function checkDesc(obj){
	    	var flag=true;
	    	$("#descMsg").text("");
	    	if(obj.value==""||obj.value==null){
	    		flag=false;
	    		$("#descMsg").text("机会描述不能为空");
	    	}
	    	return flag;
	    }
	     
	    function checkAll(){
	    	var flag=true;
	    	checkName($("#chcCustName")[0]);
	    	checkSource($("#chcSource")[0]);
	    	checkRate($("#chcRate")[0]);
	    	checkLinkman($("#chcLinkman")[0]);
	    	checkTel($("#chcTel")[0]);
	    	checkTitle($("#chcTitle")[0]);
	    	checkDesc($("#chcDesc")[0]);
	    	if(checkName($("#chcCustName")[0])==true&&checkSource($("#chcSource")[0])==true
	    			&&checkRate($("#chcRate")[0])==true&&checkLinkman($("#chcLinkman")[0])==true
	    			&&checkTel($("#chcTel")[0])==true&&checkTitle($("#chcTitle")[0])==true&&checkDesc($("#chcDesc")[0])==true){
	    		flag= true;
	    	}else{
	    		flag= false;
	    	}
	    	return flag;
	    }
	    
    </script>
</head>
<body>
	<form action="/updateinsertsalchance" method="post" onsubmit="return checkAll()">
		<table class="tableEdit">
	        <thead>
	            <tr>
	                <td colspan="4">销售机会添加</td>
	            </tr>
	        </thead>
	        <tr>
	            <th>客户名称：</th>
	            <td>
	                <input type="text" id="chcCustName" name="chcCustName" onblur="checkName(this)"/>
	               	 	<span class="Ckmsg" id="nameMsg"></span>
	            </td>
	            <th>机会来源</th>
	            <td><input type="text" id="chcSource" name="chcSource" onblur="checkSource(this)"/>
	            	<span class="Ckmsg" id="sourceMsg"></span></td>
	        </tr>
	        <tr>
	            <th>成功几率：</th>
	            <td>
	                <input type="text" id="chcRate" name="chcRate" onblur="checkRate(this)"/>
	                	<span class="Ckmsg" id="rateMsg"></span>
	            </td>
	            <th></th>
	            <td></td>
	        </tr>
	        <tr>
	            <th>联系人：</th>
	            <td><input type="text" id="chcLinkman" name="chcLinkman" onblur="checkLinkman(this)"/>
	            <span class="Ckmsg" id="linkmanMsg"></span></td>
	            <th>联系电话：</th>
	            <td><input type="text" id="chcTel" name="chcTel" onblur="checkTel(this)"/>
	            <span class="Ckmsg" id="telMsg"></span></td>
	        </tr>
	        <tr>
	            <th>概要：</th>
	            <td colspan="3"><input type="text" style="width:500px" id="chcTitle" name="chcTitle" onblur="checkTitle(this)"/>
	            <span class="Ckmsg" id="titleMsg"></span></td>
	        </tr>
	        <tr>
	            <th>机会描述：</th>
	            <td colspan="3"><textarea style="width:500px" id="chcDesc" name="chcDesc" onblur="checkDesc(this)"></textarea>
	            <span class="Ckmsg" id="descMsg"></span></td>
	        </tr>
	        <tr>
	            <th>创建人</th>
	            <td><input type="text" readonly="readonly" value="${sysUserl.userName }" name="chcCreateBy"/></td>
	            <th>创建时间</th>
	            <td><input type="text" readonly="readonly" value="" id="nowDate" name="chcCreateDate"/></td>
	        </tr>
	        <tfoot>
	            <tr>
	                <td colspan="4">
	                    <input type="submit" value="确定并返回" name="nextPlan"/>&nbsp;&nbsp;
	                    <input type="submit" value="确定并继续" name="nextPlan"/>&nbsp;&nbsp;
	                    <input type="button" value="返回" onclick="history.go(-1)"/>
	                </td>
	            </tr>
	        </tfoot>
	    </table>
	</form>
    
</body>
</html>
