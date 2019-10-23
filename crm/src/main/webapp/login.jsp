<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>CRM客户关系管理系统</title>
    <style type="text/css">
        body
        {
            margin: 0px;
            background-color: #016aa9;
            overflow: hidden;
        }
        .STYLE1
        {
            color: #000000;
            font-size: 12px;
        }
    </style>
    <script type="text/javascript">
    function check(){
    	var username=document.getElementById("username").value;
    	var password=document.getElementById("password").value;
    	if(username=="" || username==null){
    		alert("用户名不能为空! ");
			return false;
    	}else if(password==""){ 
    		alert("密码不能为空!");
    		return false;
    	}
    	return true;
    }
    
    
    </script>
</head>
<body>
  <form action="/login" onsubmit="return check()">
    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table width="962" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td height="235" background="images/login_03.gif">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td height="53">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="394" height="53" background="images/login_05.gif">
                                        &nbsp;
                                    </td>
                                    <td width="206" background="images/login_06.gif">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="16%" height="25">
                                                    <div align="right">
                                                        <span class="STYLE1">用&nbsp;户:</span></div>
                                             </td>
                                                <td width="58%" height="25">
                                                    <div align="center">
                                                         <input   id="username" type="text" name="userName" style="width: 105px; height: 17px; background-color: #292929;
                                                        border: solid 1px #7dbad7; font-size: 12px; color: #6cd0ff"><span id="span1"></span></input> 
                                                        
                                                    </div>
                                                  </td>
                                               <td width="27%" height="25">
                                                    &nbsp;
                                           </td>
                                         </tr>   
                                            <tr>
                                                <td height="25">
                                                    <div align="right">
                                                       <span class="STYLE1">密&nbsp;码:</span></div>
                                                     </td>
                                                 <td height="25">
                                              <div align="center">  
                                         <input id="password" type="password" name="userPassword" style="width: 105px; height: 17px; background-color: #292929;
                                                           border: solid 1px #7dbad7; font-size: 12px; color: #6cd0ff"></input>
                                                            <span id="span2"></span>
                                            </div>
                                              </td>
                                                <td height="25">
                                                    <div align="left">
                                                       <input type="submit" value=" "  style="background-image:url(images/dl.gif);border:none;width:49px;height:18px;cursor:pointer" />
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                      </td>    
                                    <td width="362" background="images/login_07.gif  ">
			                                        &nbsp;
			                                        &nbsp;  
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                  <tr>
                        <td height="130" background="i	mages/login_08.gif" align="middle">
                            &nbsp; &nbsp;&nbsp; &nbsp;  &nbsp; &nbsp;&nbsp; &nbsp;
							 &nbsp; &nbsp;&nbsp; &nbsp;  &nbsp; &nbsp;&nbsp; &nbsp;
							 &nbsp; &nbsp;&nbsp; &nbsp;  &nbsp; &nbsp;&nbsp; &nbsp;
							 &nbsp; &nbsp;&nbsp; &nbsp;  &nbsp; &nbsp;&nbsp; &nbsp;
							 &nbsp; &nbsp;&nbsp; &nbsp;  &nbsp; &nbsp;&nbsp; &nbsp;
							 &nbsp; &nbsp;
                           
                            <input  name="button" id="button" value="     注册" onclick="window.location='register.jsp'" style="width: 60px; height: 20px; background-color: #292929;
                                                           border: solid 1px #7dbad7; font-size: 13px; color: #6cd0ff;cursor:pointer"></input>  
                                   
                        </td>
                     </tr>
                   </table>
                 </td>
               </tr>
            </table>
          </form>
       </body>
     </html>
