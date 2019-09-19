<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>王者荣耀论坛管理系统</title>
</head>
<body>
<div >
    <!-- 导航条 -->
    <%@ include file="./jsp/commom/head.jsp"%>

    <div class="hm-body hm-body-bgc" style="margin-bottom: 400px">
        <div class="hm-inner">
            <div class="reg-box" style="text-align:center;height:200px;padding-top:100px;">
                <%--<h2>恭喜您，注册成功！在  之后自动跳转首页</h2>--%>
                <span style="font-size: large;color: red" >权限不足</span>
                <span id="numId" style="font-size: large"  >5</span><span style="font-size: large">秒后，跳转到 </span>
                    <a href="/login.jsp" style="font-size: large">登陆页面</a>
            </div>
        </div>
    </div>

    <%@ include file="./jsp/commom/foot.jsp"%>

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