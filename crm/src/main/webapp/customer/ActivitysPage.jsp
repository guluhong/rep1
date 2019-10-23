<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title></title>
    <link href="../CSS/Style1.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/Style2.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="desDiv">
    <span>客户交往记录</span><br />
    记录与客户之间的交往信息
</div>
    <table class="tableEdit">
        <tr>
            <th>
                客户编号：
            </th>
            <td>
               ${custId}
            </td>
            <th>
                客户名称：
            </th>
            <td>
               ${custName}
            </td>
        </tr>
    </table>
<div id="dataDiv">
    <div id="headDiv">
        <img src="../images/22.gif" />&nbsp;&nbsp;<a href="customerActivitysAdd?id=${custId}&name=${custName}">新建</a>
    </div>
    <table class="dataTable">
                        <tr>
                            <th>
                                时间
                            </th>
                            <th>
                                地点
                            </th>
                            <th>
                                概要
                            </th>
                            <th>
                                详细信息
                            </th>
                            <th>备注</th>
                            <th>
                                操作
                            </th>
                        </tr>
                      <c:forEach items="${wljSelectCstActivityS}" var="wlj"> 
                        <tr>
                            <td>
                           <fmt:formatDate value="${wlj.atvDate}" pattern="yyyy年-MM月-dd日" />   
                            </td>
                            <td>
                               ${wlj.atvPlace}
                            </td>
                            <td>
                                ${wlj.atvTitle }
                            </td>
                            <td>
                               ${wlj.atvDesc}
                            </td>
                            <td>
                                ${wlj.atvCustName}
                            </td>
                            <td>
                            <a href="WljSelectCstActivityByid?id=${wlj.atvId}&khid=${custId}&name=${custName}"><img title="编辑" src="../images/33.gif" style="border:0px"/></a>&nbsp;
                           <a onclick="return confirm('确定删除吗?')?location.href='wljDeleteCstActivityByid?id=${wlj.atvId}&iid=${custId}&name=${custName}':null">  <img title="删除" src="../images/11.gif" /></a>
                            </td>
                        </tr>
                       </c:forEach>
                      
                    </table>
    </div>
</body>
</html>
