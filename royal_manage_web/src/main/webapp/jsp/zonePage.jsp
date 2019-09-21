<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>版块管理页面</title>

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
                        <li><a href="/zone/findAllZone.do?page=1&pageSize=${pageInfo.pageSize}">板块管理</a></li>
                        <li class="active">版块管理</li>
                    </ol>
                </div>
                <hr>

                <div style="clear:both"></div>
                <hr>
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>板块Id</th>
                        <th>板块名字</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pageInfo.list}" var="zones">
                            <tr>
                                <td width="20%">${zones.zoneId}</td>
                                <td width="35%" class="line-limit-length">${zones.zoneName}</td>
                                <td width="25%" class="line-limit-length">
                                    <c:if test="${zones.isDef ==1}">
                                        默认
                                    </c:if>
                                    <c:if test="${zones.isDef ==2}">
                                        显示
                                    </c:if>
                                    <c:if test="${zones.isDef ==3}">
                                        屏蔽
                                    </c:if>
                                    

                                </td>
                                <td width="20%">
                                    <c:if test="${zones.isDef ==1}">
                                        <a href="/zone/changeIsDef.do?zoneId=${zones.zoneId}&isDef=${zones.isDef}&page=${pageInfo.pageNum}" role="button" class="btn btn-info" >取消默认</a>
                                    </c:if>
                                    <c:if test="${zones.isDef ==2}">
                                        <a href="/zone/changeIsDef.do?zoneId=${zones.zoneId}&isDef=${zones.isDef}&page=${pageInfo.pageNum}" role="button" class="btn btn-primary" >转为默认</a>
                                    </c:if>
                                    <c:if test="${zones.isDef ==3}">
                                        <a href="#" role="button" class="btn btn-default" disabled="true"  >屏蔽状态</a>
                                    </c:if>
                                    <c:if test="${zones.isDef ==1}">
                                        <a href="#" role="button" class="btn btn-default" disabled="true"  >屏蔽</a>
                                    </c:if>
                                    <c:if test="${zones.isDef ==2}">
                                        <a href="/zone/changeShield.do?zoneId=${zones.zoneId}&isDef=${zones.isDef}&page=${pageInfo.pageNum}" role="button" class="btn btn-danger" >屏蔽</a>
                                    </c:if>
                                    <c:if test="${zones.isDef ==3}">
                                        <a href="/zone/changeShield.do?zoneId=${zones.zoneId}&isDef=${zones.isDef}&page=${pageInfo.pageNum}" role="button" class="btn btn-info" >取消</a>
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
                            <li><a href="${pageContext.request.contextPath}/zone/findAllZone.do?page=1&pageSize=${pageInfo.pageSize}" >首页</a></li>
                            <!--上一页-->
                            <li>
                                        <a href="${pageContext.request.contextPath}/zone/findAllZone.do?page=${pageInfo.pageNum-1}&pageSize=${pageInfo.pageSize}"  aria-label="Previous">
                                            <span aria-hidden="true">«</span>
                                        </a>
                            </li>

                            <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                                <li><a href="${pageContext.request.contextPath}/zone/findAllZone.do?page=${pageNum}&pageSize=${pageInfo.pageSize}">${pageNum}</a></li>
                            </c:forEach>

                            <!--下一页-->
                            <li>
                                    <a href="${pageContext.request.contextPath}/zone/findAllZone.do?page=${pageInfo.pageNum+1}&pageSize=${pageInfo.pageSize}"
                                       aria-label="Next">
                                        <span aria-hidden="true">»</span>
                                    </a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/zone/findAllZone.do?page=${pageInfo.pages}&pageSize=${pageInfo.pageSize}" >尾页</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div><!-- /.dept_info -->
        <!-- 尾部-->
        <%@ include file="commom/foot.jsp"%>
    </div><!-- /.hrms_dept_body -->

</div><!-- /.hrms_dept_container -->

<script type="text/javascript">
    function findArticle(articleId) {
        $.ajax({
            url : "/article/findById.do",
            type : "POST",
            data : {"articleId":articleId},
            // 成功后开启模态框
            success : function(data){
                $("#detail_title").val(data.title);
                $("#detail_content").val(data.content);
            },
            error : function() {
                alert("请求失败");
            },
            dataType : "json"
        });
    }


</script>

<!-- /.帖子详情页 -->
<div class="modal fade article-detail-modal" id="article_detail" tabindex="-1" role="dialog" aria-labelledby="article-detail-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">帖子信息详情</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal article_detail_form">
                    <div class="form-group">
                        <label for="detail_title" class="col-sm-2 control-label">标题</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" rows="3" name="title" id="detail_title" disabled></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="detail_content" class="col-sm-2 control-label">内容</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" rows="3" name="content" id="detail_content" disabled></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<%--<%@ include file="ArticleAdd.jsp"%>--%>
<%@ include file="ArticleUpdate.jsp"%>
</body>
</html>
