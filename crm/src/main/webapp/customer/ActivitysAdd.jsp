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
	
	location.href='WljSelectCstActivityS?id='+id+'&name='+name;
}

</script>
<body>
<form action="wljinsertCstActivit" method="post">
<input type="hidden" value="${khdeid}" id="custId" name="custId"/>
<input type="hidden" value="${khmz}" id="custName" name="custName"/>
    <table class="tableEdit">
        <thead>
            <tr>
                <td colspan="4">新建客户来往记录</td>
            </tr>
        </thead>
        <tr>
            <th>交往时间：</th>
            <td>
                <input type="text" name="atvDate" />
            </td>
            <th>交往地点：</th>
            <td>
                <input type="text" name="atvPlace" />
            </td>
        </tr>
        <tr>
            <th>概要：</th>
            <td><input type="text" name="atvTitle"  /></td>
            <th>备注：</th>
            <td><input type="text" name="atvCustName"  /></td>
        </tr>
        <tr>
            <th>详细描述：</th>
            <td colspan="3"><textarea name="atvDesc" ></textarea></td>
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
