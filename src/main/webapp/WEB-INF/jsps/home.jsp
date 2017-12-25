<%@page import="java.util.Map"%>
<%@page import="com.vlifepaper.system.model.RegisterTag"%>
<%@page import="com.vlifepaper.system.model.LoginTag"%>
<%@page import="com.vlifepaper.system.model.CommonUtils"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
String appContext = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + appContext;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>欢  迎</title>
    <link rel="stylesheet" href="<%= appContext%>/resources/bootstrap/css/bootstrap.css">
    <script src="<%= appContext %>/resources/js/jquery.js"></script>
    <script src="<%= appContext %>/resources/bootstrap/js/bootstrap.js"></script>

    <style>
    	*{
    		margin: 0px;
    		padding: 0px;
    	}
        body{
            background-color: #C7EDCC;
            font-family: "microsoft yahei";
            /*min-width: 800px;*/
        }
        img{
            width: 100%;
            /*height: 462px;*/
        }
        .navbar{
            /*margin-bottom: -10px;*/
        }
        #myppt{
            margin-top: -20px;

        }
        #loginErrorMsg,#registerErrorMsg{
        	color: red;
        }
        #passwdFind{
        	float: right;
        	position: relative;
        	top:0px;
        }
        .invalid:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
		    color: red;  
		}
		.invalid::-moz-placeholder { /* Mozilla Firefox 19+ */
		    color: red;
		}
		input.invalid:-ms-input-placeholder{
		    color: red;
		}
		input.invalid::-webkit-input-placeholder {
		    color: red;
		}
    </style>
</head>
<body>
<!-- 导航栏 -->
<ul class="nav navbar-nav navbar-right">
    <li><a data-toggle="modal" data-target="#register" href=""><span class="glyphicon glyphicon-user"></span> 注册</a></li>
    <li><a data-toggle="modal" data-target="#login" href=""><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
</ul>

<!-- 登录窗口 -->
<div id="login" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <button class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-title">
                <h1 class="text-center">登录</h1>
            </div>
            <div class="modal-body">
                <form class="form-group" id="loginForm" name="loginForm" method="post" action="<%= appContext%>/account/login">
                    <div class="form-group">
                        <label for="userName-login">用户名</label>
                        <input class="form-control" id="userName-login" name="userName" type="text" placeholder="正确的邮箱地址">
                    </div>
                    <div class="form-group">
                        <label for="passwd-login">密码</label>
                        <input class="form-control" id="passwd-login" name="passwd" type="password" placeholder="6-20位字母或数字">
                    </div>
                    <div class="form-group">
                    	<label id="loginErrorMsg"></label>
                    	<a style="float: right" href="" data-toggle="modal" data-dismiss="modal" data-target="#forgotPasswd">忘记密码？</a>
                    </div>
                    <div class="text-right">
                    	<a href="" data-toggle="modal" data-dismiss="modal" data-target="#register" style="float: left">还没有账号？点我注册</a>
                        <button class="btn btn-primary" type="button" onclick="javascript:loginBtnClick()">登录</button>
                        <button class="btn btn-danger" data-dismiss="modal">取消</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- 注册窗口 -->
<div id="register" class="modal fade" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <button class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-title">
                <h1 class="text-center">注册</h1>
            </div>
            <div class="modal-body">
                <form class="form-group" id="registerForm" action="<%= appContext%>/account/register">
                    <div class="form-group">
                        <label for="userName-register">用户名</label>
                        <input name="userName-register" id="userName-register" class="form-control" type="text" placeholder="正确的邮箱地址">
                    </div>
                    <div class="form-group">
                        <label for="passwd-register-first">密码</label>
                        <input name="passwd-register-first" id="passwd-register-first" class="form-control" type="password" placeholder="6-20位字母或数字">
                    </div>
                    <div class="form-group">
                        <label for="passwd-register-second">再次输入密码</label>
                        <input id="passwd-register-second" name="passwd-register-second" class="form-control" type="password" placeholder="6-20位字母或数字">
                    </div>
                    <label id="registerErrorMsg"></label>
                    <div class="text-right">
                    	<a href="" id="jumpToLogin" data-toggle="modal" data-dismiss="modal" data-target="#login" style="float: left;">已有账号？点我登录</a>
                        <button class="btn btn-primary" type="button" onclick="registerBtnClick()">提交</button>
                        <button class="btn btn-danger" data-dismiss="modal">取消</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- 忘记密码窗口 -->
