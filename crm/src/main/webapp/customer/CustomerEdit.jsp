<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title></title>
    <link href="../CSS/style2.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript" src="js/jquery-3.4.1.js" ></script>
	<script>
	 $(function(){
		 var key=$("#selectRe").val();
		 //根据值让option选中--地区
		 $("#selectcheck option[value='"+key+"']").attr("selected","selected"); 
		 
		 var key1=$("#relation").val();
		//根据值让option选中--客户等级
		 $("#relationcheck option[value='"+key1+"']").attr("selected","selected"); 
		
		 var key2=$("#satisfaction").val();
		//根据值让option选中--客户满意度
		$("#satisfactioncheck option[value='"+key2+"']").attr("selected","selected"); 
		
		var key3=$("#credit").val();
		//根据值让option选中--客户信用度
		$("#creditcheck option[value='"+key3+"']").attr("selected","selected");
	 })
	</script>
<body>
<form action="/WljUpdateByid">
<table class="tableEdit">
        <thead>
            <tr>
                <td colspan="4">客户基本信息</td>
            </tr>
        </thead>
        <tr>
            <th>客户编号：</th>
            <td>
                <input readonly="readonly" value="${wljSelectByid.custNo}" name="custNo" />
            </td>
            <th>客户经理：</th>
            <td>
				<input readonly="readonly" value="${wljSelectByid.custManagerName}" name="custManagerName" />
            </td>
        </tr>
        <tr>
            <th>客户名称：</th>
            <td>
                <input type="text" value="${wljSelectByid.custName}" name="custName"/>
             </td>
            <th>地区：</th>
            <td>
            	<input type="hidden" id="selectRe" name="custRegion1" value="${wljSelectByid.custRegion}">
                <select id="selectcheck" name="custRegion">
                    <option value="华北">华北</option>
                    <option value="华南">华南</option>
                    <option value="中南">中南</option>
                    <option value="西北">西北</option>
                    <option value="北京">北京</option>
                    <option value="东北">东北</option>
                    <option value="河南">河南</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>客户等级：</th>
            <td>
                <input type="hidden" id ="relation" name="custLevel1" value="${wljSelectByid.custLevel}"/>
                <select id="relationcheck"  name="custLevel">
                    <option value="1">低级</option>
                    <option value="2">中级</option>
                    <option value="3">高级</option>
                    <option value="4">vip</option>
                    <option value="5">特级</option>
                </select>
             </td>
            <th></th><td></td>
        </tr>
        <tr>
            <th>客户满意度：</th>
            <td>
                <input type="hidden" id ="satisfaction" name="custSatisfy1" value="${wljSelectByid.custSatisfy}"/>
                <select id="satisfactioncheck" name="custSatisfy">
                    <option value="1">一般</option>
                    <option value="2">较好</option>
                    <option value="3">比较满意</option>
                    <option value="4">满意</option>
                    <option value="5">特别满意</option>
                </select>
             </td>
            <th>客户信用度：</th>
            <td>
                <input type="hidden" id ="credit" name="custCredit1" value="${wljSelectByid.custCredit}"/>
                <select id="creditcheck" name="custCredit">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </td>
        </tr>
    </table>
    <p></p>
    <table class="tableEdit">
        <thead>
            <tr>
                <td colspan="4">客户联系信息</td>
            </tr>
        </thead>
        <tr>
            <th>地址：</th>
            <td>
                <input type="text" style="width:300px"  value="${wljSelectByid.custAddr}" name="custAddr" />
            </td>
            <th>邮编：</th>
            <td>
                <input type="text"  value="${wljSelectByid.custTel}" name="custTel" />
            </td>
        </tr>
        <tr>
            <th>电话：</th>
            <td>
                <input type="text"  value="${wljSelectByid.custZip}" name="custZip" />
            </td>
            <th>传真：</th>
            <td>
                <input type="text"  value="${wljSelectByid.custFax}" name="custFax" />
            </td>
        </tr>
        <tr>
            <th>网咨：</th>
            <td>
                <input type="text"  value="${wljSelectByid.custWebsite}" name="custWebsite" />
            </td>
            <th></th><td></td>
        </tr>
    </table>
    <p></p>
    <table class="tableEdit">
        <thead>
            <tr>
                <td colspan="4">公司信息</td>
            </tr>
        </thead>
        <tr>
            <th>营业执照号：</th>
            <td>
                <input type="text"  value="${wljSelectByid.custLicenceNo}" name="custLicenceNo" />
            </td>
            <th>法人：</th>
            <td>
                <input type="text"  value="${wljSelectByid.custChieftain}" name="custChieftain" />
            </td>
        </tr>
        <tr>
            <th>注册资金(万元)：</th>
            <td>
                <input type="text"  value="${wljSelectByid.custBankroll}" name="custBankroll" />
            </td>
            <th>年营业额：</th>
            <td>
                <input type="text"  value="${wljSelectByid.custTurnover}" name="custTurnover" />
            </td>
        </tr>
        <tr>
            <th>开户银行：</th>
            <td>
                <input type="text"  value="${wljSelectByid.custBank}" name="custBank" />
            </td>
            <th>银行账号：</th>
            <td>
                <input type="text"  value="${wljSelectByid.custBankAccount}" name="custBankAccount" />
            </td>
        </tr>
        <tr>
            <th>地税登记号：</th>
            <td>
                <input type="text"  value="${wljSelectByid.custLocalTaxNo}" name="custLocalTaxNo" />
            </td>
            <th>国税登记号：</th>
            <td>
                <input type="text"  value="${wljSelectByid.custNationalTaxNo}" name="custNationalTaxNo" />
            </td>
        </tr>
    </table>
    <p></p>
    <input type="submit" value="保存" />&nbsp;&nbsp;
    <a href="/CstCall"><input type="button" value="返回" /></a>
    </form>
</body>
</html>
