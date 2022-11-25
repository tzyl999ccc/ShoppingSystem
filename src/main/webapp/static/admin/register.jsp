<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<title>天天有生鲜-注册</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CssView/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CssView/main.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var error_name = false;
			var error_password = false;
			var error_phone = false;
			var error_email = false;
			var error_check = false;

			$('#user_name').blur(function() {
				check_user_name();
			});

			$('#pwd').blur(function() {
				check_pwd();
			});

			$('#phone').blur(function() {
				check_phone();
			});

			$('#email').blur(function() {
				check_email();
			});

			$('#allow').click(function() {
				if($(this).is(':checked')) {
					error_check = false;
					$(this).siblings('span').hide();
				} else {
					error_check = true;
					$(this).siblings('span').html('请勾选同意');
					$(this).siblings('span').show();
				}
			});


			function check_user_name(){
				var len = $('#user_name').val().length;
				if(len<4||len>20) {
					$('#user_name').next().html('请输入4-20个字符的用户名')
					$('#user_name').next().show();
					error_name = true;
				} else {
					$('#user_name').next().hide();
					error_name = false;
				}
			}

			function check_pwd(){
				var len = $('#pwd').val().length;
				if(len<5||len>10) {
					$('#pwd').next().html('密码最少5位，最长10位')
					$('#pwd').next().show();
					error_password = true;
				} else {
					$('#pwd').next().hide();
					error_password = false;
				}
			}

			function check_phone(){
				var len = $('#phone').val().length;
				if(len<5||len>11) {
					$('#phone').next().html('密码最少5位，最长11位')
					$('#phone').next().show();
					error_phone = true;
				} else {
					$('#phone').next().hide();
					error_phone = false;
				}
			}

			function check_email(){
				var re = /^[a-z0-9][\w\.\-]*@[a-z0-9\-]+(\.[a-z]{2,5}){1,2}$/;
				if(re.test($('#email').val())) {
					$('#email').next().hide();
					error_email = false;
				} else {
					$('#email').next().html('你输入的邮箱格式不正确')
					$('#email').next().show();
					error_phone = true;
				}
			}

			$('#reg_form').submit(function() {
				check_user_name();
				check_pwd();
				check_phone();
				check_email();
				if(error_name == false && error_password == false && error_phone == false && error_email == false && error_check == false) {
					return true;
				}else{
					return false;
				}
			});

		})
	</script>
</head>
<body>
	<div class="register_con">
		<div class="l_con fl">
			<a class="reg_logo"><img src="${pageContext.request.contextPath}/image_big/logo01.png" style="width: 140px"></a>
			<div class="reg_slogan">足不出户  ·  新鲜每一天</div>
			<div class="reg_banner"></div>
		</div>

		<div class="r_con fr">
			<div class="reg_title clearfix">
				<h1>用户注册</h1>
				<a href="${pageContext.request.contextPath}/user/userLoginView.action">登录</a>
			</div>
			<div class="reg_form clearfix" id="reg_form">
				<form action="${pageContext.request.contextPath}/user/registerUser.action" method="post">
				<ul>
					<li>
						<label>用户名:</label>
						<input type="text" name="username" id="user_name" placeholder="请输入您的用户名" class="left_yh" style="font-size: 16px;text-indent: 22px;">
						<span class="error_tip">提示信息</span>
					</li>					
					<li>
						<label>密码:</label>
						<input type="password" name="password" id="pwd" placeholder="建议至少使用两种字符组合" class="left_yh" style="font-size: 16px;text-indent: 22px;">
						<span class="error_tip">提示信息</span>
					</li>
					<li>
						<label>手机号:</label>
						<input type="phone" name="phone" id="phone" placeholder="建议使用常用的手机" class="left_yh" style="font-size: 16px;text-indent: 22px;">
						<span class="error_tip">提示信息</span>
					</li>
					<li>
						<label>邮箱:</label>
						<input type="text" name="email" id="email" placeholder="请输入邮箱" class="left_yh" style="font-size: 16px;text-indent: 22px;">
						<span class="error_tip">提示信息</span>
					</li>
					<li class="agreement">
						<input type="checkbox" name="allow" id="allow" checked="checked">
						<label>同意”天天有生鲜用户使用协议“</label>
						<span class="error_tip2">提示信息</span>
					</li>
					<li class="reg_sub">
						<input type="submit" value="注 册">
					</li>
				</ul>				
				</form>
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