<div id="forgotPasswd" class="modal fade" tabindex="-2">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <button class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-title">
                <h1 class="text-center">找回密码</h1>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="email" style="display: block;"> 邮箱</label>
                    <input name="email" id="email" class="form-control" type="text" placeholder="正确的邮箱地址" style="width: 79%;display: inline-block;">
                    <button type="button" id="sendEmailBtn" class="btn btn-primary" onclick="sendEmail()" style="float: right;">点击发送</button>
                </div>
                <div class="form-group">
                    <label for="validateCode">验证码</label>
                    <input name="validateCode" id="validateCode" class="form-control" type="text" placeholder="6位数字验证码">
                </div>
                <div class="form-group">
                    <label for="resetPasswd">重置密码</label>
                    <input name="resetPasswd" id="resetPasswd" class="form-control" type="password" placeholder="6-20位字母或数字">
                </div>
                <div class="text-right">
                	<a href="" data-toggle="modal" data-dismiss="modal" data-target="#login" style="float:left;">重置成功？点我登录</a>
                    <button class="btn btn-primary" type="button" onclick="resetPasswd()">提交</button>
                    <button class="btn btn-danger" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

<script type="text/javascript">
	//序列化表单
	$.fn.serializeObject = function()    
	{    
	   var o = {};    
	   var a = this.serializeArray();    
	   $.each(a, function() {    
	       if (o[this.name]) {    
	           if (!o[this.name].push) {    
	               o[this.name] = [o[this.name]];    
	           }    
	           o[this.name].push(this.value || '');    
	       } else {    
	           o[this.name] = this.value || '';    
	       }    
	   });    
	   return o;    
	};  
	
    $("#userName-login").click(function(){
    	$("#loginErrorMsg").text("");
    });
    
    $("#passwd-login").click(function(){
    	$("#loginErrorMsg").text("");
    });
    
    $("#userName-register").click(function(){
    	$("#registerErrorMsg").text("");
    });
    
    $("#passwd-register-first").click(function(){
    	$("#registerErrorMsg").text("");
    });
    
    $("#passwd-register-second").click(function(){
    	$("#registerErrorMsg").text("");
    });

    //登陆操作
    function loginBtnClick(){
		var username_login = $("#userName-login").val();
		var passwd_login = $("#passwd-login").val();
		
        //验证账号邮箱格式正则表达式
        var reg_account = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
     	//验证密码6-20位的字母+数字+下划线正则表达式
        var reg_passwd = /^(\w){6,20}$/;
        
        //判断表单输入是否合法
        if(reg_account.test(username_login)){
            if(reg_passwd.test(passwd_login)){
                $.ajax({
                	type:"POST",
                	url: "<%= request.getContextPath()%>/account/login",
                	data: JSON.stringify($("#loginForm").serializeObject()),
                	success:function(data){
                		var json = JSON.parse(data);
                		var loginStatus = json.status;
                		$("#passwd-login").val("");
                		switch (loginStatus){
                		case <%=LoginTag.SUCCESS %>:
                			window.location.href = "<%= request.getContextPath()%>/logined/home";
                			break;
                		case <%=LoginTag.PASSWD_OR_ACCOUNT_NULL %>:
                			$("#loginErrorMsg").text("账号或者密码为空");
                			break;
                		case <%=LoginTag.ACCOUNT_NOT_EXIST %>:
                			$("#loginErrorMsg").text("账号不存在");
                			break;
                		case <%=LoginTag.ACCOUNT_PASSWD_NOT_MATCH %>:
                			$("#loginErrorMsg").text("账号密码不匹配");
                			break;
                		default:
                			$("#loginErrorMsg").text("登陆失败");
                		}
                	},
                	error:function(data){
                		alert("未知错误!");
                	}
                });
            }else{
                //密码格式不合法，给出提示
                $("#loginErrorMsg").text("密码应为6-20位的字母+数字+下滑线");
            }
        }else{
            //账号格式不合法，给出提示
            $("#userName-login").val("");
            $("#loginErrorMsg").text("账号应为合法的邮箱格式");
        }
        $("#passwd-login").val("");
    }
    
    //注册操作
   	function registerBtnClick(){
   		var username = $("#userName-register").val();
   		var passwd = $("#passwd-register-first").val();
   		var passwdRepeat = $("#passwd-register-second").val();
   		
   		//注册信息-账户信息校验-标准的邮箱格式
   		var reg_account = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
   		//验证密码6-20位的字母+数字+下划线正则表达式
   		var reg_passwd = /^(\w){6,20}$/;
   		
   		//检查表单输入是否合法
   		if(reg_account.test(username)){
   			if(reg_passwd.test(passwd)){
   				if(passwd == passwdRepeat){
   					//账号，密码合法，两次密码输入一致
   					$.ajax({
   						url: "<%= appContext%>/account/register",
   						type:"POST",
   						data: JSON.stringify($("#registerForm").serializeObject()),
   						success: function(data){
   							var json = JSON.parse(data);
   	                		var registerStatus = json.status;
   	                		switch(registerStatus){
   	                		case <%= RegisterTag.SUCCESS%>:
   	                			alert("注册成功!");
   	                		    $("#jumpToLogin").trigger("click");
   	                		    break;
   	                		case <%= RegisterTag.ACCOUNT_PASSWD_NULL%>:
   	                			$("#registerErrorMsg").text("账号密码为空");
   	                		    break;
   	                		case <%= RegisterTag.ACCOUNT_INVAILD%>:
   	                			$("#registerErrorMsg").text("账号不合法");
   	                		    break;
	   						case <%= RegisterTag.PASSWD_INVAILD%>:
	   							$("#registerErrorMsg").text("密码不合法");
	                		    break;
		   					case <%= RegisterTag.PASSWD_NOT_SAME%>:
		   						$("#registerErrorMsg").text("两次密码不一致");
		            		    break;
		   					case <%= RegisterTag.ACCOUNT_ALEADY_EXIST%>:
		   						$("#registerErrorMsg").text("此账户已经注册过了，请直接登陆");
		            		    break;
		            		default:
		            			$("#registerErrorMsg").text("注册失败");
   	                		}
   	                			
   						},
   						error:function(){
   							alert("未知错误！");
   						}
   					});
   				}else{
   					$("#registerErrorMsg").text("两次输入密码不一致");
   				}
   			}else{
   				$("#registerErrorMsg").text("密码为6-20位的字母+数字+下滑线");
   			}
   		}else{
   			//TODO 将来不用alert
   			$("#registerErrorMsg").text("账号应该合法的邮箱格式");
   		}
   		//增加用户的体验，点击后密码就可以为空了。
   		$("#passwd-register-first").val("");
   		$("#passwd-register-second").val("");
   		
   	}
    
    //发送验证邮件
    function sendEmail(){
    	var email = $("#email").val();
    	
    	//注册信息-账户信息校验-标准的邮箱格式
   		var reg_account = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
    	if(reg_account.test(email)){
    		$.get({
        		url: "<%= appContext%>/account/forgotPasswd/" + email + "/",
        		data: null,
        		success: function(data){
        			$("#sendEmailBtn").attr("disabled",true);
        			$("#sendEmailBtn").text("60s后再次发送");
        			var time = 60;
        			var reSend = window.setInterval(function(){
        				time--;
        				if(time == 0){
            				window.clearInterval(reSend);
            				$("#sendEmailBtn").attr("disabled",false);
                			$("#sendEmailBtn").text("再次发送");
            			}else{
            				$("#sendEmailBtn").text(time + "s后再次发送");
            			}
        			}, 1000);
        			
        		},
    	    	error: function(data){
    				alert("fail!");
    			}
        	});
    	}else{
    		$("#email").val("");
    		$("#email").attr("placeholder","邮件格式有误")
    		$("#email").addClass("form-control invalid");
    		$("#email").focus();
    	}
    	 
    }
    
    //重置密码
    function resetPasswd(){
    	var reg_account = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
        var reg_passwd = /^(\w){6,20}$/;
    	var reg_validate = /^\d{6}$/;
    	var email =  $("#email").val().trim();
    	var validateCode = $("#validateCode").val().trim();
    	var passwd = $("#resetPasswd").val().trim();
    	var postData = {"email":email,"validateCode":validateCode,"passwd":passwd};
    	if(reg_account.test(email)){
    		if(reg_validate.test(validateCode)){
    			if(reg_passwd.test(passwd)){
    				$.post({
        				data: postData,
        				dataType: "json",
        				url: "<%= appContext%>/account/resetPasswd",
        				success:function(data){
        					alert(data);
        				},
        				error:function(){
        					alert("fail");
        				}
        			});
    			}else{
    				$("#resetPasswd").val("");
            		$("#resetPasswd").attr("placeholder","密码格式有误")
            		$("#resetPasswd").addClass("form-control invalid");
            		$("#resetPasswd").focus();
    			}
    		}else{
    			$("#validateCode").val("");
        		$("#validateCode").attr("placeholder","验证码格式有误")
        		$("#validateCode").addClass("form-control invalid");
        		$("#validateCode").focus();
    		}
    	}else{
    		$("#email").val("");
    		$("#email").attr("placeholder","邮件格式有误")
    		$("#email").addClass("form-control invalid");
    		$("#email").focus();
    	}
    }
</script>
</html>