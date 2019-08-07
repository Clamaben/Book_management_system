<%--
  Created by IntelliJ IDEA.
  User: 94816
  Date: 2019/8/2
  Time: 16:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Checkout example for Bootstrap</title>
    <!-- Custom styles for this template -->
    <link href="form-validation.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container">


    <div class="row">
        <div class="col-md-6 order-md-2 mb-4">
            <img src="${root}/static/images/background03.jpg" width="100%" height="100%">
        </div>
        <div class="col-md-6 order-md-1">
            <div class="py-5 text-center">
                <h2>注册页面</h2>
            </div>
            <form class="needs-validation" novalidate>

                <div class="mb-3">
                    <label for="username">用户名</label>
                    <div class="input-group">
                        <input type="text" class="form-control" id="username" placeholder="用户名" required>
                        <div class="invalid-feedback" style="width: 100%;">
                            用户名不能为空
                        </div>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="password">密码</label>
                    <div class="input-group">
                        <input type="text" class="form-control" id="password" placeholder="密码" required>
                        <div class="invalid-feedback" style="width: 100%;">
                            密码不能为空
                        </div>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="passwordAgain">确认密码</label>
                    <div class="input-group">
                        <input type="text" class="form-control" id="passwordAgain" placeholder="再一次输入密码" required>
                        <div class="invalid-feedback" style="width: 100%;">
                           密码不能为空/两次密码必须一致
                        </div>
                    </div>
                </div>

                <hr class="mb-4">
                <button class="btn btn-primary btn-lg btn-block" type="button" onclick="finishRegister()">完成注册</button>
            </form>
        </div>
    </div>

    <footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-1">&copy; 2019-2020 </p>
    </footer>
</div>


<script>
function finishRegister() {
    if($('#username').val()=="")
    {
        alert('用户名不能为空');
        return;
    }
    if($('#password').val()=="")
    {
        alert('密码不能为空');
        return;
    }
    if($('#passwordAgain').val()=="")
    {
        alert('确认密码不能为空');
        return;
    }
    if($('#password').val()!=$('#passwordAgain').val())
    {
        alert('两次代码需要一致');
        return;
    }
    var name=$('#username').val()
    var password=$('#password').val()
    $.ajax({
        type:'post',
        url:'${root}/register',
        data:{username:name,password:password},
        success:function (jsonData) {
            if(jsonData.code==2){
                alert("注册失败，用户名重复")
            }
            if (jsonData.code==0)
            {
                alert("注册成功")
            }
            if(jsonData.code==1)
            {
                alert("失败")
            }
        },
        error:function () {
            alert('error');
        }
    })
}
</script>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
</body>
</html>
