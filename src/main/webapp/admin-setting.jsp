<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Dashboard Template for Bootstrap</title>
    <!-- Custom styles for this template -->
    <link href="menu.css" rel="stylesheet">
</head>

<body>
<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
    <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">菜单</a>
    <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search" style="background-color:lightgray">
    <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
            <a class="nav-link" href="#">注销</a>
        </li>
    </ul>
</nav>

<div class="container-fluid">
    <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
            <div class="sidebar-sticky">

                <h4 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                    <span>功能列表</span>
                </h4>

                <ul class="nav nav-tabs flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" id="recomendBooks" href="#">
                            推荐书籍
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="queryBooks" href="#">
                            查询书籍
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"id="booksBorrowed" href="#">
                            已借阅书籍
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="loanRecord" href="#">
                            借阅记录
                        </a>
                    </li>
                </ul>

                <h4 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                    <span>设置</span>
                </h4>



                <ul class="nav nav-tabs flex-column mb-2">
                    <li class="nav-item">
                        <a class="nav-link" id="personalInformation" herf="#">
                            个人信息
                        </a>

                    </li>

                </ul>
            </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
            <div class="container">
                <div class="py-5 text-center">
                    <h3>设置个人信息</h3>
                </div>
                <div class="col-md-12 ">
                    <form class="needs-validation" novalidate>

                        <div align="center">
                            <div class="col-md-6" >
                                <label for="Name">用户名</label>
                                <input type="text" class="form-control" id="Name"  placeholder="" value="" required>
                                <div class="invalid-feedback">
                                    请输入用户名
                                </div>
                            </div>
                        </div>
                        <div align="center">
                            <div class="col-md-6" >
                                <label for="Password">密码</label>
                                <input type="text" class="form-control" id="Password"  placeholder="" value="" required>
                                <div class="invalid-feedback">
                                    请输入密码
                                </div>
                            </div>
                        </div>


                        <div style="margin: 30px" align="center"><button class="btn btn-primary btn-lg btn-block col-md-2" type="submit">提交</button></div>
                    </form>
                </div>
            </div>

            <footer class="my-5 pt-5 text-muted text-center text-small">
                <p class="mb-1">&copy; 2019-2020 小谭全球粉丝后援会</p>
            </footer>


    </main>
    </div>
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
    feather.replace()
</script>
<script>
    $('#recomendBooks').click(function () {
        window.open("")
    })
    $('#queryBooks').click(function () {
        alert("查询书籍")
    })
    $('#booksBorrowed').click(function () {
        alert("已借阅书籍")
    })
    $('#loanRecord').click(function () {
        alert("借阅记录")
    })
    $('#personalInformation').click(function () {
        window.open("toSetting","_self")
    })

</script>
</body>
</html>
