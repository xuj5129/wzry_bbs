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
                <a href="javascript:;"><img src="images/logo.png" height="64" width="168" alt=""/></a>
            </h1>

        </div>
        <div class="hm-header-b">
            <i class="hm-ico-home"></i>
            <a href="${pageContext.request.contextPath}/index.jsp">首页</a><span>></span>个人信息
        </div>
    </div>
</div>



<div class="hm-body hm-body-bgc">
    <div class="hm-inner">
        <div class="user-info clearfix">
            <div class="user-info-t" style="height:20px;"></div>

            <!--左侧用户名，头像-->
            <div class="user-info-l l">
                <div class="user-info-l-t">
                    <img src="${pageContext.request.contextPath}/images/${showUser.picurl}"/>
                    <div class="username">${showUser.username}</div>
                </div>
                <ul class="user-info-l-b">
                    <li class="cur"><i class="info-icon"></i>我的资料</li>
                    <li><i class="safe-icon"></i>修改密码</li>
                    <c:if test="${showUser.role == 2}">
                    <li><i class="safe-icon"></i>开辟新板块</li>
                    </c:if>
                    <c:if test="${showUser.role == 1}">
                        <li ><i class="safe-icon"></i>申请高级用户</li>
                    </c:if>
                </ul>
            </div>


            <!--右侧用户信息-->
            <div class="user-info-r r">
                <ul class="clearfix hd">

                    <li class="cur"><a href="">个人信息</a></li>
                    <li><a href="${pageContext.request.contextPath}/user/showUserCenter.do?pageCode=2&username=${existUser.username}">修改密码</a></li>
                    <%--高级用户--%>
                    <c:if test="${showUser.role == 2}">
                    <li><a href="${pageContext.request.contextPath}/user/showUserCenter.do?pageCode=4&username=${existUser.username}">开辟新板块</a></li>
                    </c:if>
                    <%--普通用户--%>
                    <c:if test="${showUser.role == 1}">
                    <li><a href="${pageContext.request.contextPath}/user/showUserCenter.do?pageCode=3&username=${existUser.username}">申请高级用户</a></li>
                    </c:if>

                </ul>

                <form action="${pageContext.request.contextPath}/user/changeEmailAndFileUpload.do" method="post" enctype="multipart/form-data">
                    <ul class="bd">
                        <li class="clearfix">
                            <div class="info-l"><i class="red">*</i>用户名：</div>
                            <div class="info-r"><input type="text" class="txt" name="username" value="${showUser.username}" readonly="readonly"/></div>
                        </li>
                        <li class="clearfix">
                            <div class="info-l">邮箱地址：</div>
                            <div class="info-r"><input type="text" name="email" class="txt" value="${showUser.email}"/></div>
                        </li>
                        <li class="clearfix">
                            <div class="info-l">上传头像：</div>
                            <div class="info-r"><input type="file" name="file" class="file-btn"/></div>
                        </li>
                        <li class="clearfix">
                            <div class="info-l"></div>
                            <div class="info-r">
                                <input type="submit" class="btn" value="保存"/>
                                <span style="color:red;">${changeMsg}</span>
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
<script>
    $(function () {
        if(${empty showUser}){
            alert("发生错误，请重新进入");
            location.href="${pageContext.request.contextPath}/index.jsp";
        }
    })
</script>
</html>