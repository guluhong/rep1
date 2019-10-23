<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
    <link href="../CSS/Style2.css" rel="stylesheet" type="text/css" />
</head>
<script src="js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">

function gb() {
	
	var id=$("#lkmCustNo").val();
	var name=$("#LkmCustName").val();
	
	location.href="WljSelectLinkmans?id="+id+'&name='+name;
}
</script>
<body>
<form action="WljLinkmanInsert" method="post">

<input type="hidden" value="${lkmCustNo}" id="lkmCustNo" name="lkmCustNo"/>
<input type="hidden" value="${custName}" id="LkmCustName" name="LkmCustName"/>
     <table class="tableEdit">
        <thead>
            <tr>
                <td colspan="4">新建联系人</td>
            </tr>
        </thead>
        <tr>
            <th>姓名：</th>
            <td>
                <input type="text" name="lkmName"/>
            </td>
            <th>性别：</th>
            <td>
                <input type="radio" value='男'  name="lkmSex" checked="checked" />男&nbsp;&nbsp;
                <input type="radio" value='女' name="lkmSex" />女
            </td>
        </tr>
        <tr>
            <th>职位：</th>
            <td><input type="text"  name="lkmPostion"/></td>
            <th>固定电话：</th>
            <td><input type="text"  name="lkmTel"/></td>
        </tr>
        <tr>
            <th>手机号码：</th>
            <td><input type="text"  name="lkmMobile"/></td>
            <th></th>
            <td></td>
        </tr>
        <tr>
            <th>备注：</th>
            <td colspan="3"><textarea name="lkmMemo"></textarea></td>
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
