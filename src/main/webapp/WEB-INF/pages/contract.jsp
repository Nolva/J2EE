<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <title>合同管理</title>
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
                    <li><a href="/employee/show" class=""><i class="lnr lnr-phone"></i> <span>员工管理</span></a></li>
                    <li><a href="/product/products" class=""><i class="lnr lnr-gift"></i> <span>产品管理</span></a></li>
                    <li><a href="/contract/contracts" class="active"><i class="lnr lnr-book"></i> <span>合同管理</span></a></li>
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
                        <h3 class="panel-title">合同管理</h3>
                    </div>
                    <div class="panel-body">
                        <button class="btn btn-info btn-xs" data-toggle="modal" data-target="#addChar">添加合同</button>
                        <table class="table" style="table-layout:fixed" >
                            <thead>
                            <tr>
                                <th>合同ID</th>
                                <th>客户姓名</th>
                                <th>销售员姓名</th>
                                <th>合同名称</th>
                                <th>合同内容</th>
                                <th>合同产品</th>
                                <th>合同开始日期</th>
                                <th>合同失效日期</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${contractList}" var="contract" varStatus="vs">
                                <%--<s:property value="#vs.index+1"/><br>--%>
                                <tr role="row" data-contractId="${contract.contractId}"
                                    <%--data-cliName="${contract.cliName}"--%> data-clientNo="${contract.clientNo}"
                                    data-employeeId="${contract.employeeId}" data-contractName="${contract.contractName}"
                                    data-contractContent="${contract.contractContent}" data-contractProduct="${contract.contractProduct}"
                                    data-contractStartTime="${contract.contractStartTime}" data-contractValidity="${contract.contractValidity}">
                                    <td>${contract.contractId}</td>
                                    <td>${contract.clientNo}</td>
                                    <td>${contract.employeeId}</td>
                                    <td>${contract.contractName}</td>
                                    <td style="overflow:hidden;white-space:nowrap;
                                    text-overflow:ellipsis;">${contract.contractContent}</td>
                                    <td>${contract.contractProduct}</td>
                                    <td>${contract.contractStartTime}</td>
                                    <td>${contract.contractValidity}</td>
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
                                            <a href="${pageContext.request.contextPath}/contract/contracts?page=1">首页</a>
                                            <a href="${pageContext.request.contextPath}/contract/contracts?page=${currentPage-1}">上一页</a>
                                        </c:if>
                                        <c:if test="${currentPage!=totalPage}">
                                            <a href="${pageContext.request.contextPath }/contract/contracts?page=${currentPage+1}">下一页</a>
                                            <a href="${pageContext.request.contextPath }/contract/contracts?page=${totalPage}">尾页</a>
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
                        <form class="form-horizontal" action="/contract/updateContract" method="post">
                            <div class="form-group " style="display:none;">
                                <label for="contractId" class="col-xs-3 control-label">合同Id：</label>
                                <div class="col-xs-6 ">
                                    <input type="" class="form-control input-sm duiqi" id="contractId" name="contractId" }>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label  class="col-xs-3 control-label">客户姓名：</label>
                                    <div class="col-xs-6 ">
                                        <select class="form-control input-sm duiqi selectpicker" name="clientNo" >
                                           <c:forEach items="${clientList}" var="client">
                                               <option value="${client.cliName}（${client.clientId}）">${client.cliName}（${client.clientId}）</option>
                                           </c:forEach>
                                        </select>
                                    </div>
                            </div>
                            <div class="form-group ">
                                <label  class="col-xs-3 control-label">销售员姓名：</label>
                                <div class="col-xs-6 ">
                                    <select class="form-control input-sm duiqi selectpicker" name="employeeId" >
                                        <c:forEach items="${sellerList}" var="seller">
                                            <option value="${seller.empName}（${seller.employeeId}）">${seller.empName}（${seller.employeeId}）</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="contractName" class="col-xs-3 control-label">合同名称：</label>
                                <div class="col-xs-6 ">
                                    <input type="" required="required" class="form-control input-sm duiqi" id="contractName" name="contractName" placeholder="">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="contractContent" class="col-xs-3 control-label">合同内容：</label>
                                <div class="col-xs-6 ">
                                    <textarea   required="required" class="form-control input-sm duiqi"
                                                rows="3"
                                                id="contractContent" name="contractContent" placeholder="">
                                    </textarea>
                                </div>
                            </div>

                            <div class="form-group ">
                                <label  class="col-xs-3 control-label">合同产品：</label>
                                <div class="col-xs-6 ">
                                    <select required="required" class="form-control input-sm duiqi selectpicker" multiple name="contractProduct" >
                                        <c:forEach items="${productList}" var="product">
                                            <option name="${product.productModel}${product.productName}"
                                                    value="${product.productModel}${product.productName},${product.productId}">${product.productModel}${product.productName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-xs-3  control-label">合同开始日期：</label>
                                <div class=" col-xs-6">
                                    <div id="datetimepicker1" class="input-group date" >
                                        <input type='text' required="required" class="form-control input-sm duiqi" name="contractStartTime"/>
                                        <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-xs-3  control-label">合同失效日期：</label>
                                <div class=" col-xs-6">
                                    <div id="datetimepicker2" class="input-group date" >
                                        <input type='text' required="required" class="form-control nput-sm duiqi" name="contractValidity"/>
                                        <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
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
                        <form class="form-horizontal" action="/contract/deleteContract" method="post">
                            <div class="form-group " style="display:none;">
                                <label for="contractId2" class="col-xs-3 control-label">合同Id：</label>
                                <div class="col-xs-6 ">
                                    <input type="" class="form-control input-sm duiqi" id="contractId2" name="contractId" >
                                </div>
                            </div>
                            <div class="form-group " >
                                确定要删除该合同？删除后不可恢复！
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


    <!--添加窗口-->
    <div class="modal fade" id="addChar" role="dialog" aria-hidden="true" aria-labelledby="gridSystemModalLabel3">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel3">添加合同</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <form class="form-horizontal" action="/contract/addContract" method="post">
                            <div class="form-group " >
                                <label for="contractId3" class="col-xs-3 control-label">合同Id：</label>
                                <div class="col-xs-6 ">
                                    <input type="" required="required" class="form-control input-sm duiqi" id="contractId3" name="contractId" }>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label  class="col-xs-3 control-label">客户姓名：</label>
                                <div class="col-xs-6 ">
                                    <select class="form-control input-sm duiqi selectpicker" name="clientNo" >
                                        <c:forEach items="${clientList}" var="client">
                                            <option value="${client.cliName}（${client.clientId}）">${client.cliName}（${client.clientId}）</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label  class="col-xs-3 control-label">销售员姓名：</label>
                                <div class="col-xs-6 ">
                                    <select class="form-control input-sm duiqi selectpicker" name="employeeId" >
                                        <c:forEach items="${sellerList}" var="seller">
                                            <option  value="${seller.empName}（${seller.employeeId}）">${seller.empName}（${seller.employeeId}）</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="contractName3" class="col-xs-3 control-label">合同名称：</label>
                                <div class="col-xs-6 ">
                                    <input type="" required="required" class="form-control input-sm duiqi" id="contractName3" name="contractName" placeholder="">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="contractContent3" class="col-xs-3 control-label">合同内容：</label>
                                <div class="col-xs-6 ">
                                    <input type="text" required="required" class="form-control input-sm duiqi" id="contractContent3" name="contractContent" placeholder="">
                                </div>
                            </div>

                            <div class="form-group ">
                                <label  class="col-xs-3 control-label">合同产品：</label>
                                <div class="col-xs-6 ">
                                    <select required="required" class="form-control input-sm duiqi selectpicker" multiple name="contractProduct" >
                                        <c:forEach items="${productList}" var="product">
                                            <option name="${product.productModel}${product.productName}"
                                                    value="${product.productModel}${product.productName},${product.productId}">${product.productModel}${product.productName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-xs-3  control-label">合同开始日期：</label>
                                <div class=" col-xs-6">
                                    <div id="datetimepicker3" class="input-group date" >
                                        <input type='text' required="required" class="form-control input-sm duiqi" name="contractStartTime"/>
                                        <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-xs-3  control-label">合同失效日期：</label>
                                <div class=" col-xs-6">
                                    <div id="datetimepicker4" class="input-group date" >
                                        <input type='text' required="required" class="form-control input-sm duiqi" name="contractValidity"/>
                                        <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
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
<script>
    // 编辑对话框
    $('#changeChar').on('show.bs.modal',function(event){
        var source = event.relatedTarget;
        var $tr = $(source).closest('tr');
        var contractId = $tr.attr('data-contractId');
        var clientNo = $tr.attr('data-clientNo');
        var employeeId = $tr.attr('data-employeeId');
        var contractName = $tr.attr('data-contractName');
        var contractContent = $tr.attr('data-contractContent');
        var contractProduct = $tr.attr('data-contractProduct');
        var contractStartTime = $tr.attr('data-contractStartTime');
        var contractValidity = $tr.attr('data-contractValidity');

        $(':input[name="contractId"]','#changeChar').val(contractId);
        //document.getElementById('clientNo').value=clientNo;
        //$(':input[name="clientNo"]','#changeChar').val(clientNo);
        //$(':input[name="employeeId"]','#changeChar').val(employeeId);
        $(':input[name="contractName"]','#changeChar').val([contractName]);
        $(':input[name="contractContent"]','#changeChar').val([contractContent]);
        $(':input[name="contractStartTime"]','#changeChar').val([contractStartTime]);
        $(':input[name="contractValidity"]','#changeChar').val([contractValidity]);


        $('select[name="contractProduct"]>option','#changeChar').each(function() {
                $(this).attr("selected",false);
        });

        //分割产品
        var contractProductList = contractProduct.split(",");
        for (var i = 0; i < contractProductList.length; i++){
            $('select option[name="'+contractProductList[i]+'"]','#changeChar').prop("selected",true);
        }
        //进行select刷新
        $('select[name="contractProduct"]','#changeChar').selectpicker('render');
        $('select[name="contractProduct"]','#changeChar').selectpicker('refresh');


        $('select[name="clientNo"] option[value="'+clientNo+'"]','#changeChar').prop("selected",true);
        //进行select刷新
        $('select[name="clientNo"]','#changeChar').selectpicker('render');
        $('select[name="clientNo"]','#changeChar').selectpicker('refresh');

        $('select[name="employeeId"] option[value="'+employeeId+'"]','#changeChar').prop("selected",true);
        //进行select刷新
        $('select[name="employeeId"]','#changeChar').selectpicker('render');
        $('select[name="employeeId"]','#changeChar').selectpicker('refresh');

        var picker1 = $('#datetimepicker1').datetimepicker({
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

        var picker2 = $('#datetimepicker2').datetimepicker({
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
            $('#datetimepicker2').datetimepicker('setStartDate',e.date);
        });
        //动态设置最大值
        picker2.on('changeDate', function (e) {
            $('#datetimepicker1').datetimepicker('setEndDate',e.date);
        });

    });


    $('#addChar').on('show.bs.modal',function(event){
        var picker3 = $('#datetimepicker3').datetimepicker({
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

        var picker4 = $('#datetimepicker4').datetimepicker({
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
        picker3.on('changeDate', function (e) {
            $('#datetimepicker4').datetimepicker('setStartDate',e.date);
        });
        //动态设置最大值
        picker4.on('changeDate', function (e) {
            $('#datetimepicker3').datetimepicker('setEndDate',e.date);
        });
    });

    $('#deleteChar').on('show.bs.modal',function(event){
        var source = event.relatedTarget;
        var $tr = $(source).closest('tr');
        var contractId = $tr.attr('data-contractId');
        $(':input[name="contractId"]','#deleteChar').val(contractId);
    });
</script>
</body>

</html>
