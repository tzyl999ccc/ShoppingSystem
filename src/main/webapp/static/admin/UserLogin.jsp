<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<title>天天有生鲜-登录</title>
	<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CssView/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CssView/main.css">
	<link href="${pageContext.request.contextPath}/css/layer.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/layer.js"></script>
	<style>
		.login_banner{width:381px;height:322px;background:url(${pageContext.request.contextPath}/image_big/login_banner.png);margin-top:90px;}
	</style>
	<script type="text/javascript">
		$(function() {
			//给整个浏览器窗口添加键盘按下事件
			$(window).keydown(function (e) {
				//如果按的是回车键，则提交登录请求
				if(e.keyCode==13){
					$("#loginBtn").click();
				}
			});

			//给"登录"按钮添加单击事件
			$("#loginBtn").click(function () {
				//收集参数
				var username=$.trim($("#username").val());
				var password=$.trim($("#password").val());
				//表单验证
				if(username==""){
					alert("用户名不能为空");
					return;
				}
				if(password==""){
					alert("密码不能为空");
					return;
				}
				//显示正在验证
				//$("#msg").text("正在努力验证....");
				//发送请求
				$.ajax({
					url:'${pageContext.request.contextPath}/user/userLoginYanZeng.action',
					data:{
						username:username,
						password:password,
					},
					type:'post',
					dataType:'json',
					success:function (data) {
						if(data.code=="1"){
							//跳转到业务主页面
							alert("登陆成功");
							window.location.href="${pageContext.request.contextPath}/user/userMain.action";
						}else{
							//提示信息
							alert("账号密码错误");
						}
					}
				});
			});

		});
	</script>
</head>
<body>
<div class="login_top clearfix">
	<a href="${pageContext.request.contextPath}/user/userMain.action" class="login_logo"><img src="${pageContext.request.contextPath}/image_big/logo01.png" style="width: 140px"></a>
</div>

<div class="login_form_bg">
	<div class="login_form_wrap clearfix">
		<div class="login_banner fl"></div>
		<div class="slogan fl">日夜兼程 · 急速送达</div>
		<div class="login_form fr">
			<div class="login_title clearfix">
				<h1>用户登录</h1>
				<a href="${pageContext.request.contextPath}/user/registerView.action">立即注册</a>
			</div>
			<div class="form_input">
				<form action="${pageContext.request.contextPath}/user/userLoginYanZeng.action" method="post">
					<input type="text" name="username" id="username" class="name_input" placeholder="请输入用户名" style="font-size: 16px;text-indent: 22px;">
					<input type="password" name="password" id="password" class="pass_input" placeholder="请输入密码" style="font-size: 16px;text-indent: 22px;">
					<input type="button" id="loginBtn" value="登录" class="input_submit">
				</form>
			</div>
		</div>
	</div>
</div>

<div class="footer no-mp">
	<div class="foot_link">
		<a href="#">关于我们</a>
		<span>|</span>
		<a href="#">联系我们</a>
		<span>|</span>
		<a href="#">招聘人才</a>
		<span>|</span>
		<a href="#">友情链接</a>
	</div>
	<p>CopyRight © 2016 北京天天有生鲜信息技术有限公司 All Rights Reserved</p>
	<p>电话：010-****888    京ICP备*******8号</p>
</div>

</body>
</html>