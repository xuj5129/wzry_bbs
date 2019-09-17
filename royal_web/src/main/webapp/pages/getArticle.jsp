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
					         <a href="javascript:(0)"><i></i>${article.upvoteCount}</a>
					     </span>
                        <span class="icon-talk">
						     <i></i>${article.replyCount}
						</span>
                    </div>
                </div>
            </div>
            <div class="search-box l">
                <form action="javascript:;">
                    <input type="text" class="txt l" placeholder="请输入关键字">
                    <input type="button" value="搜索" class="btn l"/>
                </form>
            </div>
        </div>


        <!--导航，回首页，帖子标题，排序-->
        <div class="detail-page-box clearfix">
            <a href="${pageContext.request.contextPath}/begin/getTotalArticleAndUserOnline.do">
                <i class="hm-ico-home"></i>首页
            </a>
            <span>></span>
            <a href="#">${article.title}</a>
            <a class="new-to-old r" href="" style="font-size:12px;float: right;">
                <i></i>从新到旧查看
            </a>
        </div>


        <div class="detail-box">
            <ul class="detail-floors">

                <!--原帖楼-->
                <li class="floor clearfix">
                    <div class="floorer-info l">
                        <div class="floorer-photo"><img src="${pageContext.request.contextPath}/images/${article.userInfo.picurl}"/></div>
                        <div class="floorer-name">${article.userInfo.username}</div>
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
                        <span id="thisUpvote" class="icon-feedback" style="right: 150px"><a href="javascript:changeUpvote()"> <i></i> 点赞</a></span>
                        <span class="icon-comment" style="right: 80px"><a href="#comment"> <i></i> 评论</a></span>
                        <span class="icon-report" ><a href="javascript:(0)"> <i></i> 举报</a></span>
                    </div>
                </li>


                <c:forEach items="${article.comments}" var="comment" varStatus="i">
                    <li class="floor clearfix">
                        <div class="floorer-info l">
                            <div class="floorer-photo"><img src="${pageContext.request.contextPath}/images/${comment.userInfo.picurl}"/></div>
                            <div class="floorer-name">${comment.commentUserName}</div>
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
                                            <div class="floor-ans-pho l"><img src="${pageContext.request.contextPath}/images/${reply.userInfo.picurl}"/></div>
                                            <div class="floor-ans-con l">
                                                <span class="name">${reply.userInfo.username}</span>：${reply.replyContent}
                                                <span class="ans-time">${reply.replyTime}</span>
                                            </div>
                                        </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                                <span class="icon-comment">
                                <a href="javascript:;" onclick="showReplyDialog(${i.index+1},${comment.commentId})"> <i></i> 回复</a>
                            </span>
                            </div>
                        </div>
                    </li>
                </c:forEach>

            </ul>
        </div>

        <!--发表评论-->
        <div class="detail-to-comment">
            <div class="tit"><a name="comment">发表评论</a></div>
            <!-- 未登录时候显示 <div class="con">您没有登录论坛，请登录后再进行回复</div>-->
            <c:if test="${empty existUser}"><div class="con">您没有登录论坛，请登录后再进行回复</div></c:if>

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
    <div class="pop-box ft-box">
        <div class="mask"></div>
        <div class="win">
            <div class="win_hd">
                <h4 class="l">回复<span id="floorSpan"></span>楼</h4>
                <span class="close r">&times;</span>
            </div>
            <div class="win_bd">
                <div class="win_bd_b">
                    <textarea id="replyContent" name="replyContent" placeholder="回复内容限于40字以内"></textarea>
                </div>
            </div>
            <div class="win_ft">
                <div class="win_ft_in">
                    <input type="button" class="btn" onclick="saveReply()" value="回复"/>
                    <input type="hidden" id="commentId" name="commentId"/>
                    <input type="hidden" id="replyUserName" name="replyUserName">
                </div>
            </div>
        </div>
    </div>
</form>


<div class="fixedBar" id="j_fixedBar">
    <a href="#comment" class="newTopic"><span></span>回复</a>
    <a href="#" class="goTop"><i></i><span>返回<br/>顶部</span></a>
</div>


</body>

<script type="text/javascript">
    $(function () {
        $.ajax({
            url:"/upvote/findIsUpvote.do",
            data:{"userName":<c:if test="${empty existUser}">'游客'</c:if>
                <c:if test="${not empty existUser}">'${existUser.username}'</c:if>,
                "articleId":${article.articleId}
            },
            dataType:"json",
            type:"post",
            success:function (isUpvote) {
                if(isUpvote==1){
                    $('#thisUpvote').attr("class","icon-feedback1");
                }
            }
        })
    })

    //弹出回复框
    function showReplyDialog(num, commentId) {
        var existUser = "${existUser}";
        if (!existUser) {
            alert("请登录");
            return;
        }
        $("#replyUserName").val("admin");
        $("#commentId").val(commentId);
        $('.pop-box').css('display', 'block');
        $("#floorSpan").html(num);
    }

    //回复验证
    function saveReply() {
        if ($("#replyContent").val().length>0){
            $.ajax({
                url:"/article/saveReply.do",
                data:$("#replyForm").serialize(),
                type:"post",
                dataType:"text",
                success:function(){
                    alert("发表成功")
                    location.href="/article/getArticle.do?articleId="+${article.articleId};
                },
                error:function () {
                    alter("发表失败")
                }
            })
        }else{
            alert("请填写内容");
        }
    }

    //弹出举报框
    function showReport() {
        
    }

    //评论验证
    function commentCode() {
        if($('#content').val().trim()=="") {
            alert("请先输入内容，再提交");
        }else{
            $('#commentForm').submit();
        }
    }

    //改变点赞状态
    function changeUpvote() {
        
        if(${empty existUser}){
            alert("请先登录！");
        }else if($('#thisUpvote').hasClass("icon-feedback")){
            $.ajax({
                url:"/upvote/changeIsUpvote.do",
                data:{
                    "upvoteUserName":
                        <c:if test="${empty existUser}">'游客'</c:if>
                    <c:if test="${not empty existUser}">'${existUser.username}'</c:if>,
                    "upvoteArticleId":${article.articleId},
                    "isUpvote":"0"
                },
                dataType:"json",
                type:"POST",
                success: function () {
                    $('#thisUpvote').attr("class","icon-feedback1");
                },
                error:function () {
                    alert("点赞失败！")
                }
            })

        }else if($('#thisUpvote').hasClass('icon-feedback1')){
            $.ajax({
                url:"/upvote/changeIsUpvote.do",
                data:{
                    "upvoteUserName":
                        <c:if test="${empty existUser}">'游客'</c:if>
                        <c:if test="${not empty existUser}">'${existUser.username}'</c:if>,
                    "upvoteArticleId":${article.articleId},
                    "isUpvote":1},
                dataType:"json",
                type:"POST",
                success: function () {
                    $('#thisUpvote').attr("class","icon-feedback");
                },
                error:function () {
                    alert("取消点赞失败！")
                }
            })
        }
    }
</script>
</html>