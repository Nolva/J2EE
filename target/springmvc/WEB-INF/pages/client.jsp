<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <title>客户管理</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css">
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
                    <li><a href="/client/show" class="active"><i class="lnr lnr-user"></i> <span>客户管理</span></a></li>
                    <li><a href="/employee/show" class=""><i class="lnr lnr-phone"></i> <span>员工管理</span></a></li>
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
                        <h3 class="panel-title">客户管理</h3>
                    </div>
                    <div class="panel-body">
                        <button class="btn btn-info btn-xs" data-toggle="modal" data-target="#addChar">添加客户</button>
                        <table class="table">
                            <thead>
                            <tr>
                                <th>客户ID</th>
                                <th>客户姓名</th>
                                <th>客户电话</th>
                                <th>客户邮箱</th>
                                <th>客户地址</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${customerList}" var="customer" varStatus="vs">
                                <%--<s:property value="#vs.index+1"/><br>--%>
                                <tr role="row" data-clientId="${customer.clientId}" data-cliName="${customer.cliName}"
                                    data-cliTelephone="${customer.cliTelephone}" data-cliEmail="${customer.cliEmail}"
                                    data-cliAddress="${customer.cliAddress}">
                                    <td>${customer.clientId}</td>
                                    <td>${customer.cliName}</td>
                                    <td>${customer.cliTelephone}</td>
                                    <td>${customer.cliEmail}</td>
                                    <td>${customer.cliAddress}</td>
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
                                            <a href="${pageContext.request.contextPath}/client/show?page=1">首页</a>
                                            <a href="${pageContext.request.contextPath}/client/show?page=${currentPage-1}">上一页</a>
                                        </c:if>
                                        <c:if test="${currentPage!=totalPage}">
                                            <a href="${pageContext.request.contextPath }/client/show?page=${currentPage+1}">下一页</a>
                                            <a href="${pageContext.request.contextPath }/client/show?page=${totalPage}">尾页</a>
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
    <!--修改权限弹出窗口-->
    <div class="modal fade" id="changeChar" role="dialog" aria-labelledby="gridSystemModalLabel1">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel1">修改客户信息</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <form class="form-horizontal" action="/client/change" method="post">
                            <div class="form-group ">
                                <label for="clientId" class="col-xs-3 control-label">客户ID：</label>
                                <div class="col-xs-6 ">
                                    <input type="" class="form-control input-sm duiqi" id="clientId" name="clientId" placeholder="">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="cliName" class="col-xs-3 control-label">客户姓名：</label>
                                <div class="col-xs-6 ">
                                    <input type="" class="form-control input-sm duiqi" id="cliName" name="cliName" placeholder="">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="cliTelephone" class="col-xs-3 control-label">客户电话：</label>
                                <div class="col-xs-6 ">
                                    <input type="" class="form-control input-sm duiqi" id="cliTelephone" name="cliTelephone" placeholder="">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="cliEmail" class="col-xs-3 control-label">客户邮箱：</label>
                                <div class="col-xs-6 ">
                                    <input type="" class="form-control input-sm duiqi" id="cliEmail" name="cliEmail" placeholder="">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="cliAddress" class="col-xs-3 control-label">客户地址：</label>
                                <div class="col-xs-6 ">
                                    <input type="" class="form-control input-sm duiqi" id="cliAddress" name="cliAddress" placeholder="">
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
                        <form class="form-horizontal" action="/client/delete" method="post">
                            <div class="form-group " style="display:none;">
                                <label for="clientId2" class="col-xs-3 control-label">客户Id：</label>
                                <div class="col-xs-6 ">
                                    <input type="" class="form-control input-sm duiqi" id="clientId2" name="clientId" >
                                </div>
                            </div>
                            <div class="form-group " >
                                确定要删除该客户？删除后不可恢复！
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

    <!--添加客户弹出窗口-->
    <div class="modal fade" id="addChar" role="dialog" aria-hidden="true" aria-labelledby="gridSystemModalLabel3">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel3">添加客户</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <form class="form-horizontal" action="/client/add" method="post">
                            <div class="form-group " >
                                <label for="clientId3" class="col-xs-3 control-label">客户Id：</label>
                                <div class="col-xs-6 ">
                                    <input type="" required="required" class="form-control input-sm duiqi" id="clientId3" name="clientId" }>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="cliName3" required="required" class="col-xs-3 control-label">客户姓名：</label>
                                <div class="col-xs-6 ">
                                    <input type="" class="form-control input-sm duiqi" id="cliName3" name="cliName" placeholder="">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="cliTelephone3" class="col-xs-3 control-label">客户电话：</label>
                                <div class="col-xs-6 ">
                                    <input type="" class="form-control input-sm duiqi" id="cliTelephone3" name="cliTelephone" placeholder="">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="cliEmail3" class="col-xs-3 control-label">客户邮箱：</label>
                                <div class="col-xs-6 ">
                                    <input type="" class="form-control input-sm duiqi" id="cliEmail3" name="cliEmail" placeholder="">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="cliAddress3" class="col-xs-3 control-label">客户地址：</label>
                                <div class="col-xs-6 ">
                                    <input type="" class="form-control input-sm duiqi" id="cliAddress3" name="cliAddress" placeholder="">
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
<script src="${pageContext.request.contextPath}/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/chartist/js/chartist.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/scripts/common.js"></script>
<script>
    // 编辑对话框
    $('#changeChar').on('show.bs.modal',function(event){
        var source = event.relatedTarget;
        var $tr = $(source).closest('tr');
        var clientId = $tr.attr('data-clientId');
        var cliName = $tr.attr('data-cliName');
        var cliTelephone = $tr.attr('data-cliTelephone');
        var cliEmail = $tr.attr('data-cliEmail');
        var cliAddress = $tr.attr('data-cliAddress');
        $(':input[name="clientId"]','#changeChar').val(clientId);
        $(':input[name="cliName"]','#changeChar').val(cliName);
        $(':input[name="cliTelephone"]','#changeChar').val(cliTelephone);
        $(':input[name="cliEmail"]','#changeChar').val([cliEmail]);
        $(':input[name="cliAddress"]','#changeChar').val([cliAddress]);
    });
    $('#addChar').on('show.bs.modal',function(event){
        var clientId = <%=request.getParameter("clientId")%>;
        var cliName = <%=request.getParameter("cliName")%>;
        var cliTelephone = <%=request.getParameter("cliTelephone")%>;
        var cliEmail = <%=request.getParameter("cliEmail")%>;
        var cliAddress = <%=request.getParameter("cliAddress")%>;
        $(':input[name="clientId"]','#addChar').val(clientId);
        $(':input[name="cliName"]','#addChar').val(cliName);
        $(':input[name="cliTelephone"]','#addChar').val(cliTelephone);
        $(':input[name="cliEmail"]','#addChar').val([cliEmail]);
        $(':input[name="cliAddress"]','#addChar').val([cliAddress]);
    });
    $('#deleteChar').on('show.bs.modal',function(event){
        var source = event.relatedTarget;
        var $tr = $(source).closest('tr');
        var clientId = $tr.attr('data-clientId');
        console.log(clientId);
        $(':input[name="clientId"]','#deleteChar').val(clientId);
    });
</script>
</body>

</html>
