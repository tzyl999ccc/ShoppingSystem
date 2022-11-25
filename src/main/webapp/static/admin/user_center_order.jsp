<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="/WEB-INF/tlds/fn.tld" %>
<%@ taglib prefix="fmt" uri="/WEB-INF/tlds/fmt.tld" %>
<%
String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<title>天天有生鲜-用户中心</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CssView/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CssView/main.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resource/user/css/style.css">
	<script src="${pageContext.request.contextPath}/resource/user/js/jquery-1.8.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/resource/user/js/jquery.luara.0.0.1.min.js"></script>
</head>
<body>
	<div class="header_con" style="font-size: 12px">
		<div class="header">
			<div  class="welcome fl">欢迎来到天天有生鲜!</div>
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

	<div class="width1200 center_yh hidden_yh font14" style="height: 120px;line-height: 40px;">
		<div class="search_bar clearfix">
			<a href="${pageContext.request.contextPath}/user/userMain.action" class="logo fl"><img src="image_big/logo01.png" style="width: 140px"></a>
			<div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;我的订单</div>

		</div>
	</div>
	<div class="width100 hidden_yh" style="background: #f0f0f0;padding-top: 34px;padding-bottom: 34px;">
		<div class="width1200 hidden_yh center_yh">
			<div id="vipNav">
				<a  href="${pageContext.request.contextPath}/user/userCenterView.action?id=${userId}">用户中心</a>
				<a href="${pageContext.request.contextPath}/user/userOrderView.action?id=${userId}" class="on" style="color:#fff;background:#39a93e;">我的订单</a>
			</div>
			<div id="vipRight">
				<div style="width: 938px;border:1px solid #ddd;background: #fff;">
					<div class="width100 hidden_yh" style="height: 74px;line-height: 74px;background: #f5f8fa;border-bottom: 1px solid #ddd;" id="navLt">
						<span class="left_yh font24 width20 tcenter cursor onHover onorange slect">全部订单（${fn:length(all)}）</span>
						<span class="left_yh font24 width20 tcenter cursor onHover onorange">已取消（${fn:length(yqx)}）</span>
						<span class="left_yh font24 width20 tcenter cursor onHover onorange">待发货（${fn:length(dfh)}）</span>
						<span class="left_yh font24 width20 tcenter cursor onHover onorange">待收货（${fn:length(dsh)}）</span>
						<span class="left_yh font24 width20 tcenter cursor onHover onorange">已收货（${fn:length(ysh)}）</span>
					</div>
					<!--全部订单-->
					<div class="allGoods width100 hidden_yh hhD" style="display: block;">
						<c:forEach items="${all}" var="data" varStatus="l">
							<div class="width100 hidden_yh">
								<div class="width100 hidden_yh fon20 c_66" style="background:#faf5f5;text-indent: 47px;height: 50px;line-height: 50px;border-bottom: 1px solid #ddd;">
									<fmt:formatDate value="${data.addtime}" type="both"/>&nbsp;&nbsp;订单号${data.code}&nbsp;&nbsp;
									<c:if test="${data.status==0}">待发货</c:if>
									<c:if test="${data.status==1}">已取消</c:if>
									<c:if test="${data.status==2}">待收货</c:if>
									<c:if test="${data.status==3}">已收货</c:if>
								</div>
									<div style="width: 838px;border-bottom: 1px dashed #ddd;padding-top: 30px;padding-bottom: 30px;" class="hidden_yh center_yh">
										<img src="${pageContext.request.contextPath}/image_big/${data.productImage}" width="100" height="100" class="left_yh" style="padding-right: 10px">
										<div class="left_yh" style="width: 580px;">
											<h3 class="font18 c_33 font100">${data.productName}</h3>
											<p class="red" style="margin-top: 10px;">￥${data.productPrice}</p>
										</div>
									</div>
								<div style="width: 838px;padding-top:30px;padding-bottom: 30px;" class="hidden_yh center_yh tleft">
									<font class="font24">总金额</font>
									<font class="font24 red">￥${data.total}</font>
									<c:if test="${data.status==0}">
										<a href="${pageContext.request.contextPath}/order/qxOrder.action?id=${data.id}&userId=${userId}" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
											取消订单
										</a>
									</c:if>
									<c:if test="${data.status==1}">
										<a href="#" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
											已取消
										</a>
									</c:if>
									<c:if test="${data.status==2}">
										<a href="${pageContext.request.contextPath}/order/qxOrder.action?id=${data.id}&userId=${userId}" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
											取消订单
										</a>
									</c:if>
									<c:if test="${data.status==3}">
										<a href="#" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
											已收货
										</a>
									</c:if>
								</div>
							</div>
						</c:forEach>
					</div>

					<!--已取消-->
					<div class="allGoods width100 hidden_yh hhD" style="display: none;">
						<c:forEach items="${yqx}" var="data" varStatus="l">
							<div class="width100 hidden_yh">
								<div class="width100 hidden_yh fon20 c_66" style="background:#faf5f5;text-indent: 47px;height: 50px;line-height: 50px;border-bottom: 1px solid #ddd;">
									<fmt:formatDate value="${data.addtime}" type="both"/>&nbsp;&nbsp;订单号${data.code}&nbsp;&nbsp;
									<c:if test="${data.status==0}">待发货</c:if>
									<c:if test="${data.status==1}">已取消</c:if>
									<c:if test="${data.status==2}">待收货</c:if>
									<c:if test="${data.status==3}">已收货</c:if>
								</div>
								<div style="width: 838px;border-bottom: 1px dashed #ddd;padding-top: 30px;padding-bottom: 30px;" class="hidden_yh center_yh">
									<img src="${pageContext.request.contextPath}/image_big/${data.productImage}" width="100" height="100" class="left_yh" style="padding-right: 10px">
									<div class="left_yh" style="width: 580px;">
										<h3 class="font18 c_33 font100">${data.productName}</h3>
										<p class="red" style="margin-top: 10px;">￥${data.productPrice}</p>
									</div>
								</div>
								<div style="width: 838px;padding-top:30px;padding-bottom: 30px;" class="hidden_yh center_yh tleft">
									<font class="font24">总金额</font>
									<font class="font24 red">￥${data.total}</font>
									<c:if test="${data.status==0}">
										<a href="${pageContext.request.contextPath}/order/qxOrder.action?id=${data.id}&userId=${userId}" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
											取消订单
										</a>
									</c:if>
									<c:if test="${data.status==1}">
										<a href="#" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
											已取消
										</a>
									</c:if>
									<c:if test="${data.status==2}">
										<a href="${pageContext.request.contextPath}/order/qxOrder.action?id=${data.id}&userId=${userId}" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
											取消订单
										</a>
									</c:if>
									<c:if test="${data.status==3}">
										<a href="#" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
											已收货
										</a>
									</c:if>
								</div>
							</div>
						</c:forEach>
					</div>


					<!--待发货-->
					<div class="allGoods width100 hidden_yh hhD" style="display: none;">
						<c:forEach items="${dfh}" var="data" varStatus="l">
							<div class="width100 hidden_yh">
								<div class="width100 hidden_yh fon20 c_66" style="background:#faf5f5;text-indent: 47px;height: 50px;line-height: 50px;border-bottom: 1px solid #ddd;">
									<fmt:formatDate value="${data.addtime}" type="both"/>&nbsp;&nbsp;订单号${data.code}&nbsp;&nbsp;
									<c:if test="${data.status==0}">待发货</c:if>
									<c:if test="${data.status==1}">已取消</c:if>
									<c:if test="${data.status==2}">待收货</c:if>
									<c:if test="${data.status==3}">已收货</c:if>
								</div>
								<div style="width: 838px;border-bottom: 1px dashed #ddd;padding-top: 30px;padding-bottom: 30px;" class="hidden_yh center_yh">
									<img src="${pageContext.request.contextPath}/image_big/${data.productImage}" width="100" height="100" class="left_yh" style="padding-right: 10px">
									<div class="left_yh" style="width: 580px;">
										<h3 class="font18 c_33 font100">${data.productName}</h3>
										<p class="red" style="margin-top: 10px;">￥${data.productPrice}</p>
									</div>
								</div>
								<div style="width: 838px;padding-top:30px;padding-bottom: 30px;" class="hidden_yh center_yh tleft">
									<font class="font24">总金额</font>
									<font class="font24 red">￥${data.total}</font>
									<c:if test="${data.status==0}">
										<a href="${pageContext.request.contextPath}/order/qxOrder.action?id=${data.id}&userId=${userId}" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
											取消订单
										</a>
									</c:if>
									<c:if test="${data.status==1}">
										<a href="#" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
											已取消
										</a>
									</c:if>
									<c:if test="${data.status==2}">
										<a href="${pageContext.request.contextPath}/order/qxOrder.action?id=${data.id}&userId=${userId}" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
											取消订单
										</a>
									</c:if>
									<c:if test="${data.status==3}">
										<a href="#" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
											已收货
										</a>
									</c:if>
								</div>
							</div>
						</c:forEach>
					</div>


					<!--待收货-->
					<div class="allGoods width100 hidden_yh hhD" style="display: none;">
						<c:forEach items="${dsh}" var="data" varStatus="l">
							<div class="width100 hidden_yh">
								<div class="width100 hidden_yh fon20 c_66" style="background:#faf5f5;text-indent: 47px;height: 50px;line-height: 50px;border-bottom: 1px solid #ddd;">
									<fmt:formatDate value="${data.addtime}" type="both"/>&nbsp;&nbsp;订单号${data.code}&nbsp;&nbsp;
									<c:if test="${data.status==0}">待发货</c:if>
									<c:if test="${data.status==1}">已取消</c:if>
									<c:if test="${data.status==2}">待收货</c:if>
									<c:if test="${data.status==3}">已收货</c:if>
								</div>
								<div style="width: 838px;border-bottom: 1px dashed #ddd;padding-top: 30px;padding-bottom: 30px;" class="hidden_yh center_yh">
									<img src="${pageContext.request.contextPath}/image_big/${data.productImage}" width="100" height="100" class="left_yh" style="padding-right: 10px">
									<div class="left_yh" style="width: 580px;">
										<h3 class="font18 c_33 font100">${data.productName}</h3>
										<p class="red" style="margin-top: 10px;">￥${data.productPrice}</p>
									</div>
								</div>
								<div style="width: 838px;padding-top:30px;padding-bottom: 30px;" class="hidden_yh center_yh tleft">
									<font class="font24">总金额</font>
									<font class="font24 red">￥${data.total}</font>
									<c:if test="${data.status==0}">
										<a href="${pageContext.request.contextPath}/order/qxOrder.action?id=${data.id}&userId=${userId}" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
											取消订单
										</a>
									</c:if>
									<c:if test="${data.status==1}">
										<a href="#" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
											已取消
										</a>
									</c:if>
									<c:if test="${data.status==2}">
										<a href="${pageContext.request.contextPath}/order/sh.action?id=${data.id}&userId=${userId}" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
											去收货
										</a>
									</c:if>
									<c:if test="${data.status==3}">
										<a href="#" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
											已收货
										</a>
									</c:if>
								</div>
							</div>
						</c:forEach>
					</div>

					<!--已收货-->
					<div class="allGoods width100 hidden_yh hhD" style="display: none;">
						<c:forEach items="${ysh}" var="data" varStatus="l">
							<div class="width100 hidden_yh">
								<div class="width100 hidden_yh fon20 c_66" style="background:#faf5f5;text-indent: 47px;height: 50px;line-height: 50px;border-bottom: 1px solid #ddd;">
									<fmt:formatDate value="${data.addtime}" type="both"/>&nbsp;&nbsp;订单号${data.code}&nbsp;&nbsp;
									<c:if test="${data.status==0}">待发货</c:if>
									<c:if test="${data.status==1}">已取消</c:if>
									<c:if test="${data.status==2}">待收货</c:if>
									<c:if test="${data.status==3}">已收货</c:if>
								</div>
								<div style="width: 838px;border-bottom: 1px dashed #ddd;padding-top: 30px;padding-bottom: 30px;" class="hidden_yh center_yh">
									<img src="${pageContext.request.contextPath}/image_big/${data.productImage}" width="100" height="100" class="left_yh" style="padding-right: 10px">
									<div class="left_yh" style="width: 580px;">
										<h3 class="font18 c_33 font100">${data.productName}</h3>
										<p class="red" style="margin-top: 10px;">￥${data.productPrice}</p>
									</div>
								</div>
								<div style="width: 838px;padding-top:30px;padding-bottom: 30px;" class="hidden_yh center_yh tleft">
									<font class="font24">总金额</font>
									<font class="font24 red">￥${data.total}</font>
									<c:if test="${data.status==0}">
										<a href="${pageContext.request.contextPath}/order/qxOrder.action?id=${data.id}&userId=${userId}" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
											取消订单
										</a>
									</c:if>
									<c:if test="${data.status==1}">
										<a href="#" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
											已取消
										</a>
									</c:if>
									<c:if test="${data.status==2}">
										<a href="${pageContext.request.contextPath}/order/qxOrder.action?id=${data.id}&userId=${userId}" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
											取消订单
										</a>
									</c:if>
									<c:if test="${data.status==3}">
										<a href="#" class="c_33 onHover font20 onorange right_yh" style="margin-top: 10px;padding-right: 6px;">
											已收货
										</a>
									</c:if>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$("#navLt span").click(function () {
			var t = $(this).index();
			$(this).addClass("slect").siblings().removeClass("slect");
			$(".hhD").eq(t).css({display:"block"}).siblings(".hhD").css({display:"none"});
		});
	</script>
</body>
</html>