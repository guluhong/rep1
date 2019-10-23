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
				$("#num1").click(function(){
					alert("num1");
				})
				$("#but1").click(function(){
					alert("注册成功")
				})
				$("#skip").click(function(){
					var pageno=$("#skiptext").val();
					if($.isNumeric(pageno)){
						$(location).attr("href","findWW?pageNo="+pageno);
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
        <span>库存查询</span><br />
        查询产品库存信息
    </div>
    <form action="/findWW" method="get">
    <table class="tableEdit">
        <tr>
            <th>产品名称：</th>
            <td><input name="stkWarehouse" type="text" /></td>
            <th>仓库：</th>
            <td><input name="stkWare" type="text" /></td>
        </tr>
        <tfoot>
            <tr>
                <td colspan="4"><input type="submit" value="查询" /></td>
            </tr>
        </tfoot>
    </table>
    </form>
    <br />
    <table class="dataTable">
        <tr>
            <th>产品名称</th>
            <th>仓库</th>
            <th>货位</th>
            <th>件数</th>
            <th>备注</th>
        </tr>
        <c:forEach var="pg" items="${pg.getList()}">
	        <tr>
	            <td>${pg.stkProdId}</td>
	            <td>${pg.stkWarehouse }</td>
	            <td>${pg.stkWare }</td>
	            <td>${pg.stkCount }</td>
	            <td></td>
	        </tr>
        </c:forEach>
    </table>
    <div id="pageDiv">
         <div id="leftPage">共有${pg.total }条记录，当前第${pg.pageNum}/${pg.pages}页</div>
        <div id="rightPage">
            <a href="findWW?pageNo=${pg.navigateFirstPage}"><input type="image" src="../images/first.gif" /></a>&nbsp;&nbsp;
            <a href="findWW?pageNo=${pg.prePage<=pg.navigateFirstPage?pg.navigateFirstPage:pg.prePage}"><input type="image" src="../images/back.gif" /></a>&nbsp;&nbsp;
            <a href="findWW?pageNo=${pg.pageNum+1>=pg.navigateLastPage?pg.navigateLastPage:pg.pageNum+1}"><input type="image" src="../images/next.gif" /></a>&nbsp;&nbsp;
            <a href="findWW?pageNo=${pg.navigateLastPage}"><input type="image" src="../images/last.gif" /></a>&nbsp;&nbsp;
            转到第<input type="text" size="1" id="skiptext"/>&nbsp;&nbsp;<input type="image" src="../images/go.gif" id="skip"/>
        </div>
    </div>
</body>
</html>
