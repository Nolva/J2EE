<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <title>员工管理</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap-datetimepicker.min.css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap-select.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/linearicons/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/chartist/css/chartist-custom.css">
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
    <!-- ELSE CSS有必要就添加 -->
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <!-- ICONS -->
    <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="${pageContext.request.contextPath}/assets/img/favicon.png">
</head>

<body>
<!-- WRAPPER -->
<div id="wrapper">
    <!-- NAVBAR -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="brand">
            <%--<a href="/index"><img src="${pageContext.request.contextPath}/assets/img/logo-dark.png"  class="img-responsive logo"></a>--%>
            企业信息管理系统
        </div>
        <div class="container-fluid">
            <div class="navbar-btn">
                <button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
            </div>
            <div id="navbar-menu">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <span>${manager.managerId}，你好</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
                        <ul class="dropdown-menu">
                            <li><a href="/logout"><i class="lnr lnr-exit"></i> <span>注销</span></a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- END NAVBAR -->
    <!-- LEFT SIDEBAR -->
    <div id="sidebar-nav" class="sidebar">
        <div class="sidebar-scroll">
            <nav>
                <ul class="nav">
                    <li><a href="/index" class=""><i class="lnr lnr-home"></i> <span>首页</span></a></li>
                    <li><a href="/client/show" class=""><i class="lnr lnr-user"></i> <span>客户管理</span></a></li>
                    <li><a href="/employee/show" class="active"><i class="lnr lnr-phone"></i> <span>员工管理</span></a></li>
                    <li><a href="/product/products" class=""><i class="lnr lnr-gift"></i> <span>产品管理</span></a></li>
                    <li><a href="/contract/contracts" class=""><i class="lnr lnr-book"></i> <span>合同管理</span></a></li>
                </ul>
            </nav>
        </div>
    </div>
    <!-- END LEFT SIDEBAR -->
    <!-- MAIN代码添加区域 -->
    <div class="main">
        <div class="main-content">
            <div class="container-fluid">
                <div class="panel panel-headline">
                    <div class="panel-heading">
                        <h3 class="panel-title">员工管理</h3>
                    </div>
                    <div class="panel-body">
                        <button class="btn btn-info btn-xs" data-toggle="modal" data-target="#addChar">添加员工</button>
                        <table class="table">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>姓名</th>
                                <th>性别</th>
                                <th>出生日期</th>
                                <th>部门</th>
                                <th>职位</th>
                                <th>入职日期</th>
                                <th>工资</th>
                                <th>电话</th>
                                <th>邮箱</th>
                                <th>地址</th>
                                <th>学历</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${employeeList}" var="employee" varStatus="vs">
                                <%--<s:property value="#vs.index+1"/><br>--%>
                                <tr role="row" data-employeeId="${employee.employeeId}" data-empName="${employee.empName}"
                                    data-empSex="${employee.empSex}" data-empBirthday="${employee.empBirthday}"
                                    data-empDepartment="${employee.empDepartment}" data-empTitle="${employee.empTitle}"
                                    data-empHireDate="${employee.empHireDate}" data-empSalary="${employee.empSalary}"
                                    data-empTelephone="${employee.empTelephone}" data-empEmail="${employee.empEmail}"
                                    data-empAddress="${employee.empAddress}" data-empEducation="${employee.empEducation}">
                                    <td>${employee.employeeId}</td>
                                    <td>${employee.empName}</td>
                                    <td>${employee.empSex}</td>
                                    <td>${employee.empBirthday}</td>
                                    <td>${employee.empDepartment}</td>
                                    <td>${employee.empTitle}</td>
                                    <td>${employee.empHireDate}</td>
                                    <td>${employee.empSalary}</td>
                                    <td>${employee.empTelephone}</td>
                                    <td>${employee.empEmail}</td>
                                    <td>${employee.empAddress}</td>
                                    <td>${employee.empEducation}</td>
                                    <td>
                                        <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#changeChar">修改</button>
                                        <button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteChar">删除</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <table class="table">
                            <tr>
                                <td>
                                    <span>第${currentPage}/${totalPage}页</span>
                                    <span>总记录${totalCount}条</span>
                                    <span>
                                        <c:if test="${currentPage!=1}">
                                            <a href="${pageContext.request.contextPath}/employee/show?page=1">首页</a>
                                            <a href="${pageContext.request.contextPath}/employee/show?page=${currentPage-1}">上一页</a>
                                        </c:if>
                                        <c:if test="${currentPage!=totalPage}">
                                            <a href="${pageContext.request.contextPath }/employee/show?page=${currentPage+1}">下一页</a>
                                            <a href="${pageContext.request.contextPath }/employee/show?page=${totalPage}">尾页</a>
                                        </c:if>
                                    </span>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END MAIN代码添加区域结尾 -->
    <!--删除警告窗口-->
    <div class="modal fade" id="deleteChar" role="dialog" aria-labelledby="gridSystemModalLabel2">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel2">提示</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <form class="form-horizontal" action="/employee/delete" method="post">
                            <div class="form-group " style="display:none;">
                                <label for="employeeId2" class="col-xs-3 control-label">员工Id：</label>
                                <div class="col-xs-6 ">
                                    <input type="" class="form-control input-sm duiqi" id="employeeId2" name="employeeId" >
                                </div>
                            </div>
                            <div class="form-group " >
                                确定要删除该员工？删除后不可恢复！
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                <button type="submit" class="btn btn-xs btn-green">确 定</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!--修改权限弹出窗口-->
    <div class="modal fade" id="changeChar" role="dialog" aria-labelledby="gridSystemModalLabel1">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel1">修改员工信息</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <form class="form-horizontal" action="/employee/change" method="post">
                            <div class="form-group ">
                                <label for="employeeId" class="col-xs-3 control-label">员工ID：</label>
                                <div class="col-xs-6 ">
                                    <input type="" class="form-control input-sm duiqi" id="employeeId" name="employeeId" placeholder="">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="empName" class="col-xs-3 control-label">员工姓名：</label>
                                <div class="col-xs-6 ">
                                    <input type="" class="form-control input-sm duiqi" id="empName" name="empName" placeholder="">
                                </div>
                            </div>
                            <div class="form-group " >
                                <div class="form-group " >
                                    <label class="col-xs-3 control-label ">员工性别：</label>
                                    <div class="col-xs-6 ">
                                        <div id="empSex" class="col-xs-6 ">
                                            <label class="radio-inline">
                                                <input type="radio" value="男" name="empSex" checked="checked">男
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio"  value="女" name="empSex">女
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                <div class="form-group " >
                                    <label class="col-xs-3 control-label">出生日期：</label>
                                    <div class=" col-xs-6">
                                        <div id="empBirthday" class="input-group date">
                                            <input type="text" required="required" class="form-control duiqi" name="empBirthday" />
                                            <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group " >
                                    <label class="col-xs-3 control-label">员工部门：</label>
                                    <div id = "empDepartment" class="col-xs-6 ">
                                        <select class="form-control input-sm duiqi selectpicker" name="empDepartment">
                                            <option value="主管部门"  checked="checked">主管部门</option>
                                            <option value="销售部门" >销售部门</option>
                                            <option value="产品部门" >产品部门</option>
                                            <option value="监管部门" >监管部门</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group " >
                                    <label class="col-xs-3 control-label">员工职位：</label>
                                    <div  id = "empTitle" class="col-xs-6 ">
                                        <select class="form-control input-sm duiqi selectpicker" name="empTitle">
                                            <option value="主管经理"  checked="checked">主管经理</option>
                                            <option value="销售经理" >销售经理</option>
                                            <option value="产品经理" >产品经理</option>
                                            <option value="监管经理" >监管经理</option>
                                            <option value="主管人员" >主管人员</option>
                                            <option value="销售人员" >销售人员</option>
                                            <option value="产品人员" >产品人员</option>
                                            <option value="监管人员" >监管人员</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group " >
                                    <label class="col-xs-3 control-label">入职日期：</label>
                                    <div class=" col-xs-6">
                                        <div id="empHireDate" class="input-group date">
                                            <input type="text" required="required" class="form-control duiqi" name="empHireDate" />
                                            <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>

                            <div class="form-group ">
                                <label for="empSalary" class="col-xs-3 control-label">员工工资：</label>
                                <div class="col-xs-6 ">
                                    <input type="" class="form-control input-sm duiqi" id="empSalary" name="empSalary" placeholder="">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="empTelephone" class="col-xs-3 control-label">员工电话：</label>
                                <div class="col-xs-6 ">
                                    <input type="" class="form-control input-sm duiqi" id="empTelephone" name="empTelephone" placeholder="">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="empEmail" class="col-xs-3 control-label">员工邮箱：</label>
                                <div class="col-xs-6 ">
                                    <input type="" class="form-control input-sm duiqi" id="empEmail" name="empEmail" placeholder="">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="empAddress" class="col-xs-3 control-label">员工地址：</label>
                                <div class="col-xs-6 ">
                                    <input type="" class="form-control input-sm duiqi" id="empAddress" name="empAddress" placeholder="">
                                </div>
                            </div>
                                <div class="form-group " >
                                    <label  class="col-xs-3 control-label">员工学历：</label>
                                    <div id = "empEducation" class="col-xs-6 ">
                                        <select class="form-control input-sm duiqi selectpicker" name="empEducation">
                                            <option value="博士" >博士</option>
                                            <option value="硕士研究生" >硕士研究生</option>
                                            <option value="本科" >本科</option>
                                            <option value="专科" >专科</option>
                                        </select>
                                    </div>
                                </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                <button type="submit" class="btn btn-xs btn-green">保 存</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
    <!--添加客户弹出窗口-->
    <div class="modal fade" id="addChar" role="dialog" aria-hidden="true" aria-labelledby="gridSystemModalLabel3">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel3">添加员工</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <form class="form-horizontal" action="/employee/add" method="post">
                            <div class="form-group " >
                                <label for="employeeId3" class="col-xs-3 control-label">员工Id：</label>
                                <div class="col-xs-6 ">
                                    <input type="" required="required" class="form-control input-sm duiqi" id="employeeId3" name="employeeId" }>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="empName3" required="required" class="col-xs-3 control-label">员工姓名：</label>
                                <div class="col-xs-6 ">
                                    <input type="" class="form-control input-sm duiqi" id="empName3" name="empName" placeholder="">
                                </div>
                            </div>


                            <div class="form-group " >
                                <label class="col-xs-3 control-label ">员工性别：</label>
                                <div id="empSex3" class="col-xs-6 ">
                                    <label class="radio-inline">
                                        <input type="radio" value="男"  name="empSex" checked="checked">男
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio"  value="女" name="empSex">女
                                    </label>
                                </div>
                            </div>
                            <div class="form-group " >
                                <label class="col-xs-3 control-label">出生日期：</label>
                                <div class="col-xs-6 ">
                                    <div id="empBirthday3" class="input-group date">
                                        <input type="text" required="required" class="form-control duiqi" name="empBirthday" />
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group " >
                                <label class="col-xs-3 control-label">员工部门：</label>
                                <div id="empDepartment3" class="col-xs-6 ">
                                    <select class="form-control input-sm duiqi selectpicker" name="empDepartment">
                                        <option value="主管部门"  checked="checked">主管部门</option>
                                        <option value="销售部门" >销售部门</option>
                                        <option value="产品部门" >产品部门</option>
                                        <option value="监管部门" >监管部门</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group " >
                                <label class="col-xs-3 control-label">员工职位：</label>
                                <div id="empTitle3" class="col-xs-6 ">
                                    <select class="form-control input-sm duiqi selectpicker" name="empTitle">
                                        <option value="主管经理"  checked="checked">主管经理</option>
                                        <option value="销售经理" >销售经理</option>
                                        <option value="产品经理" >产品经理</option>
                                        <option value="监管经理" >监管经理</option>
                                        <option value="主管人员" >主管人员</option>
                                        <option value="销售人员" >销售人员</option>
                                        <option value="产品人员" >产品人员</option>
                                        <option value="监管人员" >监管人员</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group " >
                                <label class="col-xs-3 control-label">入职日期：</label>
                                <div class="col-xs-6 ">
                                    <div id="empHireDate3" class="input-group date">
                                        <input type="text" required="required" class="form-control duiqi" name="empHireDate" />
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group " >
                                <label for="empSalary3" class="col-xs-3 control-label">员工工资：</label>
                                <div class="col-xs-6 ">
                                    <input type="" required="required" class="form-control input-sm duiqi" id="empSalary3" name="empSalary" }>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="empTelephone3" class="col-xs-3 control-label">员工电话：</label>
                                <div class="col-xs-6 ">
                                    <input type="" class="form-control input-sm duiqi" id="empTelephone3" name="empTelephone" placeholder="">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="empEmail3" class="col-xs-3 control-label">员工邮箱：</label>
                                <div class="col-xs-6 ">
                                    <input type="" class="form-control input-sm duiqi" id="empEmail3" name="empEmail" placeholder="">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="empAddress3" class="col-xs-3 control-label">员工地址：</label>
                                <div class="col-xs-6 ">
                                    <input type="" class="form-control input-sm duiqi" id="empAddress3" name="empAddress" placeholder="">
                                </div>
                            </div>
                            <div class="form-group " >
                                <label  class="col-xs-3 control-label">员工学历：</label>
                                <div id="empEducation3" class="col-xs-6 ">
                                    <select class="form-control input-sm duiqi selectpicker" name="empEducation">
                                    <option value="博士" >博士</option>
                                    <option value="硕士研究生" >硕士研究生</option>
                                    <option value="本科" >本科</option>
                                    <option value="专科" >专科</option>
                                    </select>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                <button type="submit" class="btn btn-xs btn-green">添加</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>

    <div class="clearfix"></div>
    <footer>
        <div class="container-fluid">
            <p class="copyright">Copyright &copy; 2019.J2EE 项目小组 All rights reserved.</p>

        </div>
    </footer>
