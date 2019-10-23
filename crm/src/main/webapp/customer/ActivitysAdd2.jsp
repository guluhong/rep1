<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="../CSS/Style2.css" rel="stylesheet" type="text/css" />
   
</head>
<script src="js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">

function  gb() {
	
	var id=$("#custId").val();
	var name=$("#custName").val();
	
	location.href='wljSelectOrders?id='+id+'&name='+name;
}

</script>
<body>
<form action="wljinsertOrders" method="post">
<input type="hidden" value="${khdid}" id="custId" name="custId"/>
<input type="hidden" value="${khdmz}" id="custName" name="custName"/>
    <table class="tableEdit">
        <thead>
            <tr>
                <td colspan="4">新建订单</td>
            </tr>
        </thead>
        <tr>
            <th>订单编号：</th>
            <td>
                <input type="text" name="odrId" />
            </td>
            <th>姓名：</th>
            <td>
                <input type="text" name="odrCustomer" />
            </td>
        </tr>
        <tr>
            <th>时间：</th>
            <td><input type="text" name="odrDate"  /></td>
            <th>地点：</th>
            <td><input type="text" name="odrAddr"  /></td>
        </tr>
        <tr>
          <td>1.回款/0未回款</td>
          <td><input type="text" name="odrStatus"  /></td>
        </tr>
        <tfoot>
            <tr>
                <td colspan="4">
                    <input type="submit" value="确定" />&nbsp;&nbsp;
                    <input type="button" value="关闭" onclick="gb()" />
                </td>
            </tr>
        </tfoot>
    </table>
    </form>
</body>
</html>
