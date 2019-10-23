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
				$("#ok").click(function(){
					if (confirm("是否确认修改")){
					var type=$("#chose>option:selected").val();
					var tiaomu=$("#tiaomu").val();
					var zhi=$("#zhi").val();
					var state=0;
					var id=$("#hide").val();
					if($("#isok")[0].checked){
						state=1 
					}
					$(location).attr("href","updshow?type="+type+"&tiaomu="+tiaomu+"&zhi="+zhi+"&state="+state+"&id="+id);
					   alert("修改成功！");
					   return true;
					} else {
						 alert("已取消！");
						 return false;
					}
					 return false;
				})
				$("#ko").click(function(){
					$(location).attr("href","datadictionaryList");
				})
			})
		</script>

    <link href="../CSS/Style2.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <table class="tableEdit">
        <thead>
            <tr>
                <td colspan="4">数据字典条目编辑</td>
            </tr>
        </thead>
        <tr>
            <th>类别：</th>
            <td>
                <select  id="chose">
                	<c:choose>
                		<c:when test="${pg.dictIsEditable==0}">
		                    <option selected>客户等级</option>
		                    <option>服务类型</option>
                		</c:when>
                		<c:otherwise>
		                    <option>客户等级</option>
		                    <option selected>服务类型</option>                		
                		</c:otherwise>
                	</c:choose>
                </select>
            </td>
            <th>条目：</th>
            <td>
                <input id="tiaomu" type="text" value="${pg.dictItem }"/>
            </td>
        </tr>
        <tr>
            <th>值：</th>
            <td><input id="zhi" type="text" value="${pg.dictValue }"/></td>
            <th>是否可编辑：</th>
            <td>
            	<input id="isok" type="checkbox" />
            	<input id="hide" type="text" value="${pg.dictId }" style="display:none"></input>
            </td>
        </tr>
        <tfoot>
            <tr>
                <td colspan="4">
                    <input type="button" value="确定"  id="ok"/>&nbsp;&nbsp;
                    <input type="button" value="返回" id="ko"/>
                </td>
            </tr>
        </tfoot>
    </table>
</body>
</html>
