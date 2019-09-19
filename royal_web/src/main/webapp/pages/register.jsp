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

</head>
<body>


<!-- 头部 -->
<jsp:include page="common/header.jsp" />



<div class="hm-header">
    <div class="hm-inner clearfix">
        <div class="hm-header-t clearfix">
            <h1 class="logo l">
                <a href="javascript:;"><img src="/images/logo.png" height="64" width="168" alt=""/></a>
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
            <a href="${pageContext.request.contextPath}/index.jsp">首页</a><span>></span>注册页面
        </div>
    </div>
</div>


<div class="hm-body hm-body-bgc">
    <div class="hm-inner">
        <div class="reg-box">
            <h2>用户注册<span>（红色型号代表必填）</span></h2>
            <div class="reg-info">
                <form action="${pageContext.request.contextPath}/user/register.do" method="post" id="registerForm" onsubmit="return checkForm()">
                    <ul>
                        <li>
                            <div class="reg-l">
                                <span class="red">*</span> 用户名：
                            </div>
                            <div class="reg-c">
                                <input type="text" id="userName" name="username" class="txt" onblur="checkUsername()" value="${userInfo.username}" />
                                <span id="userTips" style="color: red" >${resultInfo.msg}</span>
                            </div>
                            <span class="tips" >用户名必须是由英文、数字、下划线组成</span>

                        </li>
                        <li>
                            <div class="reg-l">
                                <span class="red">*</span> 密&nbsp;&nbsp;&nbsp;码：
                            </div>
                            <div class="reg-c">
                                <input type="password" id="userPass" name="userpass" class="txt" oninput="checkUserpass()"/>
                                <span id="pwdTips" style="color: red" ></span>
                            </div>
                            <span class="tips">密码长度必须6~10位的英文或数字</span>
                        </li>
                        <li class="no-tips">
                            <div class="reg-l">&nbsp;&nbsp;邮&nbsp;&nbsp;&nbsp;箱：</div>
                            <div class="reg-c">
                                <input type="email" id="email" name="email" class="txt" value="${userInfo.email}" />
                            </div>
                        </li>
                        <li>
                            <div class="reg-l"></div>
                            <div class="reg-c">
                                <input type="submit" id="registerBtn" class="submit-btn" value="注册"/><br/>
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

<script type="text/javascript">
   $(function () {



   })

    /*
        *   用户名必填，并且填入信息必须由英文、数字、下划线组成。/^[a-zA-Z0-9_]*$/
            密码必填，密码长度保证6-10位英文或者数字组成。/^[a-zA-Z0-9]{6,10}$/
            邮箱必填，并且注册前存在格式合法性校验
            /^[a-z0-9]+@([a-z0-9]+\.)+[a-z]{2,4}$/
           用户名检验，保证用户名的唯一性。*/
   function checkForm() {
        var ureg=/^[a-zA-Z0-9_]*$/;
        var uname=$("#userName").val();
        if(!ureg.test(uname)){
            alert("用户名必须由英文、数字、下划线组成");
            return false;
        }

        var preg=/^[a-zA-Z0-9]{6,10}$/;
        var pwd=$("#userPass").val()
        if(!preg.test(pwd)){
            alert("密码必须为6-10位英文或者数字");
            return false;
        }
        return checkUsername()&&checkUserpass();


    }

   function checkUsername(){
       $("#userTips").html("");
       document.getElementById("userTips").style.color="red";
       var reg=/^\w*$/;
       var uname=$('#userName').val();
       if(!uname){
           $("#userTips").html("用户名不能为空");
           return false;
       }
       else if(!reg.test(uname)){
           $("#userTips").html("用户名格式有误")
           return false;
        }
       else{
           $.ajax({
               url:"${pageContext.request.contextPath}/user/checkUsernameByAjax.do",
               data:{"username": uname},
               //contentType:"application/json",
               type:"post",
               dataType:"json",
               success:function (data) {
                   if(data.success){
                       $("#userTips").html("用户名可用");
                       document.getElementById("userTips").style.color="green";
                       return true;

                   }else {
                       $("#userTips").html("用户名已被占用");
                       return false;
                   }
               }
           });
       }


   }


   function checkUserpass(){
       $("#pwdTips").html("");
       document.getElementById("pwdTips").style.color="red";
       var reg=/^[a-zA-Z0-9]{6,10}$/;
       var pwd=$("#userPass").val();
       if(!pwd){
           $("#pwdTips").html("密码不能为空")
           return false;
       }
       else if(!reg.test(pwd)){
           $("#pwdTips").html("密码格式有误");
           return false;
       }
       $("#pwdTips").html("密码可用");
       document.getElementById("pwdTips").style.color="green";
       return true;

   }







</script>
</html>