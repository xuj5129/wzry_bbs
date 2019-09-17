<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>王者荣耀论坛注册页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common-new.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/search.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript">
        $(function () {

            //用户名输入框离焦，发送Ajax请求，校验用户名是否可用
            $("#username").blur(function () {
                var username = $("#username").val();
                if (username) {
                    $.ajax({
                        url:"${pageContext.request.contextPath}/user/checkUsernameByAjax.do",
                        data:{username: username},
                        //contentType:"application/json",
                        type:"post",
                        dataType:"json",
                        success:function (data) {
                            if(data.success){
                                $("#userTips").html("用户名可用");
                            }else {
                                $("#userTips").html("该用户名已被注册过");
                            }

                        }
                    });


                }

            })

            //用户注册

            /*
            *   用户名必填，并且填入信息必须由英文、数字、下划线组成。/^[a-zA-Z0-9_]*$/
                密码必填，密码长度保证6-10位英文或者数字组成。/^[a-z|A-Z|0-9]{6,10}$/
                邮箱必填，并且注册前存在格式合法性校验
                /^[a-z0-9]+@([a-z0-9]+\.)+[a-z]{2,4}$/
               用户名检验，保证用户名的唯一性。
            * */
            $("#registerBtn").click(function () {
                if($("#username").val() && $("#userpass").val()&& $("email").val()) {
                    $.ajax({
                        url:"${pageContext.request.contextPath}/user/register.do",
                        // data:$("#logForm").serialize(),

                        data:{username:$("#username").val(),userpass:$("#userpass").val(),email:$("email").val()},
                        //contentType:"application/json",
                        type:"post",
                        dataType:"json",
                        success:function (data) {
                            if(data.success){
                                location.href="${pageContext.request.contextPath}/pages/success.jsp";
                            }
                            else {

                            }

                        }
                    });
                }


            });
        })
    </script>
</head>
<body>


<!-- 头部 -->
<jsp:include page="common/header.jsp" />



<div class="hm-header">
    <div class="hm-inner clearfix">
        <div class="hm-header-t clearfix">
            <h1 class="logo l">
                <a href="javascript:;"><img src="images/logo.png" height="64" width="168" alt=""/></a>
            </h1>
            <div class="search-box l">
                <form action="javascript:;">
                    <input type="text" class="txt l" placeholder="请输入关键字">
                    <input type="button" value="搜索" class="btn l"/>
                </form>
            </div>
        </div>
        <div class="hm-header-b">
            <i class="hm-ico-home"></i>
            <a href="index.do">首页</a><span>></span>注册页面
        </div>
    </div>
</div>


<div class="hm-body hm-body-bgc">
    <div class="hm-inner">
        <div class="reg-box">
            <h2>用户注册<span>（红色型号代表必填）</span></h2>
            <div class="reg-info">
                <form action="#" method="post" id="registerForm">
                    <ul>
                        <li>
                            <div class="reg-l">
                                <span class="red">*</span> 用户名：
                            </div>
                            <div class="reg-c">
                                <input type="text" id="username" name="username" class="txt" value=""/>
                            </div>
                            <span class="tips" >用户名必须是由英文、数字、下划线组成</span>
                            <span id="userTips" style="color: red"></span>
                        </li>
                        <li>
                            <div class="reg-l">
                                <span class="red">*</span> 密&nbsp;&nbsp;&nbsp;码：
                            </div>
                            <div class="reg-c">
                                <input type="password" id="userpass" name="userpass" class="txt" value=""/>
                            </div>
                            <span class="tips">密码长度必须6~10位的英文或数字</span>
                        </li>
                        <li class="no-tips">
                            <div class="reg-l">&nbsp;&nbsp;邮&nbsp;&nbsp;&nbsp;箱：</div>
                            <div class="reg-c">
                                <input type="email" id="email" name="email" class="txt" value=""/>
                            </div>
                        </li>
                        <li>
                            <div class="reg-l"></div>
                            <div class="reg-c">
                                <input type="button" id="registerBtn" class="submit-btn" value="注册"/><br/>
                            </div>
                        </li>
                    </ul>
                </form>
            </div>
        </div>
    </div>
</div>




<!-- 底部 -->
<jsp:include page="common/footer.jsp"/>


</body>
</html>