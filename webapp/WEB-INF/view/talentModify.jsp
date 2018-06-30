<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<html>
<head>
    <title>talentModify</title>
</head>
<body>
<div class="main-content">
    <div class="container-fluid">
        <h3 class="page-title">人才信息</h3>

        <div class="row">
            <div class="col-md-12">
                <div class="panel" >
                    <div class="panel-heading row">
                        <div class="col-md-6">
                            <form class="form-auth-small" action="${ctx}/talent/modify?type=save" method="post">
                                <input type="hidden" value="${talent!=null?talent.id:''}" name="id">
                                <div class="form-group">
                                    <label for="name" class="">姓名：</label>
                                    <input type="text" class="form-control" id="name" name="name"
                                           value="${talent!=null?talent.name:''}" placeholder="姓名">
                                </div>
                                <div class="form-group">
                                    <label for="tCode" class="">工号：</label>
                                    <input type="text" class="form-control" id="tCode" name="tCode"
                                           value="${talent!=null?talent.tCode:''}" placeholder="工号">
                                </div>
                                <div class="form-group">
                                    <label for="sexual" class="">性别：</label>
                                    <select class="form-control " name="sexual" id="sexual">
                                        <option value="0" ${talent!=null&&talent.sexual eq '0'?'selected':''}>女</option>
                                        <option value="1" ${talent!=null&&talent.sexual eq '1'?'selected':''}>男</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="birthday" class="">生日：</label>
                                    <input data-provide="datepicker" class="form-control" data-date-format="yyyy-mm-dd"
                                           placeholder="生日" type="text" name="birthday" id="birthday"
                                           value="${talent!=null?talent.birthday:''}">
                                </div>
                                <div class="form-group">
                                    <label for="identity" class="">身份证：</label>
                                    <input type="text" class="form-control" id="identity" name="identity"
                                           value="${talent!=null?talent.identity:''}" placeholder="身份证">
                                </div>
                                <div class="form-group">
                                    <label for="departId">所属部门：</label>
                                    <select class="form-control " name="departId" id="departId">
                                        <c:forEach items="${departments}" var="depart">
                                            <option value="${depart.id}" ${talent!=null&&talent.departId eq depart.id?'selected':''}>${depart.departName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="posId">所属岗位：</label>
                                    <select class="form-control " name="posId" id="posId">
                                        <c:forEach items="${positions}" var="position">
                                            <option value="${position.id}" ${talent!=null&&talent.departId eq position.id?'selected':''}>${position.posName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="employDate" class="">入职日期：</label>
                                    <input data-provide="datepicker" class="form-control" data-date-format="yyyy-mm-dd"
                                           placeholder="入职日期" type="text" name="employDate" id="employDate"
                                           value="${talent!=null?talent.employDate:''}">
                                </div>
                                <div class="form-group">
                                    <label for="unemployDate" class="">离职日期：</label>
                                    <input data-provide="datepicker" class="form-control" data-date-format="yyyy-mm-dd"
                                           placeholder="离职日期" type="text" name="unemployDate" id="unemployDate"
                                           value="${talent!=null?talent.unemployDate:''}">
                                </div>
                                <div class="form-group">
                                    <label for="startupDate" class="">开始工作日期：</label>
                                    <input data-provide="datepicker" class="form-control" data-date-format="yyyy-mm-dd"
                                           placeholder="开始工作日期" type="text" name="startupDate" id="startupDate"
                                           value="${talent!=null?talent.startupDate:''}">
                                </div>
                                <div class="form-group">
                                    <label for="talentSource" class="">人才来源：</label>
                                    <select class="form-control " name="talentSource" id="talentSource">
                                        <option value="校招" ${talent!=null&&talent.talentSource eq '校招'?'selected':''}>校招</option>
                                        <option value="社招" ${talent!=null&&talent.talentSource eq '社招'?'selected':''}>社招</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="politicsStatus" class="">人才来源：</label>
                                    <select class="form-control " name="politicsStatus" id="politicsStatus">
                                        <option value="普通公民" ${talent!=null&&talent.politicsStatus eq '普通公民'?'selected':''}>普通公民</option>
                                        <option value="共青团员" ${talent!=null&&talent.politicsStatus eq '共青团员'?'selected':''}>共青团员</option>
                                        <option value="党员" ${talent!=null&&talent.politicsStatus eq '党员'?'selected':''}>党员</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="marriage" class="">婚姻状况：</label>
                                    <select class="form-control " name="marriage" id="marriage">
                                        <option value="0" ${talent!=null&&'0' eq talent.marriage?'selected':''}>未婚</option>
                                        <option value="1" ${talent!=null&&'1' eq talent.marriage?'selected':''}>已婚</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="bodyHeight" class="">身高：</label>
                                    <input type="number" class="form-control" id="bodyHeight" name="bodyHeight"
                                           value="${talent!=null?talent.bodyHeight:''}" placeholder="身高">
                                </div>
                                <div class="form-group">
                                    <label for="bodyWeight" class="">体重：</label>
                                    <input type="number" class="form-control" id="bodyWeight" name="bodyWeight"
                                           value="${talent!=null?talent.bodyWeight:''}" placeholder="体重">
                                </div>
                                <div class="form-group">
                                    <label for="eduBackground" class="">教育背景：</label>
                                    <input type="text" class="form-control" id="eduBackground" name="eduBackground"
                                           value="${talent!=null?talent.eduBackground:''}" placeholder="教育背景">
                                </div>
                                <div class="form-group">
                                    <label for="gradInst">毕业院校：</label>
                                    <input type="text" class="form-control" id="gradInst" name="gradInst"
                                           value="${talent!=null?talent.gradInst:''}" placeholder="毕业院校">
                                </div>
                                <div class="form-group">
                                    <label for="profession">专业：</label>
                                    <input type="text" class="form-control" id="profession" name="profession"
                                           value="${talent!=null?talent.profession:''}" placeholder="专业">
                                </div>
                                <div class="form-group">
                                    <label for="status" class="">状态：</label>
                                    <select class="form-control " name="status" id="status">
                                        <option value="0" ${talent!=null&&'0' eq talent.status?'selected':''}>未入职</option>
                                        <option value="1" ${talent!=null&&'1' eq talent.status?'selected':''}>在职</option>
                                        <option value="2" ${talent!=null&&'2' eq talent.status?'selected':''}>离职</option>
                                    </select>
                                </div>
                                <div class="row">
                                    <div class="col-sm-2">
                                        <input type="submit" class="btn btn-primary btn-small btn-block" value="保存">

                                    </div>
                                    <div class="col-sm-2">
                                        <input type="button" class="btn btn-danger btn-small btn-block" value="取消" onclick="window.history.go(-1)">

                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <%-- <div class="panel">
                     <form>
                         <div class="panel-body">
                             <div class="row">
                                 <div class="col-md-3">
                                     <input type="text" class="form-control" name="posName" placeholder="岗位名称"/>
                                 </div>
                             </div>
                             <div class="row">
                                 <div class="col-md-3">
                                     <input type="text" class="form-control" name="posCode" placeholder="岗位编码"/>
                                 </div>
                             </div>
                             <div class="row">
                                 <div class="col-md-3">
                                     <input type="number" class="form-control" name="posSalary" placeholder="薪资"/>
                                 </div>
                             </div>
                         </div>
                     </form>
                 </div>--%>
                <!-- END BORDERED TABLE -->
            </div>
        </div>
    </div>
</div>
</body>
</html>
