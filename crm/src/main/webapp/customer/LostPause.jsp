<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="../CSS/Style2.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form action="WljUpdateCstomerByid?id=${wljselectCstCustomerByid.lstId}" method="post">
    <table class="tableEdit">
        <thead>
            <tr>
                <td colspan="4">暂缓流失</td>
            </tr>
        </thead>
        <tr>
            <th>客户编号：</th>
            <td>
               ${wljselectCstCustomerByid.lstCustNo}
            </td>
            <th>客户姓名：</th>
            <td>  ${wljselectCstCustomerByid.lstCustName}</td>
        </tr>
        <tr>
            <th>客户经理：</th>
            <td>  ${wljselectCstCustomerByid.lstCustManagerName}</td>
            <th>最后下单时间：</th>
            <td> <fmt:formatDate value="${wljselectCstCustomerByid.lstLastOrderDate}" pattern="yyyy-MM-dd" /> </td>
        </tr>
        <tr>
            <th>暂缓措施：</th>
            <td colspan="3">
              ${wljselectCstCustomerByid.lstDelay}  <br />
                
            </td>
        </tr>
        <tr>
            <th>追加暂缓措施：</th>
            <td colspan="3"><textarea name="lstDelay">${wljselectCstCustomerByid.lstDelay}  </textarea></td>
        </tr>
        <tfoot>
            <tr>
                <td colspan="4">
                    <input type="submit" value="确定" />&nbsp;&nbsp;
                   <a href="wljSelectKhKhls?id=${wljselectCstCustomerByid.lstCustNo}">  <input type="button" value="返回"   /></a> 
                </td>
            </tr>
        </tfoot>
    </table>
    </form>
</body>
</html>
