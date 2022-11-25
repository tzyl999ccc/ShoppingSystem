<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<title>天天有生鲜-首页</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CssView/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CssView/main.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/slide.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resource/user/css/style.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/CssView/index.css">
	<script src="${pageContext.request.contextPath}/resource/user/js/jquery-1.8.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/resource/user/js/jquery.luara.0.0.1.min.js"></script>
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
<%--				<div class="login_btn fl" id="userPs">--%>
<%--					--%>
<%--				</div>--%>
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
					<span>|</span>
					<a href="${pageContext.request.contextPath}/admin/login.jsp">管理员登录界面</a>
				</div>
			</div>
		</div>
	</div>

	<div class="search_bar clearfix">
		<a href="${pageContext.request.contextPath}/user/userMain.action" class="logo fl"><img src="${pageContext.request.contextPath}/image_big/logo01.png" style="width: 140px"></a>
		<div class="search_con fl">
			<form action="${pageContext.request.contextPath}/user/searchlist.action" method="post">
				<input type="text" class="input_text fl" name="pname" id="pname" placeholder="搜索商品">
				<input type="submit" class="input_btn fr" id="sous" value="搜索">
			</form>
		</div>
	</div>

	<div class="navbar_con">
		<div class="navbar">
			<h1 class="fl">全部商品分类</h1>
			<h1 class="fl" style="color: white"><a href="${ctx}/login/uIndex" class="font1">首页</a></h1>
			<h1 class="fl" style="color: white"><a href="${ctx}/news/list" class="font1">公告</a></h1>
			<h1 class="fl" style="color: white"><a href="${ctx}/message/add" class="font1">留言</a></h1>
			<h1 class="fl" style="color: white"><a href="${ctx}/message/add"></a></h1>
			<h1 class="fl" style="color: white"><a href="${ctx}/message/add"></a></h1>
		</div>
	</div>



	<div class="center_con clearfix">
		<ul class="subnav fl">
			<c:forEach items="${allType}" var="p" varStatus="1">
				<li><a href="${pageContext.request.contextPath}/user/typeShopList.action?typeId=${p.typeId}"  class="fruit">${p.typeName}</a></li>
			</c:forEach>
		</ul>

		<div class="slide fl">
			<div class="example2" style="width: 760px;height: 270px;overflow: hidden;">
				<ul>
					<li><img src="${pageContext.request.contextPath}/image_big/slide.jpg" alt="幻灯片"></li>
					<li><img src="${pageContext.request.contextPath}/image_big/slide02.jpg" alt="幻灯片"></li>
					<li><img src="${pageContext.request.contextPath}/image_big/slide03.jpg" alt="幻灯片"></li>
					<li><img src="${pageContext.request.contextPath}/image_big/slide04.jpg" alt="幻灯片"></li>
				</ul>
			</div>
			<script>
				$(function () {
					$(".example2").luara({width:"760",height:"270",interval:4000,selected:"seleted",deriction:"left"});
				});
			</script>
		</div>
