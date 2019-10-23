<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="../CSS/Style2.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/Style4.css" rel="stylesheet" type="text/css" />
</head>
	<script src="js/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
	
	$(function(){
		$("#dj").click(function(){
			
			location.href='CstCall2?pagenum='+$("#tz").val();

		})
		
	
		
	})

                       
	</script>
<body>
 
    <div id="desDiv">
        <span>客户信息管理</span><br />
        维护客户信息，记录客户联系电话和交往记录
    </div>
       <form action="CstCall2" method="post">
    <table class="tableEdit">
   
        <tr>
            <th>
                客户名称：
            </th>
            <td>
                <input name="custName" type="text" />
            </td>
            <th>
                客户编号：
            </th>
            <td>
                <input name="custNo" type="text" />
            </td>
            <th>
                地区：
            </th>
            <td>
            
                <select  name="custRegion">
                    <option selected="selected">全部</option>
                    <c:forEach items="${wljselectName}" var="wlj">
                   
                    <option>${wlj.custRegion}</option>
                    </c:forEach>
                </select>
              
            </td>
        </tr>
        <tr>
            <th>
                客户经理：
            </th>
            <td>
                <input name="custManagerName" type="text" />
            </td>
            <th>
                客户等级：
            </th>
            <td>
                <select name="dictItem">
                    <option selected="selected">全部</option>
                    <c:forEach items="${wljselectName}" var="wljj">
                    <option>${wljj.custLevel}</option>
                    </c:forEach>
                </select>
            </td>
            <th></th><td></td>
        </tr>
        <tfoot>
            <tr>
                <td colspan="8">
                    <input  type="submit" value="查询" />
                </td>
            </tr>
        </tfoot>
       
    </table>
    
    </form>
    <br />
            <table class="dataTable">
           
                <tr>
           
                    <th>
                        客户编号
                    </th>
                    <th>
                        客户名称
                    </th>
                    <th>
                        地区
                    </th>
                    <th>
                        客户经理
                    </th>
                    <th>
                        客户等级
                    </th>
                    <th>
                        建立时间
                    </th>
                    <th>
                        操作
                    </th>
                </tr>
                 <c:forEach items="${CstCustomerlist.getList()}" var="cst">
                <tr>
                    <td>
                    ${cst.custNo} 
                    </td>
                    <td>
                    ${cst.custName}   
                    </td>
                    <td>
                    ${cst.custRegion} 
                    </td>
                    <td>
                    ${cst.custManagerName} 
                    </td>
                    <td>
                     ${cst.custLevel} 
                    </td>
                    <td>
                   <fmt:formatDate value="${cst.cstService.svrCreateDate}" pattern="yyyy年-MM月-dd日"/>
                 
                    </td>
                    <td>
                        <a href="WljSelectByID?id=${cst.custNo}"><img src="../images/33.gif" title="编辑" style="border:0px" /></a>
                        <a href="WljSelectLinkmans?id=${cst.custNo}&name=${cst.custName}"><img src="../images/bt_linkman.gif" title="联系人" style="border:0px;width:16px;height:16px" /></a>
                        <a href="WljSelectCstActivityS?id=${cst.custNo}&name=${cst.custName}"><img src="../images/bt_acti.gif" title="交往记录" style="border:0px" /></a>
                        <a href="wljSelectOrders?id=${cst.custNo}&name=${cst.custName}"><img src="../images/bt_orders.gif" title="历史订单" style="border:0px" /></a>
                       <a onclick="return confirm('确定删除吗?')?location.href='WljDeleteByID?id=${cst.custNo}':location.href='/CstCall'" >  <img src="../images/bt_del.gif" id="sc" title="删除" style="border:0px" /></a>
                    </td>
                  
                </tr>
                </c:forEach>
               
            </table>
            <div id="pageDiv">
                <div id="leftPage">
                    共有${CstCustomerlist.getTotal()}条记录，当前第${CstCustomerlist.getPageNum()} /${CstCustomerlist.getPages()}页</div>
                <div id="rightPage">
                    <input type="image" src="../images/first.gif" onclick="location.href=('CstCall?pagenum=1')"/>&nbsp;&nbsp;
                    <input type="image" src="../images/back.gif"  onclick="location.href=('CstCall?pagenum=${CstCustomerlist.getPageNum()-1}')"/>&nbsp;&nbsp;
                    <input type="image" src="../images/next.gif"  onclick="location.href=('CstCall?pagenum=${CstCustomerlist.getPageNum()+1}')"/>&nbsp;&nbsp;
                    <input type="image" src="../images/last.gif"  onclick="location.href=('CstCall?pagenum=${CstCustomerlist.pages}')"/>&nbsp;&nbsp; 
                    转到第<input id="tz" id="tz" type="text" size="1" />&nbsp;&nbsp;<input  type="image" src="../images/go.gif"  id="dj"/>
                        
                </div>
            </div>
            
</body>
</html>
