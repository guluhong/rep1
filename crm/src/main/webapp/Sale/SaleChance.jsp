<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title></title>
    <link href="../CSS/Style1.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/Style2.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery-3.4.1.js" ></script>
</head>
	<script>
			function tz(obj){
				$.ajax({
					type:"get",
					url:"/findAllLikeAndPage",
					async:true,
					data:$.param({"pageNum":obj})+'&'+$("#form1").serialize(),
					success:function(){
						location.href="/Sale/SaleChance.jsp";
					}
				});
			}
			
			function pagechang(){
				var pagenum = document.getElementById("pagenum").value;
				$.ajax({
					type:"get",
					url:"/findAllLikeAndPage",
					async:true,
					data:$.param({"pageNum":pagenum})+'&'+$("#form1").serialize(),
					success:function(){
						location.href="/Sale/SaleChance.jsp";
					}
				});
			} 
			
			function delCheck(chcid,ccid){
				if(confirm("确认删除？")){
					location.href= "/scdelete?chcid="+chcid+"&ccid="+ccid;
				}
			}
		</script>
<body>
<div id="desDiv">
    <span>销售机会管理</span><br />
    创建和维护销售机会
</div>
	<form id="form1">
    <table class="tableEdit">
        <tr>
            <th>客户名称：</th>
            <td><input type="text" name="chcCustName" value="${salchance.chcCustName }"/></td>
            <th>联系人：</th>
            <td><input type="text" name="chcLinkman" value="${salchance.chcLinkman }"/></td>
            <th>概要：</th>
            <td><input type="text" name="chcTitle" value="${salchance.chcTitle }"/></td>
        </tr>
        <tfoot>
            <tr>
                <td colspan="8"><input type="button" value="查询" onclick="tz(1)" /></td>
            </tr>
        </tfoot>
    </table>
    </form>
    <br />
<div id="dataDiv">
    <div id="headDiv">
        <img src="../images/22.gif" />&nbsp;&nbsp;<a href="/Sale/AddSale.jsp?1=1">新建</a>
    </div>
    <table class="dataTable">
    
        <tr>
            <th>客户名称</th>
            <th>概要</th>
            <th>联系人</th>
            <th>联系电话</th>
            <th>创建时间</th>
            <th>操作</th>
        </tr>
      <c:forEach items="${sclistpage.getList() }" var="sc">
      	 
	        <tr>
	            <td>${sc.chcCustName }</td>
	            <td>${sc.chcTitle }</td>
	            <td>${sc.chcLinkman }</td>
	            <td>${sc.chcTel }</td>
	            <td><fmt:formatDate value="${sc.chcCreateDate }" pattern="yyyy年MM月dd日"/></td>
	            <td>
	            <img title="分配" src="../images/bt_linkman.gif" style="border:0px;width:16px;height:16px" onclick="location.href=('/scallot?chcid=${sc.chcId}')"/>&nbsp;&nbsp;
	            <img title="修改" src="../images/edt.gif" style="border:0px"  onclick="location.href=('/scupdateselect?chcid=${sc.chcId}')"/>&nbsp;&nbsp;
	            <img title="删除" src="../images/del.gif" onclick="delCheck(${sc.chcId},${sc.chcCreateId })"/>
	            </td>
	        </tr>
	    </c:forEach>    
      
    </table>
    <div id="pageDiv">
        <div id="leftPage">共有${sclistpage.getTotal()}条记录，当前第${sclistpage.getPageNum() }/${sclistpage.getPages() }页</div>
        <div id="rightPage">
            <input type="image" src="../images/first.gif" id="firstPage" value="1" onclick="tz(this.value)"/>&nbsp;&nbsp;
            <input type="image" src="../images/back.gif" id="prePage" value="${sclistpage.getPageNum()-1 }" onclick="tz(this.value)"/>&nbsp;&nbsp;
            <input type="image" src="../images/next.gif" id="nextPage" value="${sclistpage.getPageNum()+1 }" onclick="tz(this.value)"/>&nbsp;&nbsp;
            <input type="image" src="../images/last.gif" id="lastPage" value="${sclistpage.getPages() }" onclick="tz(this.value)"/>&nbsp;&nbsp;
            	转到第<input type="text" size="1" id="pagenum"/>&nbsp;&nbsp;<input type="image" src="../images/go.gif"  onclick="pagechang()"/>
        </div>
    </div>
</div>
</body>
</html>
