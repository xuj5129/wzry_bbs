<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>黑马程序员论坛详情页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common-new.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/search.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/detail.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/getArticle.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/hm-bbs.js"></script>
</head>
<body>


<!-- 头部 -->
<jsp:include page="common/header.jsp"/>


<div class="hm-header"></div>
<div class="hm-body hm-body-bgc">
    <div class="hm-inner">

        <!--帖子标题，点赞数，回复数，搜索-->
        <div class="hm-bbs-info">
            <div class="hm-bbs-icon l" style="width:130px;">
                <span><img src="${pageContext.request.contextPath}/images/bbs-icon.png" height="80"/></span>
            </div>
            <div class="hm-bbs-info-in l" style="margin-left:30px;">
                <div class="t clearfix">
                    <h2 class="l">${article.title}</h2>
                    <div class="hm-detail-fun l">
					     <span class="icon-like">
					         <a id="upvoteCount" href="javascript:(0)"><i></i>${article.upvoteCount}</a>
					     </span>
                        <span id="replyCount" class="icon-talk">
						     <i></i>${article.replyCount}
						</span>
                    </div>
                </div>
            </div>
            <div class="search-box l">
                <form action="${pageContext.request.contextPath}/article/findArticleByWord.do" method="post">
                    <input type="text" class="txt l" name="keyWord" value="${keyWord}" placeholder="请输入关键字">
                    <input type="submit" value="搜索" class="btn l"/>
                </form>
            </div>
        </div>


        <!--导航，回首页，帖子标题，排序-->
        <div class="detail-page-box clearfix">
            <a href="${pageContext.request.contextPath}/index.jsp">
                <i class="hm-ico-home"></i>首页
            </a>
            <span>></span>

            <thiszone id="thiszone">

            </thiszone>

            <a href="#">${article.title}</a>
            <a id="orderButton" class="new-to-old r" href="javascript:orderByTime()" style="font-size:12px;float: right;">
                <i></i>从新到旧查看
            </a>
        </div>


        <div class="detail-box">
            <ul class="detail-floors">

                <!--原帖楼-->
                <li class="floor clearfix">
                    <div class="floorer-info l">
                        <div class="floorer-photo">
                            <a href="javaScript:showUserInfoDialog('${article.userInfo.picurl}','${article.userInfo.username}','${article.userInfo.roleStr}','${article.userInfo.email}','${article.userInfo.lastlogintime}')">
                                <img src="${pageContext.request.contextPath}/images/${article.userInfo.picurl}"/>
                            </a>
                        </div>
                        <a href="javaScript:showUserInfoDialog('${article.userInfo.picurl}','${article.userInfo.username}','${article.userInfo.roleStr}','${article.userInfo.email}','${article.userInfo.lastlogintime}')">
                            <div class="floorer-name" style="
                            <c:if test='${article.userInfo.role==3}'>color: red;</c:if>
                            <c:if test='${article.userInfo.role==2}'>color: #66afe9;</c:if>">
                                ${article.userInfo.username}
                            </div>
                        </a>
                    </div>
                    <div class="floor-con l">
                        <div class="floor-info clearfix">
                            <div class="floor-time l">发帖时间：${article.sendTime}</div>
                            <div class="r">${article.browseCount}次查看</div>
                        </div>
                        <div class="floor-art-ans">
                            <div class="floor-art">
                                <p>${article.content}</p>
                            </div>
                            <div class="floor-ans"></div>
                        </div>
                        <span id="thisUpvote" class="icon-feedback" style="right: 150px"><a id="upvoteTxt"
                                href="javascript:changeUpvote()"> <i></i> 点赞</a></span>
                        <span class="icon-comment" style="right: 80px"><a href="#comment"> <i></i> 评论</a></span>
                        <span class="icon-report"><a href="javascript:showReportDialog()"> <i></i> 举报</a></span>
                    </div>
                </li>


                <c:forEach items="${article.comments}" var="comment" varStatus="i">
                    <li class="floor clearfix">
                        <div class="floorer-info l">
                            <div class="floorer-photo">
                                <a href="javaScript:showUserInfoDialog('${comment.userInfo.picurl}','${comment.userInfo.username}','${comment.userInfo.roleStr}','${comment.userInfo.email}','${comment.userInfo.lastlogintime}')">
                                    <img src="${pageContext.request.contextPath}/images/${comment.userInfo.picurl}"/>
                                </a>
                            </div>
                            <a href="javaScript:showUserInfoDialog('${comment.userInfo.username}','${comment.userInfo.roleStr}','${comment.userInfo.email}','${comment.userInfo.lastlogintime}')">
                                <div class="floorer-name" style="
                                <c:if test='${comment.userInfo.role==3}'>color: red;</c:if>
                                    <c:if test='${comment.userInfo.role==2}'>color: #66afe9;</c:if>">${comment.commentUserName}</div>
                            </a>
                        </div>
                        <div class="floor-con l">
                            <div class="floor-info clearfix">
                                <div class="floor-time l">回贴时间：${comment.commentTime}</div>
                                <div class="r">${i.index+1}楼</div>
                            </div>
                            <div class="floor-art-ans">
                                <div class="floor-art">
                                    <p>${comment.commentContent}</p>
                                </div>
                                <div class="floor-ans">
                                    <ul>

                                        <!-- 回复部分,楼中楼 -->
                                        <c:forEach items="${comment.replys}" var="reply">
                                            <li class="clearfix">
                                                <div class="floor-ans-pho l">
                                                    <a href="javaScript:showUserInfoDialog('${reply.userInfo.picurl}','${reply.userInfo.username}','${reply.userInfo.roleStr}','${reply.userInfo.email}','${reply.userInfo.lastlogintime}')">
                                                        <img src="${pageContext.request.contextPath}/images/${reply.userInfo.picurl}"/>
                                                    </a>
                                                </div>
                                                <div class="floor-ans-con l">
                                                    <a href="javaScript:showUserInfoDialog('${reply.userInfo.picurl}','${reply.userInfo.username}','${reply.userInfo.roleStr}','${reply.userInfo.email}','${reply.userInfo.lastlogintime}')">
                                                        <span class="name" style="
                                                        <c:if test='${reply.userInfo.role==3}'>color: red;</c:if>
                                                            <c:if test='${reply.userInfo.role==2}'>color: #66afe9;</c:if>">${reply.userInfo.username}</span>
                                                        <c:if test="${reply.userInfo.username==article.userInfo.username}"><span
                                                                style="font-size: 5px;border-radius: 5px;background-color: #fa8932;color: white;padding: 0px 5px 0px 5px">楼主</span></c:if>
                                                    </a>
                                                    ：${reply.replyContent}
                                                    <span class="ans-time">${reply.replyTime}</span>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                                <c:if test="${comment.userInfo.userid==existUser.userid}">
                                    <span class="icon-delete" style="margin-right: 60px;">
                                        <a href="javascript:gochangeCommentStatus('${comment.commentId}','删除')"> <i></i> 删除</a>
                                    </span>
                                </c:if>
                                <c:if test="${article.userInfo.userid==existUser.userid&&comment.userInfo.userid!=existUser.userid}">
                                    <span class="icon-PingBiIcon" style="margin-right: 60px;">
                                        <a href="javascript:gochangeCommentStatus('${comment.commentId}','屏蔽')"> <i></i> 屏蔽</a>
                                    </span>
                                </c:if>
                                <span class="icon-comment">
                                    <a href="javascript:;"
                                       onclick="showReplyDialog(${i.index+1},${comment.commentId})"> <i></i> 回复</a>
                                </span>
                            </div>
                        </div>
                    </li>
                </c:forEach>

            </ul>
        </div>

        <!--发表评论-->
        <div id="talkBox" class="detail-to-comment">
            <div class="tit"><a name="comment">发表评论</a></div>
            <!-- 未登录时候显示 <div class="con">您没有登录论坛，请登录后再进行回复</div>-->
            <c:if test="${empty existUser}">
                <div class="con">您没有登录论坛，请登录后再进行回复</div>
            </c:if>

            <c:if test="${not empty existUser}">
                <!-- 登录后显示评论输入框-->
                <form id="commentForm" action="/article/saveComment.do" method="post">
                    <input hidden name="articleId" value="${article.articleId}">
                    <input hidden name="commentUserName" value="${existUser.username}">
                    <div class="con con-loged">
                        <div class="con-t">
                            <textarea id="content" name="commentContent" placeholder="请在此输入您要回复的信息"></textarea>
                        </div>
                        <div class="con-b">
                            <input type="button" onclick="commentCode()" value="提交" class="btn"/>
                            <span class="num">不能超过5000字</span>
                        </div>
                    </div>
                </form>
            </c:if>
        </div>
    </div>
