<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>王者荣耀论坛</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common-new.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/search.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index-new.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/hm-bbs.js"></script>
</head>
<body>

<!-- 头部 -->
<jsp:include page="common/header.jsp"/>


<!-- 主体部分 -->
<div class="hm-header"></div>
<div class="hm-body hm-body-bgc">
    <div class="hm-inner">
        <div class="hm-banner"></div>

        <!--头部，帖子统计，搜索-->
        <div class="hm-bbs-info">
            <div class="hm-bbs-icon l" style="width:130px;">
                <span><img src="${pageContext.request.contextPath}/images/bbs-icon.png" height="80"/></span>
            </div>
            <div class="hm-bbs-info-in l" style="margin-left:30px;">
                <div class="t clearfix"><h2 class="l">王者荣耀</h2></div>
                <p>
                    <span>今日帖子<strong>${num2}</strong></span>
                    <span>全部帖子<strong>${num1}</strong></span>
                </p>
            </div>
            <div class="search-box l">
                <form action="${pageContext.request.contextPath}/article/findArticleByWord.do" method="post">
                    <input type="text" class="txt l" name="keyWord" value="${keyWord}" placeholder="请输入关键字">
                    <input type="submit" value="搜索" class="btn l"/>
                </form>
            </div>
        </div>

        <!-- 导航 -->
        <ul class="hm-bbs-nav border-lrb clearfix">
            <%--<li class="current">
                <a href="#"><em></em>综合交流区</a>
            </li>--%>
            <c:forEach items="${zones}" var="zone">
                <li <c:if test="${showzoneId==zone.zoneId}">class="current"</c:if></li>
                <a href="/begin/getTotalArticleAndUserOnline.do?zoneId=${zone.zoneId}"><em></em>${zone.zoneName}</a>
                </li>
            </c:forEach>
        </ul>

        <!-- 主体部分 -->
        <div class="hm-bbs-main border-lrb clearfix">
            <!-- 左侧列表 -->
            <div class="list-view l">

                <ul>
                    <c:if test="${empty pageInfo.list}">
                        <div style="text-align: center;font-size: 30px;color: #7a8080;margin-top: 50px;">
                            该板块目前还没有帖子，赶紧来一发！
                        </div>
                    </c:if>
                    <c:forEach items="${pageInfo.list}" var="article">

                        <li class="clearfix <c:if test='${article.isTop ==1}'> ding</c:if>">

                            <div class="hm-index-title">
                                <i class="set-to-top">顶</i> <a
                                    href="/article/getArticle.do?articleId=${article.articleId}">${article.title}</a>
                            </div>

                            <div class="hm-index-con">${article.content}</div>
                            <div class="hm-index-info l">
                                <span class="article-username">${article.senderName}</span><span
                                    class="post-time">${article.sendTime}</span>
                            </div>
                            <div class="hm-index-fun r">
                                <span class="icon-like"><i></i>${article.upvoteCount}</span>
                                <span class="icon-talk"><i></i>${article.replyCount}</span>
                            </div>
                        </li>

                    </c:forEach>
                </ul>
            </div>


            <!-- 右侧侧边栏,在线用户 -->
            <div class="aside l">
                <div class="aside-box">
                    <h3 class="t">
                        <a href="javascript:;">在线用户(${num3})</a>
                    </h3>
                    <ul class="b clearfix">
                        <c:forEach items="${userOnlineList}" var="user">
                            <li>
                                <div><img src="${pageContext.request.contextPath}/images/${user.picurl}" height="55"/>
                                </div>
                                <p>${user.username}</p>
                            </li>
                        </c:forEach>
                    </ul>
                </div>


                <div class="aside-box">
                    <h3 class="t">
                        <a href="javascript:;">我的帖子</a>
                    </h3>
                    <ul id="myArticle" style="line-height: 40px;margin-left: 10px">

                    </ul>
                </div>
            </div>




        </div>

        <c:if test="${not empty pageInfo}">
            <!--显示分页信息-->
            <div>
                <!--文字信息-->
                <div style="margin-top: 5px;margin-left: 10px;font-size: 16px">
                    共 ${pageInfo.pages} 页， ${pageInfo.total} 条记录
                </div>


                <!--点击分页-->
                <div style="margin-left: 200px;font-size: 16px;margin-top: 20px">
                    <!--首页-->
                    <span style="border: 1px solid silver;padding: 5px;border-radius: 5px"><a
                            href="${pageContext.request.contextPath}/begin/getTotalArticleAndUserOnline.do?page=1&zoneId=${showzoneId}">首页</a></span>
                    <!--上一页-->
                    <span style="margin-right:5px;border: 1px solid silver;padding: 5px 5px 5px 10px;border-radius: 5px">
                    <a href="${pageContext.request.contextPath}/begin/getTotalArticleAndUserOnline.do?page=${pageInfo.pageNum-1}&zoneId=${showzoneId}"
                       aria-label="Previous">
                        <span aria-hidden="true">«</span>
                    </a>
                </span>

                    <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                    <span style="border: 1px solid silver;padding: 5px 10px 5px 10px;border-radius: 5px"><a
                            href="${pageContext.request.contextPath}/begin/getTotalArticleAndUserOnline.do?page=${pageNum}&zoneId=${showzoneId}">${pageNum}</a></span>
                    </c:forEach>

                    <!--下一页-->
                    <span style="margin-right:5px;border: 1px solid silver;padding: 5px 5px 5px 10px;border-radius: 5px">
                    <a href="${pageContext.request.contextPath}/begin/getTotalArticleAndUserOnline.do?page=${pageInfo.pageNum+1}&zoneId=${showzoneId}"
                       aria-label="Next">
                        <span aria-hidden="true">»</span>
                    </a>
                </span>
                    <span style="border: 1px solid silver;padding: 5px;border-radius: 5px;"><a
                            href="${pageContext.request.contextPath}/begin/getTotalArticleAndUserOnline.do?page=${pageInfo.pages}&zoneId=${showzoneId}">尾页</a></span>
                </div>
            </div>
        </c:if>
    </div><!-- /.dept_info -->
