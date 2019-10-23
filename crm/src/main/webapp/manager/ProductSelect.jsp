<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
<script type="text/javascript" src="../js/jquery-3.4.1.js" ></script>
<script type="text/javascript">
			$(function(){
				$("#skip").click(function(){
					var pageno=$("#skiptext").val();
					if($.isNumeric(pageno)){
						$(location).attr("href","findNTB?pageNo="+pageno);
					}else{
						alert("请输入数字！");
					}
				})
			})
		</script>

    <link href="../CSS/Style1.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/Style2.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div id="desDiv">
        <span>产品查询</span><br />
        查询产品信息
    </div>
     <form action="/findNTB" method="get">
    <table class="tableEdit">
        <tr>
            <th>产品名称：</th>
            <td><input name="prodName" type="text" /></td>
            <th>型号：</th>
            <td><input name="prodType" type="text" /></td>
            <th>批次：</th>
            <td><input name="prodBatch" type="text" /></td>
        </tr>
        <tfoot>
            <tr>
                <td colspan="8"><input type="submit" value="查询" /></td>
            </tr>
        </tfoot>
    </table>
    </form>
    <br />
        <table class="dataTable">
            <tr>
                <th>产品名称</th>
                <th>型号</th>
                <th>等级/批次</th>
                <th>单位</th>
                <th>单价(元)</th>
                <th>备注</th>
            </tr>
            <c:forEach var="pg" items="${pg.getList()}">
	            <tr>
	                <td>${pg.prodName }</td>
	                <td>${pg.prodType }</td>
	                <td>${pg.prodBatch }</td>
	                <td>${pg.prodUnit }</td>
	                <td>${pg.prodPrice }</td>
	                <td></td>
	            </tr>
            </c:forEach>
        </table>
        <div id="pageDiv">
            <div id="leftPage">共有${pg.total }条记录，当前第${pg.pageNum}/${pg.pages} }页</div>
            <div id="rightPage">
                <a href="findNTB?pageNo=${pg.navigateFirstPage}"><input type="image" src="../images/first.gif" /></a>&nbsp;&nbsp;
                <a href="findNTB?pageNo=${pg.prePage<=pg.navigateFirstPage?pg.navigateFirstPage:pg.prePage}"><input type="image" src="../images/back.gif" /></a>&nbsp;&nbsp;
                <a href="findNTB?pageNo=${pg.pageNum+1>=pg.navigateLastPage?pg.navigateLastPage:pg.pageNum+1}"><input type="image" src="../images/next.gif" /></a>&nbsp;&nbsp;
                <a href="findNTB?pageNo=${pg.navigateLastPage}"><input type="image" src="../images/last.gif" /></a>&nbsp;&nbsp;
                转到第<input type="text" size="1" id="skiptext"/>&nbsp;&nbsp;<input type="image" src="../images/go.gif" id="skip"/>
            </div>
        </div>
</body>
</html>