</div>


<!-- 底部 -->
<jsp:include page="common/footer.jsp"/>


<!-- 回复弹出框 -->
<form id="replyForm" action="" method="post">
    <div id="replyBox" class="pop-box ft-box">
        <div class="mask"></div>
        <div class="win">
            <div class="win_hd">
                <h4 class="l">回复<span id="floorSpan"></span>楼</h4>
                <span class="close r">&times;</span>
            </div>
            <div class="win_bd">
                <div id="replyContentBox" class="win_bd_b">
                    <textarea id="replyContent" name="replyContent" placeholder="回复内容限于40字以内"></textarea>
                </div>
            </div>
            <div class="win_ft">
                <div class="win_ft_in">
                    <input id="replyButton" type="button" class="btn" onclick="saveReply()" value="回复"/>
                    <input type="hidden" id="commentId" name="commentId"/>
                    <input type="hidden" id="replyUserName" name="replyUserName">
                </div>
            </div>
        </div>
    </div>
</form>

<!-- 举报弹出框 -->
<form id="reportForm" action="" method="post">
    <div id="reportBox" class="pop-box ft-box">
        <div class="mask"></div>
        <div class="win">
            <div class="win_hd">
                <h4 class="l">举报本帖</h4>
                <span class="close r">&times;</span>
            </div>
            <div class="win_bd">
                <div class="win_bd_b">
                    <textarea id="reportContent" name="reportContent" placeholder="举报内容限于400字以内"></textarea>
                </div>
            </div>
            <div class="win_ft">
                <div class="win_ft_in">
                    <input type="button" class="btn" onclick="saveReport()" value="举报"/>
                    <input type="hidden" id="articleId" name="articleId"/>
                    <input type="hidden" id="reportUserName" name="reportUserName">
                </div>
            </div>
        </div>
    </div>
