<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script type="text/javascript">
        if ("${msg}" != "") {
            alert("${msg}");
        }
    </script>
    <c:remove var="msg"></c:remove>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bright.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/addBook.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <title></title>
</head>
<script type="text/javascript">
    function allClick() {
        //取得全选复选框的选中未选 中状态
        var ischeck=$("#all").prop("checked");
        //将此状态赋值给每个商品列表里的复选框
        $("input[name=ck]").each(function () {
            this.checked=ischeck;
        });
    }

    function ckClick() {
        //取得所有name=ck的被选中的复选框
        var length=$("input[name=ck]:checked").length;
//取得所有name=ck的复选框
        var len=$("input[name=ck]").length;
        //比较
        if(len == length){
            $("#all").prop("checked",true);
        }else
        {
            $("#all").prop("checked",false);
        }
    }
</script>
<body>
<div id="brall">
    <div id="nav">
        <p>订单管理>订单列表</p>
    </div>
    <div id="condition" style="text-align: center">
        <form id="myform">
            订单号：<input name="code" id="code">&nbsp;&nbsp;&nbsp;
            <input type="button" value="查询" onclick="ajaxsplit(${pb.pageNum})">
        </form>
    </div>
    <br>
    <div id="table">
        <c:choose>
            <c:when test="${pb.list.size()!=0}">
                <div id="top">
                    <input type="checkbox" id="all" onclick="allClick()" style="margin-left: 50px">&nbsp;&nbsp;全选
                    <a href="${pageContext.request.contextPath}/admin/addproductType.jsp">
                        <input type="button" class="btn btn-warning" id="btn1"
                               value="新增订单">
                    </a>
                    <input type="button" class="btn btn-warning" id="btn1"
                           value="批量删除" onclick="deleteBatch(${pb.pageNum})">
                </div>
                <!--显示分页后的商品-->
                <div id="middle">
                    <table class="table table-bordered table-striped">
                        <tr>
                            <th></th>
                            <th>订单号</th>
                            <th>下单时间</th>
                            <th>总金额</th>
                            <th>下单人</th>
                            <th>订单状态</th>
                            <th>操作</th>
                        </tr>
                        <c:forEach items="${pb.list}" var="data">
                            <tr>
                                <td valign="center" align="center"><input type="checkbox" name="ck" id="ck" value="${data.id}" onclick="ckClick()"></td>
                                <td>${data.code}</td>
                                <td><fmt:formatDate value="${data.addtime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                <td>${data.total}</td>
                                <td>${data.userName}</td>
                                <td style="color: red">
                                    <c:if test="${data.status == 0}">待发货</c:if>
                                    <c:if test="${data.status == 1}">已取消</c:if>
                                    <c:if test="${data.status == 2}">待收货</c:if>
                                    <c:if test="${data.status == 3}">已收货</c:if>
                                </td>
                                <td>
                                    <c:if test="${data.status == 1}">
                                        <a class="button border-red" href="${pageContext.request.contextPath}/order/delete.action?id=${data.id}"><span class="icon-trash-o">删除订单(取消订单)</span> </a>
                                    </c:if>
                                    <c:if test="${data.status == 3}">
                                        <a class="button border-red" href="${pageContext.request.contextPath}/order/delete.action?id=${data.id}"><span class="icon-trash-o">删除订单(已收货)</span> </a>
                                    </c:if>
                                    <c:if test="${data.status == 0}">
                                        <a class="button border-red" href="${pageContext.request.contextPath}/order/fh.action?id=${data.id}"><span class="icon-trash-o">去发货</span> </a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    <!--分页栏-->
                    <div id="bottom">
                        <div>
                            <nav aria-label="..." style="text-align:center;">
                                <ul class="pagination">
                                    <li>
                                            <%--                                        <a href="${pageContext.request.contextPath}/prod/split.action?page=${pb.prePage}" aria-label="Previous">--%>
                                        <a href="javascript:ajaxsplit(${pb.prePage})" aria-label="Previous">

                                            <span aria-hidden="true">«</span></a>
                                    </li>
                                    <c:forEach begin="1" end="${pb.pages}" var="i">
                                        <c:if test="${pb.pageNum==i}">
                                            <li>
                                                    <%--                                                <a href="${pageContext.request.contextPath}/prod/split.action?page=${i}" style="background-color: grey">${i}</a>--%>
                                                <a href="javascript:ajaxsplit(${i})"
                                                   style="background-color: grey">${i}</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${pb.pageNum!=i}">
                                            <li>
                                                    <%--                                                <a href="${pageContext.request.contextPath}/prod/split.action?page=${i}">${i}</a>--%>
                                                <a href="javascript:ajaxsplit(${i})">${i}</a>
                                            </li>
                                        </c:if>
                                    </c:forEach>
                                    <li>
                                            <%--  <a href="${pageContext.request.contextPath}/prod/split.action?page=1" aria-label="Next">--%>
                                        <a href="javascript:ajaxsplit(${pb.nextPage})" aria-label="Next">
                                            <span aria-hidden="true">»</span></a>
                                    </li>
                                    <li style=" margin-left:150px;color: #0e90d2;height: 35px; line-height: 35px;">总共&nbsp;&nbsp;&nbsp;<font
                                            style="color:orange;">${pb.pages}</font>&nbsp;&nbsp;&nbsp;页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <c:if test="${pb.pageNum!=0}">
                                            当前&nbsp;&nbsp;&nbsp;<font
                                            style="color:orange;">${pb.pageNum}</font>&nbsp;&nbsp;&nbsp;页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </c:if>
                                        <c:if test="${pb.pageNum==0}">
                                            当前&nbsp;&nbsp;&nbsp;<font
                                            style="color:orange;">1</font>&nbsp;&nbsp;&nbsp;页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </c:if>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div>
                    <h2 style="width:1200px; text-align: center;color: orangered;margin-top: 100px">暂时没有符合条件的商品！</h2>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<!--编辑的模式对话框-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">新增商品类别</h4>
            </div>
            <div class="modal-body" id="addTD">
                <form action="${pageContext.request.contextPath}/admin/product?flag=save" enctype="multipart/form-data"
                      method="post" id="myform">
                    <table>
                        <tr>
                            <td class="one">商品类型id</td>
                            <td><input type="text" name="typeid" class="two" class="form-control"></td>
                        </tr>
                        <!--错误提示-->
                        <tr class="three">
                            <td class="four"></td>
                            <td><span id="pnameerr"></span></td>
                        </tr>
                        <tr>
                            <td class="one">商品类型名</td>
                            <td><input type="text" name="typename" class="two" class="form-control"></td>
                        </tr>
                        <!--错误提示-->
                        <tr class="three">
                            <td class="four"></td>
                            <td><span id="pcontenterr"></span></td>
                        </tr>


                        <tr>
                            <td>
                                <input type="submit" class="btn btn-success" value="提交" class="btn btn-success">
                            </td>
                            <td>
                                <button type="button" class="btn btn-info" data-dismiss="modal">取消</button>
                            </td>
                        </tr>
                    </table>
                </form>

            </div>

        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal -->
