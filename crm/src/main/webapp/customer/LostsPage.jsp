<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title></title>
     <link href="../CSS/Style4.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/style2.css" rel="stylesheet" type="text/css" />
    	<script src="js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
     <script type="text/javascript">
      /*   function showMsg() {
            window.showModalDialog("LostMsg.htm?data=" + Math.random(), "参数", "dialogWidth:550px;dialogHeight:400px;help:no");
        }
        
         */
        $(function(){
    		$("#dj").click(function(){
    			
    			location.href='wljSelectKhKhls2?pageNum='+$("#tz").val();

    		})
    		
    	
    		
    	})

 </script>
</head>
<body>
 <div id="desDiv">
        <span>客户流失管理</span><br />
        显示即将流失的客户信息，并制定挽救措施
    </div>
    <form action="wljSelectKhKhls2" method="post">
    <table class="tableEdit">
        <tr>
            <th>
                客户名称：
            </th>
            <td>
                <input name="lstCustName" type="text" />
            </td>
            <th>
                客户经理：
            </th>
            <td>
                <input name="lstCustManagerName" type="text" />
            </td>
            <th>
                状态：
            </th>
            <td>
                <select name="lstStatus">
                    <option selected="selected">全部</option>
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                </select>
            </td>
        </tr>
        <tfoot>
            <tr>
                <td colspan="8">
                    <input type="submit" value="查询" />
                </td>
            </tr>
        </tfoot>
    </table>
    </form>
    <div style="width: 1065px">
        <div>
            <table class="dataTable">
                <tr>
                    <th>
                        客户编号
                    </th>
                    <th>
                        客户名称
                    </th>
                    <th>
                        客户经理
                    </th>
                    <th>
                        最后下单时间
                    </th>
                    <th>
                        确认流失时间
                    </th>
                    <th>
                        状态
                    </th>
                    <th>
                        操作
                    </th>
                </tr>
                <c:forEach items="${pageInfo.getList()}" var="wlj">
                <tr>
                    <td>
                        ${wlj.lstCustNo}
                    </td>
                    <td>
                        ${wlj.lstCustName}
                    </td>
                    <td>
                        ${wlj.lstCustManagerName}
                    </td>
                    <td>
                       <fmt:formatDate value="${wlj.lstLastOrderDate}" pattern="yyyy年-MM月-dd日" />
                    </td>
                    <td><fmt:formatDate value="${wlj.lstLostDate}" pattern="yyyy年-MM月-dd日" /></td>
                    <td>
                      ${wlj.lstStatus}
                    </td>
                    <td>
                        <a href="wljselectCstCustomerByid?id=${wlj.lstCustNo}"><img src="../images/bt_relay.gif" title="暂缓流失" style="border:0px" /></a>
                       <c:if test="${a==wlj.lstId}">
                        <a href="wljselectCstCustomerByid2?id=${wlj.lstCustNo}"><img src="" title="确认流失" style="border:0px" /></a>
                 
                        </c:if>
                         <c:if test="${a!=wlj.lstId}">
                        <a href="wljselectCstCustomerByid2?id=${wlj.lstCustNo}"><img src="../images/bt_confirm.gif" title="确认流失" style="border:0px" /></a>
                 
                        </c:if>
                    </td>
                </tr>
                </c:forEach>
     
            </table>
            <div id="pageDiv">
                <div id="leftPage">
                    共有${pageInfo.getTotal()}条记录，当前第${ pageInfo.getPageNum()}/${pageInfo.getPages()}页</div>
                <div id="rightPage">
                    <input type="image" src="../images/first.gif" onclick="location.href=('wljSelectKhKhls?pageNum=1')"/>&nbsp;&nbsp;
                    <input type="image" src="../images/back.gif" onclick="location.href=('wljSelectKhKhls?pageNum=${pageInfo.getPageNum()-1}')" />&nbsp;&nbsp;
                    <input type="image" src="../images/next.gif" onclick="location.href=('wljSelectKhKhls?pageNum=${pageInfo.getPageNum()+1}')" />&nbsp;&nbsp;
                    <input type="image" src="../images/last.gif" onclick="location.href=('wljSelectKhKhls?pageNum=${pageInfo.pages}')"/>&nbsp;&nbsp; 转到第<input type="text"
                        size="1" id="tz" />&nbsp;&nbsp;<input type="image" src="../images/go.gif" id="dj"/>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