<%--		<div class="width1200 center_yh hidden_yh" style="position: relative;z-index:80; width: 760px;margin-left: 198px" >--%>
<%--			--%>
<%--		</div>--%>
		<div class="adv fl">
			<a href="#"><img src="image_big/adv01.jpg" ></a>
			<a href="#"><img src="image_big/adv02.jpg" ></a>
		</div>


	</div>

	<!--热门商品-->
	<div class="width1200 center_yh hidden_yh" style="height: 650px">
		<div class="width100" style="height: 45px;line-height: 45px;border-bottom: 2px solid #dd4545; margin-top: 20px;">
			<font class="left_yh font20">热门商品</font>
		</div>
		<div class="width100 hidden_yh" style="height: 550px;">
			<div class="normalPic">
				<ul class="listSs">
					<c:forEach items="${pb.list}" var="p" varStatus="l">
						<li style="width:222px;height:246px;float:left;margin-right:20px;border:1px solid #ddd;position:relative;margin-bottom:30px;">
							<a href="${pageContext.request.contextPath}/user/detailView.action?pId=${p.pId}" style="display:block;width:190px;height:120px;background:#fff;border-left:1px solid #ddd;float:left;border:1px solid #ddd;padding: 15px;margin:0px 0px 0px 0px;">
								<img width="120" height="125" style="margin:0 auto"
									 src="${pageContext.request.contextPath}/image_big/${p.pImage}">
							</a>
							<h3 class="yihang c_33 font14 font100" style="padding-left: 10px;padding-right: 10px;">商品名：${p.pName}</h3>
							<h3 class="yihang c_33 font14 font100" style="padding-left: 10px;padding-right: 10px;">商品描述：${p.pContent}</h3>
							<p  class="center_yh block_yh hidden_yh" style="width: 202px;"><font class="left_yh red font16">￥${p.pPrice}</font></p>
							<div class="wCa" style="width:100%;height:30px;border-top:1px solid #ddd;position:absolute;bottom:0;left:0;overflow:hidden;">
								<button class="button red" onclick="scAdd('${userId}','${p.pId}')">收藏</button>
								<span>|</span>
								<button class="button orange" style="padding-right: 17px;padding-left: 20px" onclick="carAdd('${userId}','${p.pId}','${p.pPrice}',)">加入购物车</button>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>

	<ul class="pagination">
		<li><a
				href="${pageContext.request.contextPath}/user/productInfo_main_list.action?page=1&size=10"
				aria-label="Previous">首页</a></li>
		<li><a
				href="${pageContext.request.contextPath}/user/productInfo_main_list.action?page=${pb.pageNum-1}&size=10">上一页</a></li>
		<c:forEach begin="1" end="${pb.pages}" var="pageNumber">
			<li><a
					href="${pageContext.request.contextPath}/user/productInfo_main_list.action?page=${pageNumber}&size=10">${pageNumber}</a></li>
		</c:forEach>
		<li><a
				href="${pageContext.request.contextPath}/user/productInfo_main_list.action?page=${pb.pageNum+1}&size=10">下一页</a></li>
		<li><a
				href="${pageContext.request.contextPath}/user/productInfo_main_list.action?page=${pb.pages}&size=10"
				aria-label="Next">尾页</a></li>
	</ul>


	<!--热门商品-->
	<div class="width1200 center_yh hidden_yh">
		<div class="width100" style="height: 45px;line-height: 45px;border-bottom: 2px solid #dd4545; margin-top: 20px;">
			<font class="left_yh font20">折扣商品</font>
		</div>
		<div class="width100 hidden_yh" style="height: 480px;">
			<div class="normalPic">
				<ul class="listSs">
					<c:forEach items="${pb2.list}" var="p" varStatus="l">
						<li style="width:222px;height:246px;float:left;margin-right:20px;border:1px solid #ddd;position:relative;margin-bottom:30px;">
							<a href="${pageContext.request.contextPath}/user/detailView.action?pId=${p.pId}" style="display:block;width:190px;height:120px;background:#fff;border-left:1px solid #ddd;float:left;border:1px solid #ddd;padding: 15px;margin:0px 0px 0px 0px;">
								<img width="120" height="125" style="margin:0 auto"
									 src="${pageContext.request.contextPath}/image_big/${p.pImage}">
							</a>
							<h3 class="yihang c_33 font14 font100" style="padding-left: 10px;padding-right: 10px;">商品名：${p.pName}</h3>
							<h3 class="yihang c_33 font14 font100" style="padding-left: 10px;padding-right: 10px;">商品描述：${p.pContent}</h3>
							<p  class="center_yh block_yh hidden_yh" style="width: 202px;"><font class="left_yh red font16">￥${p.pPrice}</font></p>
							<div class="wCa" style="width:100%;height:30px;border-top:1px solid #ddd;position:absolute;bottom:0;left:0;overflow:hidden;">
								<button class="button red" onclick="scAdd('${userId}','${p.pId}')">收藏</button>
								<span>|</span>
								<button class="button orange" style="padding-right: 17px;padding-left: 20px" onclick="carAdd('${userId}','${p.pId}','${p.pPrice}',)">加入购物车</button>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>