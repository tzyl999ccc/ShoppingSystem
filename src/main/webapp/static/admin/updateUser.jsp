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
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/ajaxfileupload.js"></script>
</head>

<body>
<div id="addAll">
    <div id="nav">
        <p>用户管理>更新用户</p>
    </div>
    <script type="text/javascript">
        function fileChange(){//注意：此处不能使用jQuery中的change事件，因此仅触发一次，因此使用标签的：onchange属性

            $.ajaxFileUpload({
                url: '/prod/ajaxImg.action',//用于文件上传的服务器端请求地址
                secureuri: false,//一般设置为false
                fileElementId: 'pimage',//文件上传控件的id属性  <input type="file" id="pimage" name="pimage" />
                dataType: 'json',//返回值类型 一般设置为json
                success: function(obj) //服务器成功响应处理函数
                {

                    $("#imgDiv").empty();  //清空原有数据
                    //创建img 标签对象
                    var imgObj = $("<img>");
                    //给img标签对象追加属性
                    imgObj.attr("src","/image_big/"+obj.imgurl);
                    imgObj.attr("width","100px");
                    imgObj.attr("height","100px");
                    //将图片img标签追加到imgDiv末尾
                    $("#imgDiv").append(imgObj);
                    //将图片的名称（从服务端返回的JSON中取得）赋值给文件本框
                    //$("#imgName").html(data.imgName);
                },
                error: function (e)//服务器响应失败处理函数
                {
                    alert(e.message);
                }
            });
        }
    </script>
    <script type="text/javascript">
        function myclose(ispage) {
            window.location="${pageContext.request.contextPath}/user/userManagement.action?ispage="+ispage;
            //window.close();
        }
    </script>
    <div id="table">
        <form action="${pageContext.request.contextPath}/user/update.action" enctype="multipart/form-data" method="post" id="myform">
            <input type="hidden" value="${prod.id}" name="id">
            <input type="hidden" value="${prod.password}" name="password">
            <input type="hidden" value="${page}" name="page">
            <table>
                <tr>
                    <td class="one">用户名</td>
                    <td><input type="text" name="username" class="two" value="${prod.username}"></td>
                </tr>
                <!--错误提示-->
                <tr class="three">
                    <td class="four"></td>
                    <td><span id="pnameerr"></span></td>
                </tr>
                <tr>
                    <td class="one">手机号</td>
                    <td><input type="text" name="phone" class="two" value="${prod.phone}"></td>
                </tr>
                <!--错误提示-->
                <tr class="three">
                    <td class="four"></td>
                    <td><span id="pcontenterr"></span></td>
                </tr>
                <tr>
                    <td class="one">真实姓名</td>
                    <td><input type="text" name="realname" class="two" value="${prod.realname}"></td>
                </tr>
                <!--错误提示-->
                <tr class="three">
                    <td class="four"></td>
                    <td><span id="pnameerr"></span></td>
                </tr>

                <tr>
                    <td class="one">性别</td>
                    <td>
                        <select style="outline: none;border: 1px solid #ddd;height: 30px;" name="sex">
                            <option value="男" ${prod.sex=='男'?'selected="selected"':''}>男</option>
                            <option value="女" ${prod.sex=='女'?'selected="selected"':''}>女</option>
                        </select>
                    </td>
                </tr>
                <!--错误提示-->
                <tr class="three">
                    <td class="four"></td>
                    <td><span id="numerr"></span></td>
                </tr>

                <tr>
                    <td class="one">地址</td>
                    <td><input type="text" name="address" class="two" value="${prod.address}"></td>
                </tr>
                <!--错误提示-->
                <tr class="three">
                    <td class="four"></td>
                    <td><span id="pnameerr"></span></td>
                </tr>

                <tr>
                    <td class="one">邮箱</td>
                    <td><input type="text" name="email" class="two" value="${prod.email}"></td>
                </tr>
                <!--错误提示-->
                <tr class="three">
                    <td class="four"></td>
                    <td><span id="pnameerr"></span></td>
                </tr>


                <tr>
                    <td>
                        <input type="submit" value="提交" class="btn btn-success">
                    </td>
                    <td>
                        <input type="reset" value="取消" class="btn btn-default" onclick="myclose(1)">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>

</body>

</html>