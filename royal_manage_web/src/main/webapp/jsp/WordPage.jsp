<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>敏感词管理页面</title>

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
                        <li><a href="${pageContext.request.contextPath}/word/findAll.do?page=1&pageSize=8">用户帖管理</a></li>
                        <li class="active">敏感词汇管理</li>
                    </ol>
                </div>
                <hr>
                <!-- Table -->
                <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">新增敏感词</button>

                <div style="clear:both"></div>
                <hr>
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>敏感词</th>
                        <th>是否启用</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pageInfo.list}" var="words">
                            <tr>
                                <td width="15%">${words.wordId}</td>
                                <td width="55%" class="line-limit-length">${words.word}</td>
                                <td width="20%" class="line-limit-length">
                                     <c:if test="${words.status == 0}">
                                         使用中
                                     </c:if>
                                    <c:if test="${words.status != 0}">
                                        已停用
                                    </c:if>
                                </td>
                                <td width="10%">
                                    <c:if test="${words.status==1}">
                                        <a href="/word/changeStatus.do?wordId=${words.wordId}&status=${words.status}" role="button" class="btn btn-primary">启用</a>
                                    </c:if>
                                    <c:if test="${words.status==0}">
                                        <a href="/word/changeStatus.do?wordId=${words.wordId}&status=${words.status}" role="button" class="btn btn-danger" >停用</a>
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
                            <li><a href="${pageContext.request.contextPath}/word/findAll.do?page=1&pageSize=${pageInfo.pageSize}" >首页</a></li>
                            <!--上一页-->
                            <li>
                                        <a href="${pageContext.request.contextPath}/word/findAll.do?page=${pageInfo.pageNum-1}&pageSize=${pageInfo.pageSize}"  aria-label="Previous">
                                            <span aria-hidden="true">«</span>
                                        </a>
                            </li>

                            <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                                <li><a href="${pageContext.request.contextPath}/word/findAll.do?page=${pageNum}&pageSize=${pageInfo.pageSize}">${pageNum}</a></li>
                            </c:forEach>

                            <!--下一页-->
                            <li>
                                    <a href="${pageContext.request.contextPath}/word/findAll.do?page=${pageInfo.pageNum+1}&pageSize=${pageInfo.pageSize}"
                                       aria-label="Next">
                                        <span aria-hidden="true">»</span>
                                    </a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/word/findAll.do?page=${pageInfo.pages}&pageSize=${pageInfo.pageSize}" >尾页</a></li>
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

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                   新增敏感词汇
                </h4>
            </div>
            <div class="modal-body"  >
                <input id="addWord" type="text" style="height: 67px;width: 540px">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="addWord()">
                    提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


<script type="text/javascript">
    function addWord() {
        var addWord = $("#addWord").val();
        $.ajax({
            url : "${pageContext.request.contextPath}/word/addWord.do",
            type : "POST",
            data : {"word":addWord},
            // 成功后开启模态框
            success : function(){
                location.reload()
            }
        });
    }


</script>
</body>
</html>
