<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/updateUser.js"></script>
	<link href="${pageContext.request.contextPath}/css/layer.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/layer.js"></script>
	<script type="text/javascript">
		$(function () {
			$("#sub").click(function () {
				alert("修改成功");
				$("#system_form").submit();
			});
			$("#updatePwd").click(function () {
				alert("修改成功");
				$("#system_form1").submit();
			});
		});
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
		<a href="${pageContext.request.contextPath}/user/userMain.action" class="logo fl"><img src="${pageContext.request.contextPath}/image_big/logo01.png" style="width: 120px"></a>
		<div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;用户中心</div>
		
	</div>

	<div class="main_con clearfix">
		<div class="left_menu_con clearfix">
			<h3>用户中心</h3>
			<ul>
				<li><a href="user_center_info.jsp" class="active">· 个人信息</a></li>
				<li><a href="${pageContext.request.contextPath}/user/userOrderView.action?id=${userId}">· 全部订单</a></li>
			</ul>
		</div>
		<div class="right_content clearfix">
				<h3 class="common_title2">个人信息</h3>
				<div class="site_con" id="reg_form">
					<form action="${pageContext.request.contextPath}/user/userUpdate.action?id=${userId}" method="post" id="system_form">
						<div class="form_group">
							<label>真实姓名：</label>
							<input type="text" name="realname" value="${obj.realname}" style="width: 243px;border: 1px solid #ddd;outline: none;height:30px;text-indent: 10px;">
						</div>
						<div class="form_group">
							<label>性别：</label>
							<select style="outline: none;border: 1px solid #ddd;height: 30px;" name="sex">
								<option value="男" ${obj.sex=='男'?'selected="selected"':''}>男</option>
								<option value="女" ${obj.sex=='女'?'selected="selected"':''}>女</option>
							</select>
						</div>

						<div class="form_group">
							<label>邮箱：</label>
							<input type="text" name="email" id="email" value="${obj.email}"/>
							&nbsp;&nbsp;&nbsp;<span class="error_tip" style="color: red"></span>
						</div>
						<div class="form_group">
							<label>手机号：</label>
							<input type="text" name="phone" id="phone" value="${obj.phone}" />
							&nbsp;&nbsp;&nbsp;<span class="error_tip" style="color: red"></span>
						</div>
						<div class="form_group">
							<label>联系地址：</label>
							<input type="text" name="address" id="address" value="${obj.address}"/>
							&nbsp;&nbsp;&nbsp;<span class="error_tip" style="color: red"></span>
						</div>
						<input type="button"  value="保存" class="info_submit" id="sub">
					</form>
				</div>
				
				<h3 class="common_title2">修改密码</h3>
				<div class="site_con">
					<form action="${pageContext.request.contextPath}/user/userUpdatePassword.action?id=${userId}" method="post" id="system_form1">
						<div class="form_group">
							<label>原密码：</label>
							<input type="text" name="" id="password" value="${obj.password}">
						</div>
						<div class="form_group">
							<label>新密码：</label>
							<input type="text" name="password" id="newpassword">
						</div>
						<input type="button" id="updatePwd" value="修改" class="info_submit">
					</form>
				</div>
		</div>
	</div>
	



	<div class="footer">
		<p>CopyRight © 2016 北京天天有生鲜信息技术有限公司 All Rights Reserved</p>
		<p>电话：010-****888    京ICP备*******8号</p>
	</div>
</body>
</html>