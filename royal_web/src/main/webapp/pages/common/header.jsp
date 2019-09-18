<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
</head>
<body>
<div class="hm-top-nav">
    <div class="hm-inner clearfix">
        <div class="hm-inner-l l"></div>
        <div class="hm-inner-r r">
            <div class="box">
                <c:if test="${empty existUser}">
                    <!-- 未登录状态 -->
                        <a href="javascript:;" id="login" class="to-login">游客登录</a>
                        <a href="${pageContext.request.contextPath}/pages/register.jsp">【新用户注册】</a>
                </c:if>
                <c:if test="${not empty existUser}">
                    <!-- 登录状态 -->
                        <span>欢迎 ${existUser.roleStr}:${existUser.username}</span>
                        <a href="${pageContext.request.contextPath}/pages/userInfo.jsp" id="myFavorite">个人中心</a>
                        <a href="javascript:logout()">注销</a>
                </c:if>


                <%--<a href="javascript:;" id="login" class="to-login">游客登录</a>
                <a href="${pageContext.request.contextPath}/pages/register.jsp">【新用户注册】</a>--%>
                <div id="dialogBg"></div>
                <div id="dialog" class="animated">
                    <img class="dialogIco" width="50" height="40" src="${pageContext.request.contextPath}/images/ico.png"/>
                    <div class="dialogTop" style="height:25px;">
                        <a href="javascript:;" class="closeDialogBtn">关闭</a>
                    </div>
                    <form action="#" method="post" id="logForm">
                        <ul class="editInfos">
                            <li>用户名：<input type="text" id="username" name="username" class="ipt"/></li>
                            <li>密&nbsp;&nbsp;&nbsp;码：<input type="password" id="userpass" name="userpass" class="ipt"/></li>
                            <li style="height: 20px"><span id="pwdLoginInfo" style="color: red"></span></li>
                            <li><input type="button" id="loginBtn" value="登录" class="submitBtn"/></li>


                        </ul>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
  $(function () {

      //密码登录
      $("#loginBtn").click(function () {

          if ($("#username").val() && $("#userpass").val()) {
              $.ajax({
                  url:"${pageContext.request.contextPath}/user/login.do",
                  // data:$("#logForm").serialize(),

                  data:{username:$("#username").val(),userpass:$("#userpass").val()},
                  //contentType:"application/json",
                  type:"post",
                  dataType:"json",
                  success:function (data) {
                      if(data.success){
                          location.reload();
                      }
                      else {
                          $("#pwdLoginInfo").html(data.msg);
                      }

                  }
              });
          }



      });
      //显示弹框
      $('.box #login').click(function () {
          var className = $(this).attr('class');
          $('#dialogBg').fadeIn(300);
          $('#dialog').removeAttr('class').addClass('animated ' + className + '').fadeIn();
          $('#userName').focus();
          $("#j_fixedBar").hide();
      });

      //关闭弹窗
      $('.closeDialogBtn').click(function () {
          $('#dialogBg').fadeOut(300, function () {
              $('#dialog').addClass('bounceOutUp').fadeOut();
              $("#j_fixedBar").show();
          });
      });
  });


//用户退出
  function logout() {
      if(confirm("您确定要退出吗？")){
          location.href="${pageContext.request.contextPath}/user/logout.do"
      }

  }
</script>
</html>