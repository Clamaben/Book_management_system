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
         <div align="center"><h1>推荐书籍</h1></div>
            <div>
                <ul style="display: inline">
                    <li style="display: inline-block">
                        <div style="margin: 30px">
                            <div class="cover shadow-cover">
                                <img src="${root}/people/bookpic/1.jpg" width="60%"height="60%"></img>
                            </div>

                            <div class="info">
                                <h4 class="title">地下巴黎</h4>
                                <h6 class="author">洛朗多伊奇</h6>
                            </div>
                        </div>
                    </li>
                    <li style="display: inline-block">
                        <div style="margin: 30px">
                            <div class="cover shadow-cover">
                                <img src="${root}/people/bookpic/2.jpg"></img>
                            </div>

                            <div class="info">
                                <h4 class="title">聊天记录</h4>
                                <h6 class="author">萨利鲁尼</h6>
                            </div>
                        </div>
                    </li>
                    <li style="display: inline-block">
                        <div style="margin: 30px">
                            <div class="cover shadow-cover">
                                <img src="http://localhost:8080/people/bookpic/3.jpg"></img>
                            </div>

                            <div class="info">
                                <h4 class="title">挪威的森林</h4>
                                <h6 class="author">村上春树</h6>
                            </div>
                        </div>
                    </li>
                    <li style="display: inline-block">
                        <div style="margin: 30px">
                            <div class="cover shadow-cover">
                                <img src="${root}/people/bookpic/4.jpg"width="60%" height="60%"></img>
                            </div>

                            <div class="info">
                                <h4 class="title">发条橙</h4>
                                <h6 class="author">安东尼伯吉斯</h6>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
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
        alert("推荐书籍")
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
        window.open("toSetting")
    })

</script>
</body>
</html>
