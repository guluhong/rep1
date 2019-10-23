<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="../js/jquery-3.4.1.js" ></script>
<script type="text/javascript">
			$(function(){
				$(".del").click(function(){
					if (confirm("是否确认删除")){
					   alert("删除成功！");
					   return true;
					} else {
						 alert("已取消！");
						 return false;
					}
					 return false;
				})
			})
		</script>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../CSS/Style2.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/Style1.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div id="desDiv">
        <span>数据字典管理</span><br />
        管理系统所需的数据字典内容
    </div>
    <form method="get" action="/findTIV">
    <table class="tableEdit">
        <tr>
            <th>
                类别：
            </th>
            <td>
                <input name="type" type="text" />
            </td>
            <th>
                条目：
            </th>
            <td>
                <input name="dictItem" type="text" />
            </td>
            <th>
                值：
            </th>
            <td>
                <input name="dictValue" type="text" />
            </td>
        </tr>
        <tfoot>
            <tr>
                <td colspan="8">
                    <input id="btn4" type="submit" value="查询" /></a>
                </td>
            </tr>
        </tfoot>
    </table>
    </form>
    <div id="dataDiv">
        <div id="headDiv">
            <img src="../images/22.gif" />&nbsp;&nbsp;<a href="addshowpage">新建</a>
        </div>
        <table class="dataTable">
            <tr>
                <th>类别</th>
                <th>条目</th>
                <th>值</th>
                <th>是否可编辑</th>
                <th>操作</th>
            </tr>
            <c:forEach var="da" items="${dalist}">
	            <c:choose>
	            	<c:when test="${da.dictIsEditable == 0}">
		            	<tr>
			                <td class="dictType">${da.dictType}</td>
			                <td>${da.dictItem}</td>
			                <td>${da.dictValue}</td>
			                <td>否</td>
			                <td></td>
		            	</tr>
	            	</c:when>
	            	<c:otherwise>
			            <tr>
			                <td>${da.dictType}</td>
			                <td>${da.dictItem}</td>
			                <td>${da.dictValue}</td>
			                <td>是</td>
			                <td>
			                    <a href="updshowpage?id=${da.dictId}"><img src="../images/33.gif" title="编辑" style="border:0px"/></a>
			                    <a href="datadictionaryDel?id=${da.dictId}" class="del"><img src="../images/bt_del.gif" title="删除" style="border:0px"/></a>
			                </td>
			            </tr>
	            	</c:otherwise>
	            </c:choose>
            </c:forEach>
        </table>
    </div>
</body>
</html>
