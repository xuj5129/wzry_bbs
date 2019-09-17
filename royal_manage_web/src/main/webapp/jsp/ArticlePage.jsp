<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>帖信息管理页面</title>

</head>
<style type="text/css">
    html,body{
        overflow:auto;
        height:100%;
    }

    .line-limit-length {
        max-width: 220px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }


</style>
<script>

</script>
<body>
<div class="hrms_dept_container">
    <!-- 导航栏-->
    <%@ include file="commom/head.jsp"%>


    <!-- 中间部分（左侧栏+表格内容） -->
    <div class="hrms_dept_body">
        <!-- 左侧栏 -->
        <%@ include file="commom/leftsidebar.jsp"%>

        <!-- 表格内容 -->
        <div class="dept_info col-sm-10">
            <div class="panel panel-success">
                <!-- 路径导航 -->
                <div >
                    <ol class="breadcrumb">
                        <li><a href="#">用户帖管理</a></li>
                        <li class="active">帖子信息</li>
                    </ol>
                </div>
                <hr>
                <!-- Table -->
                <div>
                    <div style="float: left">
                        <form method="get" id="articleSearchForm">
                            <table>
                                <tr>
                                    <th>
                                        <label for="title" class="control-label">标题:</label>
                                    </th>
                                    <th>
                                        <input type="text" id="title" class="form-control"
                                               name="title" value="">
                                        <input type="hidden" id="pageNum" name="pn" value="">
                                    </th>
                                    <th>
                                        <label for="article_sendername" class="control-label">创帖人:</label>
                                    </th>
                                    <th>
                                        <input type="text" id="article_sendername" class="form-control"
                                               name="sendername" value="">
                                    </th>
                                    <th colspan="2">
                                        <input type="button" value="查询" class="form-control btn-primary">
                                    </th>
                                </tr>
                            </table>

                        </form>
                    </div>
                </div>
                <div style="clear:both"></div>
                <hr>
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>标题</th>
                        <th>内容</th>
                        <th>创帖人</th>
                        <th>是否置顶</th>
                        <th>回复数</th>
                        <th>点赞数</th>
                        <th>浏览数</th>
                        <th>所在交流区</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pageInfo.list}" var="articles">
                            <tr>
                                <td width="15%">${articles.title}</td>
                                <td width="30%" class="line-limit-length">${articles.content}</td>
                                <td width="5%" class="line-limit-length">${articles.senderName}</td>
                                <td width="5%" class="line-limit-length">${articles.isTop}</td>
                                <td width="5%">${articles.replyCount}</td>
                                <td width="5%">${upvoteCount}</td>
                                <td width="5%">${articles.browseCount}</td>
                                <td width="15%">${articles.zoneId}</td>
                                <td width="15%">
                                    <a href="/article/deleteArticle.do?id=${article.articleid}&pn=${articleMsgs.pageNum}&title=${articleSearch.title}&sendername=${articleSearch.sendername}" role="button" class="btn btn-primary">屏蔽</a>
                                    <c:if test="${article.istop==0}">
                                        <a href="/article/changeStatus.do?id=${article.articleid}&pn=${articleMsgs.pageNum}&title=${articleSearch.title}&sendername=${articleSearch.sendername}" role="button" class="btn btn-danger" >置顶</a>
                                    </c:if>
                                    <c:if test="${article.istop==1}">
                                        <a href="/article/changeStatus.do?id=${article.articleid}&pn=${articleMsgs.pageNum}&title=${articleSearch.title}&sendername=${articleSearch.sendername}" role="button" class="btn btn-info" >取消</a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>


            </div><!-- /.panel panel-success -->
            <!--显示分页信息-->
            <div class="row">
                <!--文字信息-->
                <div class="col-md-6">
                    当前第 ${pageInfo.pageNum} 页.总共 ${pageInfo.pages} 页.一共 ${pageInfo.total} 条记录
                </div>

                <!--点击分页-->
                <div class="col-md-6">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <!--首页-->
                            <li><a href="${pageContext.request.contextPath}/article/findAll.do?page=1&pageSize=${pageInfo.pageSize}" >首页</a></li>
                            <!--上一页-->

                                        <a href="${pageContext.request.contextPath}/article/findAll.do?page=${pageInfo.pageNum-1}&pageSize=${pageInfo.pageSize}"  aria-label="Previous">
                                            <span aria-hidden="true">«</span>
                                        </a>
                            </li>

                            <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                                <li><a href="${pageContext.request.contextPath}/article/findAll.do?page=${pageNum}&pageSize=${pageInfo.pageSize}">${pageNum}</a></li>
                            </c:forEach>

                            <!--下一页-->
                            <li>
                                    <a href="${pageContext.request.contextPath}/article/findAll.do?page=${pageInfo.pageNum+1}&pageSize=${pageInfo.pageSize}"
                                       aria-label="Next">
                                        <span aria-hidden="true">»</span>
                                    </a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/article/findAll.do?page=${pageInfo.pages}&pageSize=${pageInfo.pageSize}" >尾页</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div><!-- /.dept_info -->
        <!-- 尾部-->
        <%@ include file="commom/foot.jsp"%>
    </div><!-- /.hrms_dept_body -->

</div><!-- /.hrms_dept_container -->

<%--<%@ include file="ArticleAdd.jsp"%>--%>
<%@ include file="ArticleUpdate.jsp"%>
</body>
</html>
