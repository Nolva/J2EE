<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <title>产品管理</title>
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
                    <li><a href="/client/show" class=""><i class="lnr lnr-user"></i> <span>客户管理</span></a></li>
                    <li><a href="/employee/show" class=""><i class="lnr lnr-phone"></i> <span>员工管理</span></a></li>
                    <li><a href="/product/products" class="active"><i class="lnr lnr-gift"></i> <span>产品管理</span></a></li>
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
                        <h3 class="panel-title">产品管理</h3>
                    </div>
                    <div class="panel-body">
                        <button class="btn btn-info btn-xs" data-toggle="modal" data-target="#addChar">添加产品</button>
                        <table class="table">
                            <thead>
                            <tr>
                                <th>产品编号</th>
                                <th>产品名称</th>
                                <th>产品型号</th>
                                <th>产品数量</th>
                                <th>产品价格</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${productList}" var="product" varStatus="vs">
                                <%--<s:property value="#vs.index+1"/><br>--%>
                                <tr role="row" data-productId="${product.productId}" data-productName="${product.productName}"
                                    data-productModel="${product.productModel}" data-productNum="${product.productNum}"
                                    data-productPrice="${product.productPrice}">
                                    <%--<td>${vs.index+1+(currentPage-1)*5}</td>--%>
                                    <td>${product.productId}</td>
                                    <td>${product.productName}</td>
                                    <td>${product.productModel}</td>
                                    <td>${product.productNum}</td>
                                    <td>${product.productPrice}</td>
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
                                            <a href="${pageContext.request.contextPath}/product/products?page=1">首页</a>
                                            <a href="${pageContext.request.contextPath}/product/products?page=${currentPage-1}">上一页</a>
                                        </c:if>
                                        <c:if test="${currentPage!=totalPage}">
                                            <a href="${pageContext.request.contextPath }/product/products?page=${currentPage+1}">下一页</a>
                                            <a href="${pageContext.request.contextPath }/product/products?page=${totalPage}">尾页</a>
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
                        <form class="form-horizontal" action="/product/updateProduct" method="post">
                            <div class="form-group " style="display:none;">
                                <label for="productId" class="col-xs-3 control-label">产品Id：</label>
                                <div class="col-xs-6 ">
                                    <input type="" required="required" class="form-control input-sm duiqi" id="productId" name="productId" }>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="productName" class="col-xs-3 control-label">产品名称：</label>
                                <div class="col-xs-6 ">
                                    <input type="" required="required" class="form-control input-sm duiqi" id="productName" name="productName" placeholder="">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="productModel" class="col-xs-3 control-label">产品型号：</label>
                                <div class="col-xs-6 ">
                                    <input type="" required="required" class="form-control input-sm duiqi" id="productModel" name="productModel" placeholder="">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="productNum" class="col-xs-3 control-label">产品数量：</label>
                                <div class="col-xs-6 ">
                                    <input type="" required="required" class="form-control input-sm duiqi" id="productNum" name="productNum" placeholder="">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="productPrice" class="col-xs-3 control-label">产品价格：</label>
                                <div class="col-xs-6 ">
                                    <input type="" required="required" class="form-control input-sm duiqi" id="productPrice" name="productPrice" placeholder="">
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
                        <form class="form-horizontal" action="/product/deleteProduct" method="post">
                            <div class="form-group " style="display:none;">
                                <label for="productId2" class="col-xs-3 control-label">产品Id：</label>
                                <div class="col-xs-6 ">
                                    <input type="" class="form-control input-sm duiqi" id="productId2" name="productId" >
                                </div>
                            </div>
                            <div class="form-group " >
                                确定要删除该产品？删除后不可恢复！
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

    <%--添加弹出窗口--%>
    <div class="modal fade" id="addChar" role="dialog" aria-hidden="true" aria-labelledby="gridSystemModalLabel3">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel3">添加产品</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <form class="form-horizontal" action="/product/addProduct" method="post">
                            <div class="form-group " >
                                <label for="productId3" class="col-xs-3 control-label">产品Id：</label>
                                <div class="col-xs-6 ">
                                    <input type="" required="required" class="form-control input-sm duiqi" id="productId3" name="productId" }>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="productName3" class="col-xs-3 control-label">产品名称：</label>
                                <div class="col-xs-6 ">
                                    <input type="" required="required" class="form-control input-sm duiqi" id="productName3" name="productName" placeholder="">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="productModel3"  class="col-xs-3 control-label">产品型号：</label>
                                <div class="col-xs-6 ">
                                    <input type="" required="required" class="form-control input-sm duiqi" id="productModel3" name="productModel" placeholder="">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="productNum3"  class="col-xs-3 control-label">产品数量：</label>
                                <div class="col-xs-6 ">
                                    <input type="" required="required" class="form-control input-sm duiqi" id="productNum3" name="productNum" placeholder="">
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="productPrice3"  class="col-xs-3 control-label">产品价格：</label>
                                <div class="col-xs-6 ">
                                    <input type="" required="required" class="form-control input-sm duiqi" id="productPrice3" name="productPrice" placeholder="">
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
        var productId = $tr.attr('data-productId');
        var productName = $tr.attr('data-productName');
        var productModel = $tr.attr('data-productModel');
        var productNum = $tr.attr('data-productNum');
        var productPrice = $tr.attr('data-productPrice');
        $(':input[name="productId"]','#changeChar').val(productId);
        $(':input[name="productName"]','#changeChar').val(productName);
        $(':input[name="productModel"]','#changeChar').val(productModel);
        $(':input[name="productNum"]','#changeChar').val([productNum]);
        $(':input[name="productPrice"]','#changeChar').val([productPrice]);

    });

    $('#deleteChar').on('show.bs.modal',function(event){
        var source = event.relatedTarget;
        var $tr = $(source).closest('tr');
        var productId = $tr.attr('data-productId');
        $(':input[name="productId"]','#deleteChar').val(productId);
    });

</script>
</body>

</html>
