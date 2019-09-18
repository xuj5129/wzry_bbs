<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Head Page</title>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="/bootstrap/bootstrap.min.css">
    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="/bootstrap/bootstrap-theme.min.css">
    <script src="/bootstrap/jquery-1.11.0.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="/bootstrap/bootstrap.min.js"></script>
</head>
<body>
<div class="hrms_brand_nav">
    <nav class="navbar navbar-inverse navbar-static-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#hrms-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" id="company_logo" href="javascript:void(0);" >厦门黑马程序员</a>
            </div>

            <div class="collapse navbar-collapse" id="hrms-navbar-collapse-1">
             <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">账号管理 <span class="caret"></span></a>
                        <ul class="dropdown-menu nav nav-pills nav-stacked">
                            <li><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>欢迎您,超級管理員:<sec:authentication property="name"/></a></li>
                            <li><a href="${pageContext.request.contextPath}/logout.do" class="hrms_logout"><span class="glyphicon glyphicon-off" aria-hidden="true"></span> 账号退出</a></li>
                        </ul>
                    </li>
                </ul><!-- /.nav navbar-nav navbar-right -->
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div><!-- /.hrms_brand_nav -->
<script type="text/javascript">
    //主页面
    $("#company_logo").click(function () {
        $(this).attr("href", "http://xm.itcast.cn");
    });

</script>
</body>
</html>
