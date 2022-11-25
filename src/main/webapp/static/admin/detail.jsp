<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<title>天天有生鲜-商品详情</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CssView/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CssView/main.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resource/user/css/style.css">
	<script src="${pageContext.request.contextPath}/resource/user/js/jquery.luara.0.0.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/urlsqit.js"></script>
	<link href="${pageContext.request.contextPath}/css/layer.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/CssView/detail.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/layer.js"></script>

	<script type="text/javascript">
		function carAdd(userId,pId,pPrice){
				var num = $("#t_a").val();
				$.ajax({
					type:"POST",
					url:"${pageContext.request.contextPath}/car/carAdd.action?userId="+userId+"&productId="+pId+"&price="+pPrice+"&num="+num+"",
					dataType:'json',
					success:function (result) {
						var re = result;
						if(re.res == 1){
							alert("请登录");
							window.location.href="${pageContext.request.contextPath}/user/userLoginView.action";
						}else {
							window.location.href="${pageContext.request.contextPath}/user/userCarView.action?id=${userId}";
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
			<div class="subnav_con fl" style="float: right;width: 250px">
				<h1>商品介绍</h1>
				<span></span>
				<ul class="subnav" style="width: 250px;height: 100px">
					<li style="height: 100px"><a href="#" class="ice">${obj.pContent}</a></li>
				</ul>
			</div>
		</div>
	</div>


	<div class="breadcrumb">
		<a href="index.jsp">全部分类</a>
		<span>></span>
		<a href="javascript:;">商品详情</a>
	</div>

	<div class="goods_detail_con clearfix" id="goods">
		<div class="width1198 center_yh" style="height: 420px;">
			<div class="left_yh" style="width: 350px;height: 420px;">
				<input type="hidden" id="productId" value="${obj.pId}">
				<div id="preview">
					<div>
						<img src="${pageContext.request.contextPath}/image_big/${obj.pImage}" alt="" height="350" width="350">
					</div>
				</div>
			</div>
			<div class="left_yh" style="width: 486px;height: 420px;margin-left: 42px;">
				<h3 class="font20 font100">${obj.pName}</h3>
				<p class="font16 c_66" style="margin-top:25px;">
					<font style="margin-right: 20px;">价格：</font>
					<font class="red font20">
						￥${obj.pPrice}
					</font>
				</p>
				<p class="font16 c_66 likeColor" style="margin-top: 25px;">
					<font style="margin-right: 20px;">数量：</font>
					<a href="javascript:void(0)" id="min_s">-</a>
					<input type="text" value="1" readonly id="t_a">
					<a href="javascript:void(0)" id="add_s">+</a>
					<font class="font14 c_99" style="margin-left: 20px;">${obj.pNumber}</font>
					<script>
						var tr = $("#t_a").val();
						$("#min_s").click(function () {
							tr--;
							if(tr<1){
								$("#t_a").val(1);
								tr = 1;
							}else{
								$("#t_a").val(tr);
							}
						});
						$("#add_s").click(function () {
							tr++;
							$("#t_a").val(tr);
						});
					</script>
				</p>
				<div class="buyFor">
					<button class="button red" onclick="scAdd('${userId}','${obj.pId}')">收藏</button>
					<button class="button orange" onclick="carAdd('${userId}','${obj.pId}','${obj.pPrice}',)">加入购物车</button>
				</div>
			</div>

		</div>
	</div>

	<div class="main_wrap clearfix">
		<div class="r_wrap fr clearfix">


			<div class="tab_content">
				<dl id="pres">

				</dl>
			</div>

		</div>
	</div>

	<div class="footer">
		<p>CopyRight © 2016 北京天天有生鲜信息技术有限公司 All Rights Reserved</p>
		<p>电话：010-****888    京ICP备*******8号</p>
	</div>

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>


	
</body>
</html>