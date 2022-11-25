<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="/WEB-INF/tlds/fmt.tld" %>
<%@ taglib prefix="fn" uri="/WEB-INF/tlds/fn.tld" %>
<%@ taglib prefix="pg" uri="/WEB-INF/tlds/pager-taglib.tld" %>
<%
String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<title>天天有生鲜-购物车</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CssView/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CssView/main.css">
	<script src="${pageContext.request.contextPath}/resource/user/js/jquery.luara.0.0.1.min.js"></script>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resource/user/css/style.css">
	<script src="${pageContext.request.contextPath}/resource/user/js/jquery-1.8.3.min.js"></script>

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
						<input hidden id="userId" value="${userId}">
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
		<div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;购物车</div>

	</div>
	<div class="width1200 hidden_yh center_yh font20">全部商品<font class="red">（${fn:length(list)}）</font> </div>
	<div class="width1198 hidden_yh center_yh" style="border: 1px solid #ddd;margin-top: 18px;min-height: 300px;">
		<div class="width100 hidden_yh font14" style="height: 32px;line-height: 32px;
    background: #f0f0f0;text-indent: 21px;color: #000; font-weight: 600;border-bottom: 1px solid #ddd;">商品详情</div>
		<div class="width100 hidden_yh fon14" style="height: 42px;line-height: 42px;border-bottom: 1px solid #ddd;">
			<div class="left_yh tcenter font14" style="width: 486px;">商品</div>
			<div class="left_yh tcenter font14" style="width: 175px;">价格</div>
			<div class="left_yh tcenter font14" style="width: 175px;">数量</div>
			<div class="left_yh tcenter font14" style="width: 175px;">小计</div>
			<div class="left_yh tcenter font14" style="width: 175px;">操作</div>
		</div>
		<c:forEach items="${list}" var="data" varStatus="l">
			<div class="speCific" data-id="${data.id}">
				<div class="xzWxz">
					<b><img src="${pageContext.request.contextPath}/image_big/xzwxz.png"></b>
				</div>
				<div class="xzSp">
					<img src="${pageContext.request.contextPath}/image_big/${data.productImage}">
					<div class="xzSpIn">
						<input id="productId1" value="${data.productId}" hidden>
						<h3 class="font16 c_33 font100">${data.productName}</h3>
						<h3 id="productId">${data.productId}</h3>
					</div>
				</div>
				<div class="xzJg">
					￥<font>${data.price}</font>
				</div>
				<div class="xzSl">
					<div class="xzSlIn">
						<b class="Amin">减</b>
						<input type="text" value="${data.num}" readonly class="cOnt">
						<b style="border-right: none;border-left:1px solid #ddd;" class="Aadd">加</b>
					</div>
				</div>
				<div class="xzXj">￥<font></font></div>
				<div class="xzSz">
					<div class="xzCzIn">
						<a href="javascript:void(0)" class="Dels" data-id="${data.id}">删除</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="width1198 center_yh" style="height: 60px;background: #f0f0f0;border:1px solid #ddd;margin-top:40px;">
		<div class="center_yh hidden_yh" style="width: 1178px;height: 60px;margin-left: 20px;">
			<div class="ifAll"><b><img src="${pageContext.request.contextPath}/image_big/xzwxz.png"></b><font>全选</font></div>
			<div class="ifDel">删除</div>
			<div class="sXd">
				<div class="sXd1">已选商品（<font style="color: #cb1c20">0</font> ）</div>
				<div class="sXd2">合计（不含运费）：￥<font style="color: #cb1c20" id="zjJg">0</font> </div>
				<a href="javascript:void(0)" class="ifJs" onclick="ifJs()">结算</a>
			</div>
		</div>
	</div>
	<script>
		//总的子项数量
		var es = $(".speCific").length;
		//给小计赋值
		(function cx() {
			for(var a=0;a<es;a++){
				var lt = $(".xzJg").eq(a).find("font").html();
				var num = $(".xzSl").eq(a).find("input").val();
				var xj = lt*num;
				$(".xzXj").eq(a).find("font").html(xj);
			}
		})();


		//选择或不选择一项
		$(".xzWxz").click(function () {
			if($(this).hasClass("on")){
				$(this).removeClass("on");
			}else{
				$(this).addClass("on");
			}
			var ty = $(".xzWxz.on").length;
			$(".sXd1").find("font").html(ty);
			if(ty==es){
				$(".ifAll").addClass("on");
			}else{
				$(".ifAll").removeClass("on");
			}
			jsZj();
		});

		//计算总计
		function jsZj(){
			var total = 0;
			$(".xzWxz.on").each(function () {
				var price = $(this).parent().find(".xzJg").find("font").html();
				var num = $(this).parent().find(".xzSl").find("input").val();
				total += price*num;
			});
			$("#zjJg").html(sswr(total));
		}

		//保留两位小数
		function sswr(num) {
			return num.toFixed(2);
		}

		$(".Aadd").click(function () {
			var t = $(this).siblings(".cOnt").val()*1;
			var price = $(this).parent().parent().siblings(".xzJg").find("font").html()*1;
			t++;
			$(this).siblings(".cOnt").val(t);
			$(this).parent().parent().siblings(".xzXj").find("font").html(sswr(price*t));
			jsZj();
		});

		$(".Amin").click(function () {
			var t = $(this).siblings(".cOnt").val()*1;
			var price = $(this).parent().parent().siblings(".xzJg").find("font").html()*1;
			t--;
			if(t<1){
				t=1;
			}
			$(this).siblings(".cOnt").val(t);
			$(this).parent().parent().siblings(".xzXj").find("font").html(sswr(price*t));
			jsZj();
		});

		$(".ifAll").click(function () {
			if($(".ifAll").hasClass("on")){
				$(this).removeClass("on");
				$(".xzWxz").removeClass("on");
				$(".sXd1").find("font").html(0);
			}else{
				$(this).addClass("on");
				$(".xzWxz").addClass("on");
				$(".sXd1").find("font").html(es);
			}
			jsZj();
		});

		//单项删除
		$(".Dels").click(function () {
			var id = $(this).attr("data-id");
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/car/delete.action?id="+id,
				contentType:"application/json",
				success:function (result) {
				}
			});
			alert("删除成功");
			$(this).parent().parent().parent().remove();
			jsZj();
		});

		//批量删除
		$(".ifDel").click(function () {
			$(".xzWxz.on").each(function () {
				var id = $(this).parent().attr("data-id");
				$.ajax({
					type:"POST",
					url:"${pageContext.request.contextPath}/car/delete.action?id="+id,
					contentType:"application/json",
					success:function (result) {
					}
				});
			});
			alert("删除成功");
			$(".xzWxz.on").parent().remove();
			jsZj();
		});

		/**
		 * 结算--进入购买流程
		 */
		function ifJs() {
			var arr = new Array();
			var userId=$.trim($("#userId").val());
			var productId=$.trim($("#productId1").val());
			$(".xzWxz.on").each(function () {
				var obj = new Object();
				var $id = $(this).parent().attr("data-id");

				var $num = $(this).parent().find(".xzSl").find("input").val();
				obj.id = $id;
				obj.userId = userId;
				obj.num = $num;
				arr.push(obj);
			});
			if(arr.length==0){
				alert("请至少选择一个商品结算");
				return false;
			}
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/order/addOrder.action?userId="+userId+"&productId="+productId+"",
				data:JSON.stringify(arr),
				contentType:"application/json",
				success:function (result) {
					if(result.res == 0){
						alert("请登录");
						window.location.href="${pageContext.request.contextPath}/login/uLogin";
					}else if(result.res == 2){
						alert("请编辑地址");
					}else{
						alert("购买成功");
						window.location.reload();
					}
				}
			});
		}
	</script>
</body>
</html>