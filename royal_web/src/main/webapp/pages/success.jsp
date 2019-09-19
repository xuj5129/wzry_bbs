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
            <a href="${pageContext.request.contextPath}/index.jsp">首页</a><span>></span>注册页面
        </div>
    </div>
</div>


<div class="hm-body hm-body-bgc">
        <div class="hm-inner"> 
            <div class="reg-box" style="text-align:center;height:200px;padding-top:100px;">
                <%--<h2>恭喜您，注册成功！在  之后自动跳转首页</h2>--%>
                <span style="font-size: large" >恭喜您，注册成功！</span>
                    <span id="numId" style="font-size: large"  >5</span><span style="font-size: large">秒后，跳转到 </span><a href="../index.jsp" style="font-size: large">首页</a>
            </div>
        </div>
    </div>




<!-- 底部 -->
<jsp:include page="common/footer.jsp"/>

<script>
    var num = 5;
    setInterval(changeNum,1000);
    function changeNum() {
        num --;
        if(num <=0 ){
            location.href = "${pageContext.request.contextPath}/index.jsp"
        }
        $("#numId").html(num);

    }
</script>

</body>
</html>