</div>
<!-- END WRAPPER -->
<!-- Javascript -->
<script src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap-datetimepicker.min.js" ></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap-datetimepicker.js" ></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap-datetimepicker.zh-CN.js" ></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap-datetimepicker.fr.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap-select.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/defaults-zh_CN.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/chartist/js/chartist.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/scripts/common.js"></script>
</body>
<script>
    // 编辑对话框
    $('#changeChar').on('show.bs.modal',function(event){
        var source = event.relatedTarget;
        var $tr = $(source).closest('tr');
        var employeeId = $tr.attr('data-employeeId');
        var empName = $tr.attr('data-empName');
        // var empSex = $tr.attr('data-empSex');
        var empBirthday = $tr.attr('data-empBirthday');
        // var empDepartment = $tr.attr('data-empDepartment');
        // var empTitle = $tr.attr('data-empTitle');
        var empHireDate = $tr.attr('data-empHireDate');
        var empSalary = $tr.attr('data-empSalary');
        var empTelephone = $tr.attr('data-empTelephone');
        var empEmail = $tr.attr('data-empEmail');
        var empAddress = $tr.attr('data-empAddress');
        // var empEducation = $tr.attr('data-empEducation');
        $(':input[name="employeeId"]','#changeChar').val(employeeId);
        $(':input[name="empName"]','#changeChar').val(empName);
        // $(':input[name="empSex"]','#changeChar').val(empSex);
        $(':input[name="empBirthday"]','#changeChar').val(empBirthday);
        // $(':input[name="empDepartment"]','#changeChar').val(empDepartment);
        // $(':input[name="empTitle"]','#changeChar').val(empTitle);
        $(':input[name="empHireDate"]','#changeChar').val(empHireDate);
        $(':input[name="empSalary"]','#changeChar').val(empSalary);
        $(':input[name="empTelephone"]','#changeChar').val(empTelephone);
        $(':input[name="empEmail"]','#changeChar').val([empEmail]);
        $(':input[name="empAddress"]','#changeChar').val([empAddress]);
        // $(':input[name="empEducation"]','#changeChar').val(empEducation);

        var picker1 = $('#empBirthday').datetimepicker({
            //startView: 4,  //起始选择范围
            maxView: 4, //最大选择范围
            minView: 2, //最小选择范围
            endDate:  new Date(),
            todayHighlight : 1,// 当前时间高亮显示
            autoclose : 1,// 选择时间后弹框自动消失
            format : 'yyyy-mm-dd',// 时间格式
            language : 'zh-CN'// 汉化
            // // todayBtn:"linked",//显示今天 按钮
            //clearBtn :1 // 清除按钮，和今天 按钮只能显示一个
        }).on('show', function(event) {
            event.preventDefault();
            event.stopPropagation();
        });

        var picker2 = $('#empHireDate').datetimepicker({
            maxView: 4, //最大选择范围
            minView: 2, //最小选择范围
            startDate:  new Date(),
            // endDate: new Date(),
            todayHighlight : 1,// 当前时间高亮显示
            autoclose : 1,// 选择时间后弹框自动消失
            format : 'yyyy-mm-dd',// 时间格式
            language : 'zh-CN'// 汉化
        }).on('show', function(event) {
            event.preventDefault();
            event.stopPropagation();
        });

        //动态设置最小值
        picker1.on('changeDate', function (e) {
            $('#empHireDate').datetimepicker('setStartDate',e.date);
        });
        //动态设置最大值
        picker2.on('changeDate', function (e) {
            $('#empBirthday').datetimepicker('setEndDate',e.date);
        });
    });

    $('#addChar').on('show.bs.modal',function(event){
        var emplooyeeId = <%=request.getParameter("emplooyeeId")%>;
        var empName = <%=request.getParameter("empName")%>;
        //var empSex = <%=request.getParameter("empSex")%>;
        var empBirthday = <%=request.getParameter("empBirthday")%>;
        //var empDepartment = <%=request.getParameter("empDepartment")%>;
        //var empTitle = <%=request.getParameter("empTitle")%>;
        var empHireDate = <%=request.getParameter("empHireDate")%>;
        var empSalary = <%=request.getParameter("empSalary")%>;
        var empTelephone = <%=request.getParameter("empTelephone")%>;
        var empEmail = <%=request.getParameter("empEmail")%>;
        var empAddress = <%=request.getParameter("empAddress")%>;
        //var empEducation = <%=request.getParameter("empEducation")%>;
        $(':input[name="emplooyeeId"]','#addChar').val(emplooyeeId);
        $(':input[name="empName"]','#addChar').val(empName);
        //$(':input[name="empSex"]','#addChar').val(empSex);
        $(':input[name="empBirthday"]','#addChar').val(empBirthday);
        //$(':input[name="empDepartment"]','#addChar').val(empDepartment);
        //$(':input[name="empTitle"]','#addChar').val(empTitle);
        $(':input[name="empHireDate"]','#addChar').val(empHireDate);
        $(':input[name="empSalary"]','#addChar').val(empSalary);
        $(':input[name="empTelephone"]','#addChar').val(empTelephone);
        $(':input[name="empEmail"]','#addChar').val([empEmail]);
        $(':input[name="empAddress"]','#addChar').val([empAddress]);
        //$(':input[name="empEducation"]','#addChar').val([empEducation]);

        //var empSexNum = document.getElementsByTagName("empSex");
        //var empSex = "";//用于存储已被选择的值
        // for(var i=0;i<empSexNum.length;i++){//遍历数组中对象，查看有没有值被选择
        //     if(empSexNum[i].checked){//checked表示被选择
        //         empSex = empSexNum[i];
        //     }}//把被选中的值给empSex

        var picker1 = $('#empBirthday3').datetimepicker({
            //startView: 4,  //起始选择范围
            maxView: 4, //最大选择范围
            minView: 2, //最小选择范围
            endDate:  new Date(),
            todayHighlight : 1,// 当前时间高亮显示
            autoclose : 1,// 选择时间后弹框自动消失
            format : 'yyyy-mm-dd',// 时间格式
            language : 'zh-CN'// 汉化
            // // todayBtn:"linked",//显示今天 按钮
            //clearBtn :1 // 清除按钮，和今天 按钮只能显示一个
        }).on('show', function(event) {
            event.preventDefault();
            event.stopPropagation();
        });

        var picker2 = $('#empHireDate3').datetimepicker({
            maxView: 4, //最大选择范围
            minView: 2, //最小选择范围
            startDate:  new Date(),
            // endDate: new Date(),
            todayHighlight : 1,// 当前时间高亮显示
            autoclose : 1,// 选择时间后弹框自动消失
            format : 'yyyy-mm-dd',// 时间格式
            language : 'zh-CN'// 汉化
        }).on('show', function(event) {
            event.preventDefault();
            event.stopPropagation();
        });

        //动态设置最小值
        picker1.on('changeDate', function (e) {
            $('#empHireDate3').datetimepicker('setStartDate',e.date);
        });
        //动态设置最大值
        picker2.on('changeDate', function (e) {
            $('#empBirthday3').datetimepicker('setEndDate',e.date);
        });
    });
    $('#deleteChar').on('show.bs.modal',function(event){
        var source = event.relatedTarget;
        var $tr = $(source).closest('tr');
        var employeeId = $tr.attr('data-employeeId');
        console.log(employeeId);
        $(':input[name="employeeId"]','#deleteChar').val(employeeId);
    });
</script>

</html>