</form>

<!-- 用户信息弹出框 -->
<form id="showUserInfo" action="" method="post">
    <div id="userInfoBox" class="pop-box ft-box">
        <div class="mask"></div>
        <div class="" style="width: 300px;position: fixed;top: 20%;left: 40%;">
            <div class="win_hd">
                <h4 class="l">用户信息</h4>
            </div>
            <div class="win_bd">
                <div class="win_bd_b" style="background-color:white;height:250px;width: 100%">
                    <div id="userInfoBoxPicUrl" class="floorer-photo" style="padding-top: 10px;border: 0px">
                    </div>
                    <table style="text-align: center;width: 100%;">
                        <tr>
                            <td style="width: 50%;text-align: right">用户名：</td>
                            <td style="width: 50%;text-align: left" id="userInfoBoxUserName">dd</td>
                        </tr>
                        <tr>
                            <td style="width: 50%;text-align: right">用户等级：</td>
                            <td style="width: 50%;text-align: left" id="userInfoBoxRoleStr">dd</td>
                        </tr>
                        <tr>
                            <td style="width: 50%;text-align: right">邮箱：</td>
                            <td style="width: 50%;text-align: left" id="userInfoBoxEmail">dd</td>
                        </tr>
                        <tr>
                            <td style="width: 50%;text-align: right">发帖数：</td>
                            <td style="width: 50%;text-align: left" id="userInfoBoxArticleCount">dd</td>
                        </tr>
                        <tr>
                            <td style="width: 50%;text-align: right">最近登录时间：</td>
                            <td style="width: 50%;text-align: left" id="userInfoBoxlastTime">dd</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="win_ft">
                <div class="win_ft_in">
                    <input type="button" class="btn" onclick="closeUserInfoDialong()" value="关闭"/>
                    <input type="hidden" name="articleId"/>
                    <input type="hidden" name="reportUserName">
                </div>
            </div>
        </div>
    </div>
