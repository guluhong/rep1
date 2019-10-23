<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title></title>
    <link href="../CSS/Style2.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form action="WljupdateCstActivityByidd?id=${khid}&name=${khname}" method="post">
<input type="hidden" value="${wljSelectCstActivityByid.atvId}" name="atvId"/>
<table class="tableEdit">
        <thead>
            <tr>
                <td colspan="4">编辑客户来往记录</td>
            </tr>
        </thead>
        <tr>
            <th>交往时间：</th>
            <td>
            
                <input   type="text" value=" <fmt:formatDate value="${wljSelectCstActivityByid.atvDate}" pattern="yyyy-MM-dd" /> " name="atvDate" /></td>
            <th>交往地点：</th>
            <td>
                <input   type="text" value="${wljSelectCstActivityByid.atvPlace}" name="atvPlace" />
            </td>
        </tr>
        <tr>
            <th>概要：</th>
            <td><input  type="text" value="${wljSelectCstActivityByid.atvTitle}"  name="atvTitle"/></td>
            <th>备注：</th>
            <td><input  type="text" value="${wljSelectCstActivityByid.atvCustName}"  name="atvCustName"/></td>
        </tr>
        <tr>
            <th>详细描述：</th>
            <td colspan="3"><textarea name="atvDesc" >${wljSelectCstActivityByid.atvDesc}</textarea></td>
        </tr>
        <tfoot>
            <tr>
                <td colspan="4">
                    <input type="submit" value="确定" />&nbsp;&nbsp;
                  <a href="WljSelectCstActivityS?id=${khid}&name=${khname}"><input type="button" value="关闭" onclick="window.close()" /></a> 
                </td>
            </tr>
        </tfoot>
    </table>
    </form>
</body>
</html>
