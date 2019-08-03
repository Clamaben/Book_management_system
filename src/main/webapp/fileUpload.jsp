<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 10902
  Date: 2019/8/3
  Time: 9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>图片上传</title>
</head>
<body>

<div class="file-box">
    <img id="preview" />
    <input type="file" name="file" id = "input_file" accept="image/*" ><br>
    <button onclick="upload()">提交</button>
</div>

<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<!-- popper.min.js 用于弹窗、提示、下拉菜单 -->
<script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
<!-- 最新的 Bootstrap4 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
<!-- Icons -->
<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
<script>
    function upload() {
        var formData = new FormData();
        formData.append('file', $('#input_file')[0].files[0]);  //添加图片信息的参数
        $.ajax({
            url: '${root}/librarian/upload',
            type: 'POST',
            cache: false, //上传文件不需要缓存
            data: formData,
            processData: false, // 告诉jQuery不要去处理发送的数据
            contentType: false, // 告诉jQuery不要去设置Content-Type请求头
            success: function (data) {
                //这个是成功失败的标志，0是成功，1是失败。如果失败了会有msg但是没有fileUrl
                console.log(data.code);
                //这个是返回信息
                console.log(data.msg);
                //这个是图片地址，访问图片还要在图片地址前面加上  ${root}/images
                //这个在新增书籍的时候也传到服务器上
                console.log(data.img_url);
            },
            error: function () {
                alert("上传失败");
            }
        })
    }
</script>
</body>
</html>