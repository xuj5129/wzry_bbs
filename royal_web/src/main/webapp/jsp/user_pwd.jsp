<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>黑马程序员论坛首页</title>
    <link rel="stylesheet" href="../css/common.css"/>
    <link rel="stylesheet" href="../css/common-new.css"/>
    <link rel="stylesheet" href="../css/user_info.css"/>
    <link rel="stylesheet" href="../css/search.css"/>
    <script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="../js/hm-bbs.js"></script>
    <style type="text/css">
        .hm-header-b { border-bottom: 1px solid #d9d9d9; }
    </style>
</head>
<body>

<!-- 头部 -->
<div class="hm-top-nav">
    <div class="hm-inner clearfix">
        <div class="hm-inner-l l">
        </div>
        <div class="hm-inner-r r">
            <div class="box">
                欢迎<a href="user_info.html" style="margin-right:0px;padding:0px 5px;color:blue;">scott</a>回来！
                <a href="#">【注销】</a>
                <div id="dialogBg"></div>
                <div id="dialog" class="animated">
                    <img class="dialogIco" width="50" height="40" src="../images/ico.png"/>
                    <div class="dialogTop" style="height:25px;">
                        <a href="javascript:;" class="closeDialogBtn">关闭</a>
                    </div>
                    <form action="" method="post">
                        <ul class="editInfos">
                            <li>用户名：<input type="text" id="userName" name="userName"
                                           class="ipt"/></li>
                            <li>密&nbsp;&nbsp;&nbsp;码：<input type="password"
                                                            id="userPass" name="userPass" class="ipt"/></li>
                            <li><input type="submit" value="登录" class="submitBtn"/></li>
                        </ul>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>



<!--头部信息-->
<div class="hm-header">
    <div class="hm-inner clearfix">
        <div class="hm-header-t clearfix">
            <h1 class="logo l">
                <a href="javascript:;"><img src="../images/logo.png" alt=""/></a>
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
            <a href="index.html">首页</a><span>></span>修改密码
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
                    <img src="../images/default.png" alt=""/>
                    <div class="username">张无忌</div>
                </div>
                <ul class="user-info-l-b">
                    <li><i class="info-icon"></i>我的资料</li>
                    <li class="cur"><i class="safe-icon"></i>修改密码</li>
                </ul>
            </div>


            <div class="user-info-r r">
                <ul class="clearfix hd">
                    <li><a href="user_info.html">个人信息</a></li>
                    <li class="cur"><a href="user_pwd.html">修改密码</a></li>
                </ul>

                <ul class="bd">
                    <li class="clearfix">
                        <div class="info-l"><i class="red">*</i>旧密码：</div>
                        <div class="info-r"><input type="password" class="txt"/></div>
                    </li>
                    <li class="clearfix">
                        <div class="info-l"><i class="red">*</i>新密码：</div>
                        <div class="info-r"><input type="password" class="txt"/></div>
                    </li>
                    <li class="clearfix">
                        <div class="info-l"></div>
                        <div class="info-r"><input type="submit" class="btn" value="保存"/></div>
                    </li>
                </ul>

            </div>
        </div>
    </div>
</div>

<!-- 底部 -->
<div class="hm-footer" style="padding-top:10px;">
    <div class="hm-inner">
        <div class="hm-footer-cpr">
            <p>Copyright@2006-2017 ITCAST. All Rights Reserved</p>
            <p>传智播客 版权所有</p>
        </div>
    </div>
</div>
</body>
</html>