<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>主页</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap-datetimepicker.min.css" >
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
                    <li><a href="/index" class="active"><i class="lnr lnr-home"></i> <span>首页</span></a></li>
                    <li><a href="client.jsp" class=""><i class="lnr lnr-user"></i> <span>客户管理</span></a></li>
                    <li><a href="/product/products" class=""><i class="lnr lnr-gift"></i> <span>产品管理</span></a></li>
                    <li><a href="employee.jsp" class=""><i class="lnr lnr-phone"></i> <span>员工管理</span></a></li>
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
                        <h3 class="panel-title">管理员管理</h3>
                    </div>
                    <div class="panel-body">
                        <button class="btn btn-info btn-xs" data-toggle="modal" data-target="#addChar">添加管理员</button>
                        <table class="table">
                                <thead>
                                <tr>
                                    <th>管理员ID</th>
                                    <th>管理员姓名</th>
                                    <th>管理员电话</th>
                                    <th>管理员邮箱</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${managerList}" var="manager" varStatus="vs">
                                <%--<s:property value="#vs.index+1"/><br>--%>
                                    <tr role="row" data-managerId="${manager.managerId}" data-manName="${manager.manName}"
                                        data-manTelephone="${manager.manTelephone}" data-manEmail="${manager.manEmail}"
                                        data-manPassword="${manager.manPassword}">
                                        <td>${manager.managerId}</td>
                                        <td>${manager.manName}</td>
                                        <td>${manager.manTelephone}</td>
                                        <td>${manager.manEmail}</td>
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
                                        <a href="${pageContext.request.contextPath}/administrator/show?page=1">首页</a>
                                        <a href="${pageContext.request.contextPath}/administrator/show?page=${currentPage-1}">上一页</a>
                                        </c:if>
                                        <c:if test="${currentPage!=totalPage}">
                                        <a href="${pageContext.request.contextPath }/administrator/show?page=${currentPage+1}">下一页</a>
                                        <a href="${pageContext.request.contextPath }/administrator/show?page=${totalPage}">尾页</a>
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
    <!--弹出窗口区 -->
    <!--修改弹出窗口-->
    <div class="modal fade" id="changeChar" role="dialog" aria-hidden="true" aria-labelledby="gridSystemModalLabel1">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel1">修改产品信息</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <form class="form-horizontal" action="/administrator/change" method="post">
                            <div class="form-group " style="display:none;">
                                <label for="managerId" class="col-xs-3 control-label">管理员Id：</label>
                                <div class="col-xs-6 ">
                                    <input type="" class="form-control input-sm duiqi" id="managerId" name="managerId" }>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="manName" class="col-xs-3 control-label">管理员姓名：</label>
                                <div class="col-xs-6 ">
                                    <input type="" class="form-control input-sm duiqi" id="manName" name="manName" placeholder="">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="manTelephone" class="col-xs-3 control-label">管理员电话：</label>
                                <div class="col-xs-6 ">
                                    <input type="" class="form-control input-sm duiqi" id="manTelephone" name="manTelephone" placeholder="">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="manEmail" class="col-xs-3 control-label">管理员邮箱：</label>
                                <div class="col-xs-6 ">
                                    <input type="" class="form-control input-sm duiqi" id="manEmail" name="manEmail" placeholder="">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="manPassword" class="col-xs-3 control-label">管理员密码：</label>
                                <div class="col-xs-6 ">
                                    <input type="password" required="required" class="form-control input-sm duiqi" id="manPassword" name="manPassword" placeholder="">
                                </div>
                            </div>


                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                <button type="submit" class="btn btn-xs btn-green">修 改</button>
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
                        <form class="form-horizontal" action="/administrator/delete" method="post">
                            <div class="form-group " style="display:none;">
                                <label for="managerId2" class="col-xs-3 control-label">管理员Id：</label>
                                <div class="col-xs-6 ">
                                    <input type="" class="form-control input-sm duiqi" id="managerId2" name="managerId" >
                                </div>
                            </div>
                            <div class="form-group " >
                                确定要删除该管理员？删除后不可恢复！
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

    <%--添加管理员弹出窗口--%>
    <div class="modal fade" id="addChar" role="dialog" aria-hidden="true" aria-labelledby="gridSystemModalLabel3">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel3">添加管理员</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <form class="form-horizontal" action="/administrator/add" method="post">
                            <div class="form-group " >
                                <label for="managerId3" class="col-xs-3 control-label">管理员Id：</label>
                                <div class="col-xs-6 ">
                                    <input type="" required="required" class="form-control input-sm duiqi" id="managerId3" name="managerId" }>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="manPassword3" class="col-xs-3 control-label">管理员密码：</label>
                                <div class="col-xs-6 ">
                                    <input type="password" required="required" class="form-control input-sm duiqi" id="manPassword3" name="manPassword" placeholder="">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="manName3" required="required" class="col-xs-3 control-label">管理员姓名：</label>
                                <div class="col-xs-6 ">
                                    <input type="" class="form-control input-sm duiqi" id="manName3" name="manName" placeholder="">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="manTelephone3" class="col-xs-3 control-label">管理员电话：</label>
                                <div class="col-xs-6 ">
                                    <input type="" class="form-control input-sm duiqi" id="manTelephone3" name="manTelephone" placeholder="">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="manEmail3" class="col-xs-3 control-label">管理员邮箱：</label>
                                <div class="col-xs-6 ">
                                    <input type="" class="form-control input-sm duiqi" id="manEmail3" name="manEmail" placeholder="">
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
<script src="${pageContext.request.contextPath}/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/chartist/js/chartist.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/scripts/common.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/moment-with-locales.min.js"></script>
<script>
    // 编辑对话框
    $('#changeChar').on('show.bs.modal',function(event){
        var source = event.relatedTarget;
        var $tr = $(source).closest('tr');
        var managerId = $tr.attr('data-managerId');
        var manName = $tr.attr('data-manName');
        var manTelephone = $tr.attr('data-manTelephone');
        var manEmail = $tr.attr('data-manEmail');
        var manPassword = $tr.attr('data-manPassword');

        $(':input[name="managerId"]','#changeChar').val(managerId);
        $(':input[name="manName"]','#changeChar').val(manName);
        $(':input[name="manTelephone"]','#changeChar').val(manTelephone);
        $(':input[name="manEmail"]','#changeChar').val([manEmail]);
        $(':input[name="manPassword"]','#changeChar').val([manPassword]);


    });


    $('#deleteChar').on('show.bs.modal',function(event){
        var source = event.relatedTarget;
        var $tr = $(source).closest('tr');
        var managerId = $tr.attr('data-managerId');
        $(':input[name="managerId"]','#deleteChar').val(managerId);
    });

</script>
</body>

</html>
