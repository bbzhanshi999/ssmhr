<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<%@ include file="/WEB-INF/view/include/head.jsp" %>
<html>
<head>
    <title>人才库管理</title>
</head>
<style>
    table.table tbody tr:hover{
        background-color: #D9EDF7;
        cursor: pointer;
    }
    .selected{
        background-color: #00AAFF;
    }
</style>
<script>
    //进入创建人才信息的页面
    function createTalent() {
        window.location.href="${ctx}/talent/create?"+Math.random();
    }

    function updateTalent() {

        var selectedTr = $('table.table tbody tr.selected');
        if(selectedTr&&selectedTr.length>0){
            window.location.href="${ctx}/talent/update/"+selectedTr.find('td')[0].innerHTML+"?"+Math.random();
        }else{
            alert('请选择一行数据');
        }
    }

    function deleteTalent() {
        var selectedTr = $('table.table tbody tr.selected');
        if(selectedTr&&selectedTr.length>0){
            window.location.href="${ctx}/talent/delete/"+selectedTr.find('td')[0].innerHTML+"?"+Math.random();
        }else{
            alert('请选择一行数据');
        }
    }

    function search(){
        //为了避免在非第一页条件的查询page页仍为1
        $('#talentForm').find('input[name="pageNum"]').val(1);
        $('#talentForm').submit();
    }

    $(document).ready(function () {
        $('table.table tbody tr').on('click',function (e) {
            if($(this).hasClass('selected')){
                $(this).removeClass('selected');
            }else{
                //取消掉其他tr列的selected class
                $('table.table tbody tr').removeClass('selected');

                //给被点击的tr加class
                $(this).addClass('selected');
            }
        });
        //分页按钮点击事件
        $("ul.pager a").on("click",function (e) {
            if($(this).hasClass("prev")){
                $('#talentForm input[name="pageNum"]').val(parseInt($('#talentForm input[name="pageNum"]').val())-1);
            }else{
                $('#talentForm input[name="pageNum"]').val(parseInt($('#talentForm input[name="pageNum"]').val())+1);
            }
            $('#talentForm').submit();
        })
    });
</script>
<body>

<!-- MAIN CONTENT -->
<div class="main-content">
    <div class="container-fluid">

        <div class="row">
            <div class="col-md-12">
                <div class="panel">
                    <div class="panel-heading" style="padding-bottom: 0px !important;">
                        <div class="row">
                            <form id="talentForm" action="${ctx}/talent" method="post">
                                <input type="hidden" name="pageNum" value="${page.currentPage}">
                                <div class="col-md-2">
                                    <input type="text" name="name" value="${talent.name}"
                                           class="form-control" placeholder="输入姓名">
                                </div>
                                <div class="col-md-2">
                                    <input type="text" name="identity" value="${talent.identity}"
                                           class="form-control" placeholder="输入身份证">
                                </div>
                                <div class="col-md-2">
                                    <input type="text" name="tCode" value="${talent.tCode}"
                                           class="form-control" placeholder="输入工号">
                                </div>
                                <div class="col-md-1">
                                    <button type="button" class="btn btn-primary btn-sm" onclick="search()">查询
                                    </button>
                                </div>
                                <div class="col-md-1">
                                    <button type="button" class="btn btn-success btn-sm" onclick="createTalent()" >新增
                                    </button>
                                </div>
                                <div class="col-md-1">
                                    <button type="button" class="btn btn-info btn-sm" onclick="updateTalent()">修改
                                    </button>
                                </div>
                                <div class="col-md-1">
                                    <button type="button" class="btn btn-danger btn-sm" onclick="deleteTalent()">删除
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="panel-body">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th style="display: none">id</th>
                                <th>姓名</th>
                                <th>性别</th>
                                <th>生日</th>
                                <th>部门</th>
                                <th>岗位</th>
                                <th>婚姻状况</th>
                                <th>教育背景</th>
                                <th>毕业院校</th>
                                <th>专业</th>
                                <th>人才来源</th>
                                <th>开始工作日期</th>
                                <th>状态</th>
                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${page.list}" var="talent">
                                    <tr>
                                        <td style="display:none">${talent.id}</td>
                                        <td>${talent.name}</td>
                                        <td>${'1' eq talent.sexual?'男':'女'}</td>
                                        <td><fmt:formatDate value="${talent.birthday}" pattern="yyyy-MM-dd"/></td>
                                        <td>${talent.department.departName}</td>
                                        <td>${talent.position.posName}</td>
                                        <td>${'1' eq talent.marriage?'已婚':'未婚'}</td>
                                        <td>${talent.eduBackground}</td>
                                        <td>${talent.gradInst}</td>
                                        <td>${talent.profession}</td>
                                        <td>${talent.talentSource}</td>
                                        <td><fmt:formatDate value="${talent.startupDate}" pattern="yyyy-MM-dd"/></td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${'0' eq talent.status}">
                                                    未入职
                                                </c:when>
                                                <c:when test="${'1' eq talent.status}">
                                                    在职
                                                </c:when>
                                                <c:otherwise>
                                                    离职
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <%--分页显示，调用的是page.toString()--%>${page}
                    </div>

                </div>
                <!-- END BORDERED TABLE -->
            </div>
        </div>
    </div>
</div>

</body>
</html>