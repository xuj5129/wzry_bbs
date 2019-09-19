<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>黑马程序员论坛首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common-new.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_info.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/search.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/hm-bbs.js"></script>
    <style type="text/css">
        .hm-header-b { border-bottom: 1px solid #d9d9d9; }
    </style>
</head>
<body>


<!-- 头部 -->
<jsp:include page="common/header.jsp" />



<!--头部信息-->
<div class="hm-header">
    <div class="hm-inner clearfix">
        <div class="hm-header-t clearfix">
            <h1 class="logo l">
                <a href="javascript:;"><img src="images/logo.png" alt=""/></a>
            </h1>

        </div>
        <div class="hm-header-b">
            <i class="hm-ico-home"></i>
            <a href="${pageContext.request.contextPath}/index.jsp">首页</a><span>></span>修改密码
        </div>
    </div>
</div>


<!--修改密码-->
<div class="hm-body hm-body-bgc">
    <div class="hm-inner">
        <div class="user-info clearfix">
            <div class="user-info-t" style="height:20px;"></div>
            <div class="user-info-l l">
                <div class="user-info-l-t">
                    <img src="${pageContext.request.contextPath}/images/${showUser.picurl}" alt=""/>
                    <div class="username">${existUser.username}</div>
                </div>
                <ul class="user-info-l-b">
                    <li><i class="info-icon"></i>我的资料</li>
                    <li class="cur"><i class="safe-icon"></i>修改密码</li>
                    <c:if test="${existUser.role == 2}">
                        <li><i class="safe-icon"></i>开辟新板块</li>
                    </c:if>
                    <c:if test="${existUser.role == 1}">
                        <li ><i class="safe-icon"></i>申请高级用户</li>
                    </c:if>
                </ul>
            </div>


            <div class="user-info-r r">
                <ul class="clearfix hd">
                    <li><a href="${pageContext.request.contextPath}/user/showUserCenter.do?pageCode=1&username=${existUser.username}">个人信息</a></li>
                    <li class="cur">修改密码</li>
                    <c:if test="${showUser.role == 2}">
                        <li ><a href="${pageContext.request.contextPath}/user/showUserCenter.do?pageCode=4&username=${existUser.username}">开辟新板块</a></li>
                    </c:if>
                    <%--普通用户--%>
                    <c:if test="${showUser.role == 1}">
                        <li><a href="${pageContext.request.contextPath}/user/showUserCenter.do?pageCode=3&username=${existUser.username}">申请高级用户</a></li>
                    </c:if>
                </ul>
                <form action="${pageContext.request.contextPath}/user/checkExistPwd.do" method="post">
                    <input type="hidden" name="username" value="${showUser.username}">
                  <ul class="bd">
                    <li class="clearfix">
                        <div class="info-l"><i class="red">*</i>旧密码：</div>
                        <div class="info-r"><input type="password"  value="${oldPassword}" onblur="checkPwd()" id="oldPassword" name="oldPassword" class="txt"/></div>
                    </li>
                    <li class="clearfix">
                        <div class="info-l"><i class="red">*</i>新密码：</div>
                        <div class="info-r"><input type="password" name="newPassword" value="${newPassword}" class="txt"/></div>
                    </li>
                    <li class="clearfix">
                        <div class="info-l"></div>
                        <div class="info-r">
						  <input type="submit" class="btn" value="保存"/>
						  <span style="color:red;">${pwdMsg.msg}</span>
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
<script>
    $(function () {
        if(${empty showUser}){
            if(${empty existUser}){
                alert("请先登录！")
                location.href="${pageContext.request.contextPath}/index.jsp"
            }
        }
    })
    function checkPwd() {
        if ($("#oldPassword").val()==""){
            alert("请输入旧密码");
            return;
        }
    }
</script>
</body>
</html>