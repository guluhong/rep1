<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title></title>
    <link href="../CSS/Style2.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<form action="/scupdate">
    <table class="tableEdit">
        <thead>
            <tr>
                <td colspan="4">销售机会编辑</td>
            </tr>
        </thead>
        <tr>
            <th>客户名称：</th>
            <td>
            	 <input type="hidden" name="chcId" value="${salchance.chcId }"/>
                <input type="text" name="chcCustName" value="${salchance.chcCustName }"/>
            </td>
            <th>机会来源</th>
            <td><input type="text" name="chcSource" value="${salchance.chcSource }"/></td>
        </tr>
        <tr>
            <th>成功几率：</th>
            <td>
                <input type="text" name="chcRate" value="${salchance.chcRate }"/>
            </td>
            <th></th>
            <td></td>
        </tr>
        <tr>
            <th>联系人：</th>
            <td><input type="text" name="chcLinkman" value="${salchance.chcLinkman }"/></td>
            <th>联系电话：</th>
            <td><input type="text" name="chcTel" value="${salchance.chcTel }"/></td>
        </tr>
        <tr>
            <th>概要：</th>
            <td colspan="3"><input type="text" name="chcTitle" style="width:500px" value="${salchance.chcTitle }"/></td>
        </tr>
        <tr>
            <th>机会描述：</th>
            <td colspan="3"><textarea style="width:500px" name="chcDesc">${salchance.chcDesc }</textarea></td>
        </tr>
        <tr>
            <th>创建人</th>
            <td><input type="text" readonly="readonly" name="chcCreateBy" value="${salchance.chcCreateBy }" /></td>
            <th>创建时间</th>
            <td><input type="text" readonly="readonly" name="createDate" value="${createdata }"/></td>
        </tr>
        <tfoot>
            <tr>
                <td colspan="4">
                    <input type="submit" value="确定" />&nbsp;&nbsp;
                    <input type="button" value="返回"  onclick="javascript:history.back(-1)"/>
                </td>
            </tr>
        </tfoot>
    </table>
    </form>
</body>
</html>