</div>
</div>

</div><!-- /.panel panel-success -->
<!-- 底部 -->
<jsp:include page="common/footer.jsp"/>


<!-- 右边发帖，回顶部 -->
<div class="fixedBar" id="j_fixedBar">
    <a id="newTopicBtn" href="javascript:;" class="newTopic"><span></span>发帖</a>
    <a href="#" class="goTop"><i></i><span>返回<br/>顶部</span></a>
</div>

<!-- 发帖弹出框 -->
<form id="articleForm" action="${pageContext.request.contextPath}/article/saveArticle.do" method="post">
    <div class="pop-box ft-box">
        <div class="mask"></div>
        <div class="win">
            <div class="win_hd">
                <h4 class="l">主题帖</h4><span class="close r">&times;</span>
            </div>
            <div class="win_bd">
                <div class="win_bd_t">
                    <input type="text" id="title" name="title" placeholder="帖子标题"/>
                </div>
                <div class="win_bd_b">
                    <textarea id="content" name="content" placeholder="正文"></textarea>
                </div>
            </div>
            <div class="win_ft">
                <div class="win_ft_in">
                    <input type="button" class="btn" onclick="saveArticle()" value="发表"/>
                    <input type="hidden" id="senderName" name="senderName" value="${existUser.username}">
                    <input type="hidden" id="zoneId" name="zoneId" value="${showzoneId}">
                </div>
            </div>
        </div>
    </div>
</form>
</body>
<script>
    $(function () {
        if(${not empty existUser}){
            $.ajax({
                url:"${pageContext.request.contextPath}/article/findMyArticle.do",
                data:{"userName":'${existUser.username}'},
                dataType:"json",
                type:"post",
                success:function (data) {
                    for (var i=0;i<=data.length-1;i++){
                        $('#myArticle').append("" +
                            "<li style='border-bottom:1px solid silver'>" +
                            "<a href='${pageContext.request.contextPath}/article/getArticle.do?articleId="+data[i].articleId+"'>" +
                            ""+data[i].title+"</a></li>")
                    }
                },
                error:function () {
                    alert("获取失败！")
                }
            })
        }
    })
    function saveArticle() {
        var existUser = "${existUser}";
        if (!existUser) {
            alert("请登录");
        }else if(${showzoneId==0}) {
            alert("请先选择你所有发帖的板块！")
        }else if ($("#content").val().length > 0 && $("#title").val().length > 0) {
            $("#articleForm").submit();
        } else {
            alert("请填写标题与内容！");
        }
    }
</script>
</html>