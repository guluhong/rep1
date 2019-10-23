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
				$("#bt1").click(function(){
					var type=$("#chose>option:selected").val();
					var tiaomu=$("#tiaomu").val();
					var zhi=$("#zhi").val();
					var state=0;
					var id=$("#hide").val();
					if($("#isok")[0].checked){
						state=1 
					}
					$(location).attr("href","addshow?type="+type+"&tiaomu="+tiaomu+"&zhi="+zhi+"&state="+state+"&id="+id);
					alert("添加成功！");
				})
				$("#bt2").click(function(){
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
                <td colspan="4">新建数据字典条目</td>
            </tr>
        </thead>
        <tr>
            <th>类别：</th>
            <td>
                <select id="chose">
                    <option>客户等级</option>
                    <option>服务类型</option>
                </select>
            </td>
            <th>条目：</th>
            <td>
                <input id="tiaomu" type="text" />
            </td>
        </tr>
        <tr>
            <th>值：</th>
            <td><input id="zhi" type="text" /></td>
            <th>是否可以编辑：</th>
            <td><input id="isok" type="checkbox" />
            <input id="hide" type="text" style="display:none"></input></td>
        </tr>
        <tfoot>
            <tr>
                <td colspan="4">
                    <input  type="button" value="确定" id="bt1"/>&nbsp;&nbsp;
                    <input type="button" value="返回" id="bt2"/>
                </td>
            </tr>
        </tfoot>
    </table>
</body>
</html>
