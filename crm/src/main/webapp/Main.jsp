﻿<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>CRM客户关系管理系统</title>
    <link href="CSS/left.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery.js"></script>
    <!-- <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>   -->
    <script src="js/jquery-easyui-1.4.1/jquery.easyui.min.js" type="text/javascript"></script>
    <link href='js/jquery-easyui-1.4.1/themes/color.css' rel='stylesheet' type='text/css' />
    <link href='js/jquery-easyui-1.4.1/themes/gray/easyui.css' rel='stylesheet' type='text/css' />
    <link href='js/jquery-easyui-1.4.1/themes/icon.css' rel='stylesheet' type='text/css' />
    <script src='js/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js' type='text/javascript'></script>
    <style type="text/css">
        body {
            margin: 0px;
        }

        .STYLE1 {
            font-size: 12px;
            color: #FFFFFF;
        }

        .STYLE2 {
            font-size: 9px;
        }

        .STYLE3 {
            color: #033d61;
            font-size: 12px;
        }
    </style>
    <script type="text/javascript">
        $(function(){
            $(".menuDiv").click(function () {
                $(this).next("div").slideToggle(300);
            });
        });
        $(function () {
            $("span").click(function () {
                var a = $(this).children("a")
                var url = a.attr("url");
                $("#page").attr("src", url + "?" + Math.random());
            });
        });
    </script>
    
</head>
<%@ include file="logincheck.jsp" %>
<body class="easyui-layout">
	<%
		Date d = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd E");
		String now = df.format(d);
	%>

    <div data-options="region:'north',split:false" style="height:102px">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td height="70" background="images/main_05.gif">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td height="24">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="270" height="24" background="images/main_03.gif">&nbsp;</td>
                                        <td width="505" background="images/main_04.gif">&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td width="21"><img src="images/main_07.gif" width="21" height="24" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td height="38">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="270" height="38" background="images/main_09.gif">&nbsp;</td>
                                        <td>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="77%" height="25" valign="bottom">
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0"></table>
                                                    </td>
                                                    <td width="220" valign="bottom" nowrap="nowrap"><div align="right"><span class="STYLE1"><span class="STYLE2"></span>今天是：<%=now %></span></div></td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td width="21"><img src="images/main_11.gif" width="21" height="38" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td height="8" style=" line-height:8px;">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="270" background="images/main_29.gif" style=" line-height:8px;">&nbsp;</td>
                                        <td width="505" background="images/main_30.gif" style=" line-height:8px;">&nbsp;</td>
                                        <td style=" line-height:8px;">&nbsp;</td>
                                        <td width="21" style=" line-height:8px;"><img src="images/main_31.gif" width="21" height="8" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td height="28" background="images/main_36.gif">
                    <div style="background-image:url(images/main_32.gif);width:177px;height:28px;text-align:center;color:White;font-size:12px;line-height:35px;float:left">
                        ${sysUserl.userName }
                    </div>
                    <div style="float:right;font-size:12px;line-height:35px;margin-right:5px;margin-top:3px;">
                        <a href="/logout"><img src="images/main_20.gif" style="border:solid 0px red"/></a>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <div data-options="region:'west',split:false" style="width:160px">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td id="td1"></td>
                <td id="td2">
                    <div id="div1">
                        管理菜单
                    </div>
                    <div id="div2">
                        <!--菜单开始 -->
                        <!--父菜单 -->
                        <div class="menuDiv">营销管理</div>
                        <!--子菜单 -->
                        <div class="contentDiv" style="display:none">
                            <div><img src="images/left.gif" /><span><a href="#" url="salchancelist">销售机会管理</a></span></div>
                            <div><img src="images/left.gif" /><span><a href="#" url="salManagerList">客户开发计划</a></span></div>
                        </div>
                        <!--菜单结束 -->
                        <!--父菜单 -->
                        <div class="menuDiv">客户管理</div>
                        <!--子菜单 -->
                        <div class="contentDiv" style="display:none">
                            <div><img src="images/left.gif" /><span><a href="#" url="CstCall">客户信息管理</a></span></div>
                            <div><img src="images/left.gif" /><span><a href="#" url="wljSelectKhKhls">客户流失管理</a></span></div>
                        </div>
                        <!--父菜单 -->
                        <div class="menuDiv">服务管理</div>
                        <!--子菜单 -->
                        <div class="contentDiv" style="display:none">
                            <div><img src="images/left.gif" /><span><a href="#" url="customerService/ServiceCreate.jsp">服务创建</a></span></div>
                            <div><img src="images/left.gif" /><span><a href="#" url="customerService/ServiceAllot.jsp">服务分配</a></span></div>
                            <div><img src="images/left.gif" /><span><a href="#" url="customerService/ServiceDispose.jsp">服务处理</a></span></div>
                            <div><img src="images/left.gif" /><span><a href="#" url="customerService/ServiceResult.jsp">服务反馈</a></span></div>
                            <div><img src="images/left.gif" /><span><a href="#" url="customerService/ServiceDetail.jsp">服务归档</a></span></div>
                        </div>
                        <!--父菜单 -->
                        <div class="menuDiv">统计报表</div>
                        <!--子菜单 -->
                        <div class="contentDiv" style="display:none">
                            <div><img src="images/left.gif" /><span><a href="#" url="report/ContributeReport.jsp">客户贡献分析</a></span></div>
                            <div><img src="images/left.gif" /><span><a href="#" url="report/MakeReport.jsp">客户构成分析</a></span></div>
                            <div><img src="images/left.gif" /><span><a href="#" url="report/ServerReport.jsp">客户服务分析</a></span></div>
                            <div><img src="images/left.gif" /><span><a href="#" url="report/LostReport.jsp">客户流失分析</a></span></div>
                        </div>
                        <!--父菜单 -->
                        <div class="menuDiv">基础数据</div>
                        <!--子菜单 -->
                        <div class="contentDiv" style="display:none">
                            <div><img src="images/left.gif" /><span><a href="#" url="/datadictionaryList">数据字典管理</a></span></div>
                            <div><img src="images/left.gif" /><span><a href="#" url="/findNTB">查询产品信息</a></span></div>
                            <div><img src="images/left.gif" /><span><a href="#" url="/findWW">查询库存</a></span></div>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <div data-options="region:'center'" style="width:1000px;height:1000px" >
        <iframe id="page" name="page" scrolling="auto" frameborder="0" src="default.jsp" style="width:100%;height:98.5%;"></iframe>
    </div>
</body>
</html>