</form>

<div class="fixedBar" id="j_fixedBar">
    <a href="#comment" class="newTopic"><span></span>评论</a>
    <a href="#" class="goTop"><i></i><span>返回<br/>顶部</span></a>
</div>


</body>

<script type="text/javascript">


    $(function () {
        if(${timeStatus=="old"}){
            $('#orderButton').html("<i></i>从新到旧查看");
            $('#orderButton').attr("class","new-to-old r");
        }else if(${timeStatus=="new"}){
            $('#orderButton').html("<i></i>从旧到新查看");
            $('#orderButton').attr("class","new-to-up r");
        }
        $.ajax({
            url: "${pageContext.request.contextPath}/zone/findThisZoneByZoneId.do",
            data: {"zoneId": "${article.zoneId}"},
            dataType: "json",
            type: "post",
            success: function (data) {
                $('#thiszone').html("<a href='/begin/getTotalArticleAndUserOnline.do?zoneId=" + data.zoneId + "'>" + data.zoneName + "</a><span>></span>");
            }
        });
        $.ajax({
            url: "/upvote/findIsUpvote.do",
            data: {
                "userName": <c:if test="${empty existUser}">'游客'</c:if>
                <c:if test="${not empty existUser}">'${existUser.username}'</c:if>,
                "articleId":${article.articleId}
            },
            dataType: "json",
            type: "post",
            success: function (isUpvote) {
                if (isUpvote == 1) {
                    $('#thisUpvote').attr("class", "icon-feedback1");
                    $('#upvoteTxt').html("<i></i> 取消点赞");
                }
            }
        })

        if (${not empty existUser}) {
            $.ajax({
                url: "/user/findTalkStatusByUserName.do",
                data: {
                    "userName": <c:if test="${empty existUser}">'游客'</c:if>
                    <c:if test="${not empty existUser}">'${existUser.username}'</c:if>,
                    "articleId":${article.articleId}
                },
                dataType: "json",
                type: "post",
                success: function (talkStatus) {
                    if (talkStatus == 1) {
                        $('#commentForm').css("display", "none");
                        $('#talkBox').append("<div class='con'>您已被禁言，无法评论</div>")
                        $('#replyContent').css("display", "none");
                        $('#replyContentBox').append("<dic style='height: 300px;line-height: 300px;padding-left: 300px;font-size: 20px'>您已被禁言，无法回复消息</div>")
                        $('#replyButton').css("display", "none");
                    }
                }
            })
        }
    })

    //弹出回复框
    function showReplyDialog(num, commentId) {
        var existUser = "${existUser}";
        if (!existUser) {
            alert("请登录");
            return;
        }
        $("#replyUserName").val("${existUser.username}");
        $("#commentId").val(commentId);
        $('#replyBox').css('display', 'block');
        $("#floorSpan").html(num);
    }

    //弹出用户信息框
    function showUserInfoDialog(picUrl, username, roleStr, email, lastTime) {
        $("#commentId").val(commentId);
        $('#userInfoBox').css('display', 'block');
        $("#userInfoBoxPicUrl").html("<img src='${pageContext.request.contextPath}/images/" + picUrl + "'/>");
        $("#userInfoBoxUserName").html(username);
        $("#userInfoBoxRoleStr").html(roleStr);
        $("#userInfoBoxEmail").html(email);
        $("#userInfoBoxlastTime").html(lastTime);
        $.ajax({
            url: "${pageContext.request.contextPath}/article/findArticleNumWithUsername.do",
            data: {"name": username},
            type: "post",
            dataType: "json",
            success: function (data) {
                $("#userInfoBoxArticleCount").html(data);
            }
        })
    }

    //关闭用户框
    function closeUserInfoDialong() {
        $('#userInfoBox').css('display', 'none');
    }

    //回复验证
    function saveReply() {
        if ($("#replyContent").val().length > 0) {
            $.ajax({
                url: "/article/saveReply.do",
                data: $("#replyForm").serialize(),
                type: "post",
                success: function () {
                    location.reload();
                },
                error: function () {
                    alter("发表失败")
                }
            })
        } else {
            alert("请填写内容");
        }
    }

    //弹出举报框
    function showReportDialog() {
        var existUser = "${existUser}";
        if (!existUser) {
            alert("请登录");
            return;
        }
        if ("${article.senderName}" == "${existUser.username}") {
            alert("不能举报自己帖子");
            return;
        }
        $("#reportUserName").val("${existUser.username}");
        $("#articleId").val(${article.articleId});
        $('#reportBox').css('display', 'block');
    }

    //举报验证
    function saveReport() {
        if ($("#reportContent").val().length > 0) {
            $.ajax({
                url: "/article/saveReport.do",
                data: $("#reportForm").serialize(),
                type: "post",
                dataType: "text",
                success: function () {
                    alert("举报申请已提交");
                    location.reload();
                },
                error: function () {
                    alter("举报失败")
                }
            })
        } else {
            alert("请填写内容");
        }
    }

    //评论验证
    function commentCode() {
        if ($('#content').val().trim() == "") {
            alert("请先输入内容，再提交");
        } else {
            $.ajax({
                url: "/article/saveComment.do",
                data: $('#commentForm').serialize(),
                type: "post",
                success: function () {
                    location.reload();
                },
                error: function () {
                    alter("评论失败")
                }
            })
        }
    }

    //改变点赞状态
    function changeUpvote() {

        if (${empty existUser}) {
            alert("请先登录！");
        } else if ($('#thisUpvote').hasClass("icon-feedback")) {
            $.ajax({
                url: "/upvote/changeIsUpvote.do",
                data: {
                    "upvoteUserName":
                        <c:if test="${empty existUser}">'游客'</c:if>
                    <c:if test="${not empty existUser}">'${existUser.username}'</c:if>,
                    "upvoteArticleId":${article.articleId},
                    "isUpvote": "0"
                },
                dataType: "json",
                type: "POST",
                success: function () {
                    $('#thisUpvote').attr("class", "icon-feedback1");
                    $('#upvoteTxt').html("<i></i> 取消点赞");
                    location.reload();
                },
                error: function () {
                    alert("点赞失败！")
                }
            })

        } else if ($('#thisUpvote').hasClass('icon-feedback1')) {
            $.ajax({
                url: "/upvote/changeIsUpvote.do",
                data: {
                    "upvoteUserName":
                        <c:if test="${empty existUser}">'游客'</c:if>
                    <c:if test="${not empty existUser}">'${existUser.username}'</c:if>,
                    "upvoteArticleId":${article.articleId},
                    "isUpvote": 1
                },
                dataType: "json",
                type: "POST",
                success: function () {
                    $('#thisUpvote').attr("class", "icon-feedback");
                    $('#upvoteTxt').html(' <i></i> 点赞');
                    location.reload();
                },
                error: function () {
                    alert("取消点赞失败！")
                }
            })
        }

    };

    function gochangeCommentStatus(commentId, status) {
        if (confirm("您确定" + status + "该评论吗？")) {
            $.ajax({
                url: "/article/changeCommentStatus.do",
                data: {"commentId": commentId},
                dataType: "json",
                type: "post",
                success: function () {
                    alert(status + "成功！！");
                    location.reload();
                },
                error: function () {
                    alert(status + "成功！！");
                    location.reload();
                }
            })
        }
    };

    function orderByTime() {
        if($('#orderButton').hasClass("new-to-up")){
            location.href="${pageContext.request.contextPath}/article/getArticleByOldTime.do?articleId=${article.articleId}";
        }else if($('#orderButton').hasClass("new-to-old")){
            location.href="${pageContext.request.contextPath}/article/getArticleByNewTime.do?articleId=${article.articleId}";
        }
    }
</script>
</html>