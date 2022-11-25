<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/addBook.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/ajaxfileupload.js"></script>
</head>

<body>
<!--取出上一个页面上带来的page的值-->

<div id="addAll">
    <div id="nav">
        <p>商品管理>新增商品</p>
    </div>

    <div id="table">
        <form action="${pageContext.request.contextPath}/user/save.action" enctype="multipart/form-data"
              method="post" id="myform">
            <table>
                <tr>
                    <td class="one">用户名</td>
                    <td><input type="text" name="username" class="two"></td>
                </tr>
                <!--错误提示-->
                <tr class="three">
                    <td class="four"></td>
                    <td><span id="usernameeor"></span></td>
                </tr>

                <tr>
                    <td class="one">密码</td>
                    <td><input type="text" name="password" class="two"></td>
                </tr>
                <!--错误提示-->
                <tr class="three">
                    <td class="four"></td>
                    <td><span id="passwordeor"></span></td>
                </tr>

                <tr>
                    <td class="one">手机号</td>
                    <td><input type="text" name="phone" class="two"></td>
                </tr>
                <!--错误提示-->
                <tr class="three">
                    <td class="four"></td>
                    <td><span id="phoneeor"></span></td>
                </tr>
                <tr>
                    <td class="one">真实姓名</td>
                    <td><input type="text" name="realname" class="two"></td>
                </tr>
                <!--错误提示-->
                <tr class="three">
                    <td class="four"></td>
                    <td><span id="realnameeor"></span></td>
                </tr>

                <tr>
                    <td class="one">性别</td>
                    <td>
                        <select style="outline: none;border: 1px solid #ddd;height: 30px;" name="sex">
                            <option value="男" >男</option>
                            <option value="女" >女</option>
                        </select>
                    </td>
                </tr>
                <!--错误提示-->
                <tr class="three">
                    <td class="four"></td>
                    <td><span id="sexeor"></span></td>
                </tr>

                <tr>
                    <td class="one">地址</td>
                    <td><input type="text" name="address" class="two"></td>
                </tr>
                <!--错误提示-->
                <tr class="three">
                    <td class="four"></td>
                    <td><span id="addresseor"></span></td>
                </tr>

                <tr>
                    <td class="one">邮箱</td>
                    <td><input type="text" name="email" class="two"></td>
                </tr>
                <!--错误提示-->
                <tr class="three">
                    <td class="four"></td>
                    <td><span id="emaileor"></span></td>
                </tr>

                <tr>
                    <td>
                        <input type="submit" value="提交" class="btn btn-success">
                    </td>
                    <td>
                        <input type="reset" value="取消" class="btn btn-default" onclick="myclose(1)">
                        <script type="text/javascript">
                            function myclose(ispage) {
                                window.location="${pageContext.request.contextPath}/user/userManagement.action?page="+ispage;
                            }
                        </script>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>

</body>

</html>