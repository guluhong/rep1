<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="../CSS/Style1.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/Style2.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div id="desDiv">
        <span>客户历史订单</span><br />
        记录客户的历史订单
    </div>
    <table class="tableEdit">
        <tr>
            <th>
                订单编号：
            </th>
            <td>
              ${wljSelectsss.odrId}
            </td>
            <th>
                日期：
            </th>
            <td>
              <fmt:formatDate value="${wljSelectsss.odrDate}" pattern="yyyy年-MM月-dd日" />
            </td>
        </tr>
        <tr>
            <th>
                送货地址：
            </th>
            <td>
               ${wljSelectsss.odrAddr}
            </td>
            <th>
                总金额(元)：
            </th>
            <td>
               ${wljSelectsss.getOrdersLine().getOddCount()*wljSelectsss.getOrdersLine().getOddPrice()}
            </td>
        </tr>
        <tr>
            <th>
                状态：
            </th>
            <td>
            <c:if test="${wljSelectsss.odrStatus==1}">
                                               已回款
            </c:if>
            <c:if test="${wljSelectsss.odrStatus==0}">
                                               未回款
            </c:if>
            </td>
            <th></th><td></td>
        </tr>
    </table>
    <p></p>
    <table class="dataTable">
        <tr>
            <th>
                商品名
            </th>
            <th>
                数量
            </th>
            <th>
                单位
            </th>
            <th>
                单价(元)
            </th>
            <th>
                金额(元)
            </th>
        </tr>
        <tr>
            <td>
               ${wljSelectsss.getProduct().getProdName()}
            </td>
            <td>
               ${wljSelectsss.getOrdersLine().getOddCount()}
            </td>
            <td>
                ${wljSelectsss.getOrdersLine().getOddUnit()}
            </td>
            <td>
                ${wljSelectsss.getOrdersLine().getOddPrice()}
            </td>
            <td>
                ${wljSelectsss.getOrdersLine().getOddCount()*wljSelectsss.getOrdersLine().getOddPrice()}
            </td>
        </tr>
      
    </table>
</body>
</html>