</div>
</body>
<!--弹出新增模式对话框-->
<script type="text/javascript">
    $(function () {
        $(".btn-info").on("click", function () {
            //浏览不关，第二次打开时要清空
            $("#myModal").modal("hide");
        });
        //新增学生非空判断
        $(".btn-success").on("click", function () {
            $("#myModal").modal("hide");
        });
    });
</script>
<script type="text/javascript">
    function mysubmit() {
        $("#myform").submit();
    }

    //批量删除
    function deleteBatch(page) {
        if (confirm("确定删除吗")) {
            //取得所有被选中删除商品的pid
            var zhi=$("input[name=ck]:checked");
            var str="";
            var id="";
            if(zhi.length==0){
                alert("请选择将要删除的商品！");
            }else{
                // 有选中的商品，则取出每个选 中商品的ID，拼提交的ID的数据
                if(confirm("您确定删除"+zhi.length+"条商品吗？")){
                    //拼接ID
                    $.each(zhi,function () {
                        id=$(this).val();
                        if(id!=null)
                            str += id+",";
                    });


                    //取出查询条件
                    var typename=$("#typename").val();
                    var typeid=$("#typeid").val();
                    $.ajax({
                        url:"${pageContext.request.contextPath}/type/deleteBatch.action",
                        data: {
                            "typeids": str,
                            "page": page,
                            "typename": typename,
                            "typeid": typeid,
                        },
                        type:"post",
                        dataType:"json",
                        success:function (data) {
                            alert(data.msg);//弹删除是否成功
                            $("#table").load("http://localhost:8080/admin/productType.jsp #table")
                        }
                    });
                }
            }


        }
    }
    //单个删除
    function del(typeid,page) {
        if (confirm("确定删除吗")) {

            $.ajax({
                url:"${pageContext.request.contextPath}/type/delete.action",
                data:{
                    "typeId":typeid,
                },
                type:"post",
                dataType:"json",
                success:function (data) {
                    alert(data.msg);//弹删除是否成功
                    $("#table").load("http://localhost:8080/admin/productType.jsp #table")
                }
            });
        }
    }

    function one(typeid, ispage) {
        location.href = "${pageContext.request.contextPath}/type/one.action?typeid=" + typeid + "&page=" + ispage;
    }
</script>
<!--分页的AJAX实现-->
<script type="text/javascript">
    function ajaxsplit(page) {
        //取出查询条件
        var code=$("#code").val();
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/order/ajaxsplit.action",
            data: {
                "page": page,
                "code":code
            },
            success: function () {

                $("#table").load("http://localhost:8080/admin/productInfoOrder.jsp #table");
            },
            error: function (e) {
                alert(e.message);
            }
        });
    }
</script>

</html>