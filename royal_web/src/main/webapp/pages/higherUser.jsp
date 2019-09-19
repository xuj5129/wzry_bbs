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
            <a href="${pageContext.request.contextPath}/index.jsp">首页</a><span>></span>申请高级用户
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
                    <img src="${pageContext.request.contextPath}/images/${existUser.picurl}"/>
                    <div class="username">${existUser.username}</div>
                </div>
                <ul class="user-info-l-b">
                    <li ><i class="info-icon"></i>我的资料</li>
                    <li><i class="safe-icon"></i>修改密码</li>
                    <li class="cur"><i class="safe-icon"></i>申请高级用户</li>
                </ul>
            </div>


            <!--右侧用户信息-->
            <div class="user-info-r r">
                <ul class="clearfix hd">
                    <li><a href="${pageContext.request.contextPath}/user/showUserCenter.do?pageCode=1&username=${existUser.username}">个人信息</a></li>
                    <li><a href="${pageContext.request.contextPath}/user/showUserCenter.do?pageCode=2&username=${existUser.username}">修改密码</a></li>
                    <li class="cur">申请高级用户</li>
                </ul>




                <form id="requestHigherUser" action="${pageContext.request.contextPath}/user/requestHigherUser.do" method="post" >
                    <input type="hidden" name="username" value="${showUser.username}">
                    <ul class="bd" style="margin-left:80px">
                        <li class="clearfix" >
                            <div><i class="red" style="font-size: 15px">高级特权：</i>开辟新板块</div>
                        </li>
                        <li class="clearfix">
                            <div > <i class="red" style="font-size: 15px">申请条件：</i>发帖数≥5</div>
                        </li>
                        <li class="clearfix" style="margin-left: -15px">
                            <div ><i class="red" style="font-size: 15px">当前发贴数：</i><span id="num"></span> </div>
                        </li>
                        <li class="clearfix" style="margin-left: -80px">
                            <div class="info-l"></div>
                            <div class="info-r">
                                <c:if test="${showUser.isupdating==1}">
                                    <div style="color: green;">申请已提交，审核中..</div>
                                </c:if>
                                <c:if test="${showUser.isupdating==0}">
                                    <input type="button" class="btn" onclick="javascript:checkNumOfArticle()" id="request" value="申请"/>
                                    <span style="color:red;">${responseMsg}</span>
                                </c:if>
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

<script type="text/javascript">
    <%--页面加载完成显示当前用户发帖数--%>
    $(function () {
        if(${empty existUser}){
            alert("请先登录！")
            location.href="${pageContext.request.contextPath}/index.jsp"
        }else if (${empty showUser}) {
            location.href="${pageContext.request.contextPath}/user/showUserCenter.do?pageCode=4&username=${existUser.username}";
        }else if(${showUser.role>1}){
            alert("权限已更新，重新跳转!");
            location.href="${pageContext.request.contextPath}/user/showUserCenter.do?pageCode=4&username=${existUser.username}";
        }
        $.ajax({
            url:"${pageContext.request.contextPath}/article/findArticleNumWithUsername.do",
            data:{"name":'${existUser.username}'},
            type:"post",
            success:function(data){
                $('#num').html(data)
            },
            dataType:"json"
        });
    });

    <%--发送申请前判断帖子数是否达到要求--%>
    function checkNumOfArticle() {
        var val = $("#num").html();
        if(val<5){
            alert("您的帖子数未达到要求！");
            return;
        }else {
            $("#requestHigherUser").submit();
        }

    }
</script>


</body>
</html>