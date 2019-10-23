<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title></title>
    <link href="../CSS/Style2.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
    <script type="text/javascript">
        function showCustomer() {
            var returnValue = window.showModalDialog("../publicPage/SelectCustomer.jsp?data=" + Math.random(), "参数", "dialogWidth:400px;dialogHeight:220px;help:no");
        }
        
        
        function checkAll(){
        	if($("#svrCustName").val()==""){
        		$("#checkName")[0].innerHTML="<font color='red'>请填写姓名</font>";
        		return false;
        	}
        	if($("#svrTitle").val()==""){
        		$("#titleSpan")[0].innerHTML="<font color='red'>服务概要不能为空</font>";
        		return false;
        	}
        	if($("#svrRequest").val()==""){
        		$("#requestSpan")[0].innerHTML="<font color='red'>详细信息不能为空</font>";
        		return false;
        	}
        	return true;
        }
        
        function checkName(){
        	if($("#svrCustName").val()==""){
        		$("#checkName")[0].innerHTML="<font color='red'>姓名不为空</font>";
        	}
        	if($("#svrCustName").val()!=""){
        		$("#checkName")[0].innerHTML="";
        	}
        	
        }
        
        function checkTitle(){
        	if($("#svrTitle").val()==""){
        		$("#titleSpan")[0].innerHTML="<font color='red'>服务概要不能为空</font>";
        	}
        	if($("#svrTitle").val()!=""){
        		$("#titleSpan")[0].innerHTML="";
        	}
        }
        
        function checkRequest(){
        	if($("#svrRequest").val()==""){
        		$("#requestSpan")[0].innerHTML="<font color='red'>详细信息不能为空</font>";
        	}
        	if($("#svrRequest").val()!=""){
        		$("#requestSpan")[0].innerHTML="";
        	}
        }
    
    </script>
</head>
<body>
<form action="/insertService" method="post" onsubmit="return checkAll()">
		<table class="tableEdit" style="width:600px;">
        <thead>
            <tr>
                <td colspan="4">创建服务</td>
            </tr>
        </thead>
        <tr>
            <th>客户姓名：</th>
	            <td>
	                <input id="svrCustName" name="svrCustName" type="text" onblur="checkName()"/>
	                <span id="checkName"></span>
	            </td>
            <th>服务类型：</th>
            <td>
                <select name="svrType" style="width:100px" >
                    <option>咨询</option>
                    <option>投诉</option>
                    <option>建议</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>服务概要：</th>
            <td colspan="3">
                <input id="svrTitle" name="svrTitle" type="text" style="width:300px" onblur="checkTitle()"/>
                <span id="titleSpan"></span>
             </td>
        </tr>
        <tr>
            <th>详细信息：</th>
            <td colspan="3">
                <textarea id="svrRequest" name="svrRequest" onblur="checkRequest()"></textarea>
                <span id="requestSpan"></span>
             </td>
        </tr>
        <tfoot>
            <tr>
                <td colspan="4">
                    <input type="submit" value="确定"/>&nbsp;&nbsp;
                </td>
            </tr>
        </tfoot>
    </table>
</form>
	
</body>
</html>
