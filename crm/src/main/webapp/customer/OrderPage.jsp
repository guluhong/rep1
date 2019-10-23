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
	<script src="js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
	
	$(function(){
		$("#dj").click(function(){
			
			var id=$("#custId").val();
			var name=$("#custName").val();
			
			location.href='wljSelectOrders2?pageNum='+$("#tz").val()+'&id='+id+'&name='+name;

		})
		
	})

                       
	</script>
<body>
    <div id="desDiv">
        <span>客户历史订单</span><br />
        记录客户的历史订单
    </div>
 <input type="hidden" value="${khid}" id="custId" name="custId"/>
<input type="hidden" value="${khmz}" id="custName" name="custName"/>
    <table class="tableEdit">
        <tr>
            <th>
                客户编号：
            </th>
            <td>
                ${khid}
            </td>
            <th>
                客户名称：
            </th>
            <td>
                ${khmz}
            </td>
        </tr>
    </table>
    <div id="dataDiv">
        <div id="headDiv">
        
            <img src="../images/22.gif" />&nbsp;&nbsp;<a href="tzActivitysAdd2?id=${khid}&name=${khmz}">新建</a>

        </div>
        <table class="dataTable">
            <tr>
                <th>
                    订单编号
                </th>
                <th>
                    日期
                </th>
                <th>
                    送货地址
                </th>
                <th>
                    状态
                </th>
                <th>
                    操作
                </th>
            </tr>
     <!--        <tr>
                <td>
                    43582147
                </td>
                <td>
                    2016-1-1
                </td>
                <td>
                    长沙市河西
                </td>
                <td>
                    未回款
                </td>
                <td>
                    <a href="orderDetail.html?"><img title="详细信息" src="../images/bt_detail.gif" /></a>
                </td>
            </tr> -->
            <c:forEach items="${pageInfo.getList()}" var="wlj">
            <tr>
                <td>
                   ${wlj.odrId}
                </td>
                <td>
                 <fmt:formatDate value="${wlj.odrDate}" pattern="yyyy年-MM月-dd日" />  
                </td>
                <td>
                     ${wlj.odrAddr}
                </td>
                <td>
                <c:if test="${wlj.odrStatus==1}">
                                                                 已回款
                 </c:if>
                  <c:if test="${wlj.odrStatus==0}">
                                                                 未回款
                 </c:if>
                </td>
                <td>
                 <c:if test="${wlj.odrStatus==1}">
                    <a href="WljSelectsss?id=${wlj.odrId}"><img title="详细信息" src="../images/bt_detail.gif" /></a>
                    </c:if>
                    <c:if test="${wlj.odrStatus==0}">
                     <a href="WljSelectsss?id=${wlj.odrId}"><img title="详细信息" src="../images/bt_detail.gif" /></a>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </table>
        <div id="pageDiv">
            <div id="leftPage">
                共有${pageInfo.getTotal()}条记录，当前第${pageInfo.getPageNum()}/${pageInfo.getPages()}页
            </div>
            <div id="rightPage">
                <input type="image" src="../images/first.gif" onclick="location.href=('wljSelectOrders?pageNum=1&id=${khid}&name=${khmz}')" />&nbsp;&nbsp;
                <input type="image" src="../images/back.gif" onclick="location.href=('wljSelectOrders?pageNum=${pageInfo.getPageNum()-1}&id=${khid}&name=${khmz}')" />&nbsp;&nbsp;
                <input type="image" src="../images/next.gif" onclick="location.href=('wljSelectOrders?pageNum=${pageInfo.getPageNum()+1}&id=${khid}&name=${khmz}')" />&nbsp;&nbsp;
                <input type="image" src="../images/last.gif" onclick="location.href=('wljSelectOrders?pageNum=${pageInfo.pages}&id=${khid}&name=${khmz}')"/>&nbsp;&nbsp; 转到第<input type="text"
                                                                                      size="1"  id="tz"/>&nbsp;&nbsp;<input type="image" src="../images/go.gif" id="dj" />
            </div>
        </div>
    </div>
</body>
</html>
