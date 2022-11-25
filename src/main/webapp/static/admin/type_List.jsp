<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>天天有生鲜-商品列表</title>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CssView/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CssView/main.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/slide.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/urlsqit.js"></script>
    <script src="${pageContext.request.contextPath}/resource/user/js/jquery-1.8.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/resource/user/js/jquery.luara.0.0.1.min.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resource/user/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
    <link href="${pageContext.request.contextPath}/css/layer.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/layer.js"></script>

    <style>
        .button {
            display: inline-block;
            zoom: 1; /* zoom and *display = ie7 hack for display:inline-block */
            *display: inline;
            vertical-align: baseline;
            margin: 0 2px;
            outline: none;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            font: 14px/100% Arial, Helvetica, sans-serif;
            padding: .5em 2em .55em;
            text-shadow: 0 1px 1px rgba(0,0,0,.3);
            -webkit-border-radius: .5em;
            -moz-border-radius: .5em;
            border-radius: .5em;
            -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);
            -moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);
            box-shadow: 0 1px 2px rgba(0,0,0,.2);
        }
        .button:hover {
            text-decoration: none;
        }
        .button:active {
            position: relative;
            top: 1px;
        }

        .bigrounded {
            -webkit-border-radius: 2em;
            -moz-border-radius: 2em;
            border-radius: 2em;
        }
        .medium {
            font-size: 12px;
            padding: .4em 1.5em .42em;
        }
        .small {
            font-size: 11px;
            padding: .2em 1em .275em;
        }

        /* orange */
        .orange {
            color: #fef4e9;
            border: solid 1px #da7c0c;
            background: #f78d1d;
            background: -webkit-gradient(linear, left top, left bottom, from(#faa51a), to(#f47a20));
            background: -moz-linear-gradient(top,  #faa51a,  #f47a20);
            filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#faa51a', endColorstr='#f47a20');
        }
        .orange:hover {
            background: #f47c20;
            background: -webkit-gradient(linear, left top, left bottom, from(#f88e11), to(#f06015));
            background: -moz-linear-gradient(top,  #f88e11,  #f06015);
            filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#f88e11', endColorstr='#f06015');
        }
        .orange:active {
            color: #fcd3a5;
            background: -webkit-gradient(linear, left top, left bottom, from(#f47a20), to(#faa51a));
            background: -moz-linear-gradient(top,  #f47a20,  #faa51a);
            filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#f47a20', endColorstr='#faa51a');
        }

        /* red */
        .red {
            color: #faddde;
            border: solid 1px #980c10;
            background: #d81b21;
            background: -webkit-gradient(linear, left top, left bottom, from(#ed1c24), to(#aa1317));
            background: -moz-linear-gradient(top,  #ed1c24,  #aa1317);
            filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#ed1c24', endColorstr='#aa1317');
        }
        .red:hover {
            background: #b61318;
            background: -webkit-gradient(linear, left top, left bottom, from(#c9151b), to(#a11115));
            background: -moz-linear-gradient(top,  #c9151b,  #a11115);
            filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#c9151b', endColorstr='#a11115');
        }
        .red:active {
            color: #de898c;
            background: -webkit-gradient(linear, left top, left bottom, from(#aa1317), to(#ed1c24));
            background: -moz-linear-gradient(top,  #aa1317,  #ed1c24);
            filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#aa1317', endColorstr='#ed1c24');
        }


    </style>
    <script type="text/javascript">
        function carAdd(userId,pId,pPrice){
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/car/carAdd.action?userId="+userId+"&productId="+pId+"&price="+pPrice+"&num=1",
                type:'post',
                dataType:'json',
                success:function (result) {
                    var re = result;
                    if(re.res == 1){
                        alert("请登录");
                        window.location.href="${pageContext.request.contextPath}/user/userLoginView.action";
                    } else {
                        window.location.href="${pageContext.request.contextPath}/user/userCarView.action";
                    }
                }
            });
        }
    </script>
</head>
<body>
<div class="header_con">
    <div class="header">
        <div class="welcome fl">欢迎来到天天有生鲜!</div>
        <div class="fr">
            <div class="user_link fl">
                <c:if test="${userId!=null}">
                    <a href="${pageContext.request.contextPath}/user/userCenterView.action?id=${userId}">欢迎您：${UserName}</a>
                    <span>|</span>
                    <a href="${pageContext.request.contextPath}/user/userCarView.action?id=${userId}">我的购物车</a>
                    <span>|</span>
                    <a href="${pageContext.request.contextPath}/user/userOrderView.action?id=${userId}">我的订单</a>
                    <span>|</span>
                    <a href="${pageContext.request.contextPath}/user/logout.action">退出</a>
                    <span>|</span>
                </c:if>
                <c:if test="${userId==null}">
                    <a href="${pageContext.request.contextPath}/user/userLoginView.action">登录</a>
                    <span>|</span>
                    <a href="${pageContext.request.contextPath}/user/registerView.action">注册</a>
                    <span>|</span>
                </c:if>
                <a href="${pageContext.request.contextPath}/user/userCenterView.action?id=${userId}">用户中心</a>
            </div>
        </div>
    </div>
</div>

<div class="search_bar clearfix">
    <a href="${pageContext.request.contextPath}/user/userMain.action" class="logo fl"><img src="${pageContext.request.contextPath}/image_big/logo01.png" style="width: 140px"></a>

</div>

<div class="navbar_con">
    <div class="navbar clearfix">
        <div class="subnav_con fl">
            <h1>全部商品分类</h1>
            <span></span>
            <ul class="subnav">
                <li><a href="#" class="fruit">新鲜水果</a></li>
                <li><a href="#" class="seafood">海鲜水产</a></li>
                <li><a href="#" class="meet">猪牛羊肉</a></li>
                <li><a href="#" class="egg">禽类蛋品</a></li>
                <li><a href="#" class="vegetables">新鲜蔬菜</a></li>
                <li><a href="#" class="ice">速冻食品</a></li>
            </ul>
        </div>
    </div>
</div>



<div class="breadcrumb" >
    <a href="index.jsp">全部产品</a>
    <span>></span>
    <a href="javascript:;">产品种类</a>
</div>

<div class="main_wrap clearfix">
    <div class="l_wrap fl clearfix">
        <div class="new_goods">
            <h3>随机推荐</h3>
            <ul id="suiji">

            </ul>
        </div>
    </div>

    <div class="r_wrap fr clearfix">
        <div class="sort_bar">

        </div>

        <!--热门商品-->
        <div class="width1200 center_yh hidden_yh">
            <div class="width100" style="height: 45px;line-height: 45px;border-bottom: 2px solid #dd4545; margin-top: 20px;">
                <font class="left_yh font20">热门商品</font>
            </div>
            <div class="width100 hidden_yh" style="height: 500px;">
                <div class="normalPic">
                    <ul class="listSs">
                        <c:forEach items="${pageInfos.list}" var="p" varStatus="l">
                            <li style="width:222px;height:300px;float:left;margin-right:20px;border:1px solid #ddd;position:relative;margin-bottom:30px;">
                                <a href="${pageContext.request.contextPath}/user/detailView.action?pId=${p.pId}" style="height: 150px">
                                    <img width="120px" height="125px" style="margin:0 auto"
                                         src="${pageContext.request.contextPath}/image_big/${p.pImage}">
                                </a>
                                <h3 class="yihang c_33 font14 font100" style="padding-left: 10px;padding-right: 10px;">商品名：${p.pName}</h3>
                                <h3 class="yihang c_33 font14 font100" style="padding-left: 10px;padding-right: 10px;">商品描述：${p.pContent}</h3>
                                <p  class="center_yh block_yh hidden_yh" style="width: 202px;"><font class="left_yh red font16">￥${p.pPrice}</font></p>
                                <div class="wCa" style="width:100%;height:30px;border-top:1px solid #ddd;position:absolute;bottom:0;left:0;overflow:hidden;">
                                    <button class="button red" onclick="scAdd('${userId}','${p.pId}')">收藏</button>
                                    <span>|</span>
                                    <button class="button orange" style="padding-right: 18px;padding-left: 18px" onclick="carAdd('${userId}','${p.pId}','${p.pPrice}',)">加入购物车</button>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>

        <ul class="pagination">
            <li><a
                    href="${pageContext.request.contextPath}/user/productInfo_type_list.action?typeId=${typeId}&page=1&size=5"
                    aria-label="Previous">首页</a></li>
            <li><a
                    href="${pageContext.request.contextPath}/user/productInfo_type_list.action?typeId=${typeId}&page=${pageInfos.pageNum-1}&size=5">上一页</a></li>
            <c:forEach begin="1" end="${pageInfos.pages}" var="pageNumber">
                <li><a
                        href="${pageContext.request.contextPath}/user/productInfo_type_list.action?typeId=${typeId}&page=${pageNumber}&size=5">${pageNumber}</a></li>
            </c:forEach>
            <li><a
                    href="${pageContext.request.contextPath}/user/productInfo_type_list.action?typeId=${typeId}&page=${pageInfos.pageNum+1}&size=5">下一页</a></li>
            <li><a
                    href="${pageContext.request.contextPath}/user/productInfo_type_list.action?typeId=${typeId}&page=${pageInfos.pages}&size=5"
                    aria-label="Next">尾页</a></li>
        </ul>


        <ul class="goods_type_list clearfix" id="list_li">



        </ul>

    </div>
</div>
<div class="footer">
    <p>CopyRight © 2016 北京天天有生鲜信息技术有限公司 All Rights Reserved</p>
    <p>电话：010-****888    京ICP备*******8号</p>
</div>




</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/goodsList.js"></script>


</html>