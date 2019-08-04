<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>图书管理员界面</title>
    <!-- Custom styles for this template -->
    <link href="static/menu.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
    <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">图书管理</a>
    <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search" style="background-color:rgba(128,128,128,0.75)">
    <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
            <a class="nav-link" href="#">登出</a>
        </li>
    </ul>
</nav>

<div class="container-fluid">
    <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
            <div class="sidebar-sticky">

                <h4 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                    <span>管理</span>
                </h4>
                <ul class="nav nav-tabs flex-column mb-2">
                <li class="nav-item">
                    <a class="nav-link" id="bookList">
                        图书列表
                    </a>
                </li>
                </ul>
                <h4 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                    <span>设置</span>
                </h4>
                <ul class="nav nav-tabs flex-column mb-2">
                    <li class="nav-item">
                        <a class="nav-link" id="personalInformation">
                            个人信息
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
            <h2>Show</h2>
            <div class="table-responsive">
                <table id="tb" class="table table-striped table-sm">
                    <thead>
                    <tr>
                        <th class="samewidth">书名</th>
                        <th class="samewidth">ISBN编码</th>
                        <th class="samewidth">类型</th>
                        <th class="samewidth">描述</th>
                        <th class="samewidth">操作</th>
                    </tr>
                    </thead>
                    <tbody id="tb1">

                    </tbody>
</table>
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
        $('#bookList').click(
            function () {
                $('main').html("<h2>Show</h2>\n" +
                    "            <div class=\"table-responsive\">\n" +
                    "                <table id=\"tb\" class=\"table table-striped table-sm\">\n" +
                    "                    <thead>\n" +
                    "                    <tr>\n" +
                    "                        <th class=\"samewidth\">书名</th>\n" +
                    "                        <th class=\"samewidth\">ISBN编码</th>\n" +
                    "                        <th class=\"samewidth\">类型</th>\n" +
                    "                        <th class=\"samewidth\">描述</th>\n" +
                    "                        <th class=\"samewidth\">操作</th>\n" +
                    "                    </tr>\n" +
                    "                    </thead>\n" +
                    "                    <tbody id=\"tb1\">\n" +
                    "\n" +
                    "                    </tbody>\n" +
                    "</table>\n" +
                    "            </div>");
                booktable();
            }
        )

</script>
<script>
    $('#personalInformation').click(function () {
        $('main').html(" <div class=\"container\">\n" +
            "                <div class=\"py-5 text-center\">\n" +
            "                    <h3>设置个人信息</h3>\n" +
            "                </div>\n" +
            "                <div class=\"col-md-12 \">\n" +
            "                    <form class=\"needs-validation\" novalidate>\n" +
            "\n" +
            "                        <div align=\"center\">\n" +
            "                            <div class=\"col-md-6\" >\n" +
            "                                <label for=\"Name\">用户名</label>\n" +
            "                                <input type=\"text\" class=\"form-control\" id=\"Name\"  placeholder=\"\" value=\"\" required>\n" +
            "                                <div class=\"invalid-feedback\">\n" +
            "                                    请输入用户名\n" +
            "                                </div>\n" +
            "                            </div>\n" +
            "                        </div>\n" +
            "                        <div align=\"center\">\n" +
            "                            <div class=\"col-md-6\" >\n" +
            "                                <label for=\"Password\">密码</label>\n" +
            "                                <input type=\"text\" class=\"form-control\" id=\"Password\"  placeholder=\"\" value=\"\" required>\n" +
            "                                <div class=\"invalid-feedback\">\n" +
            "                                    请输入密码\n" +
            "                                </div>\n" +
            "                            </div>\n" +
            "                        </div>\n" +
            "                        <div style=\"margin: 30px\" align=\"center\"><button class=\"btn btn-primary btn-lg btn-block col-md-2\" type=\"submit\">提交</button></div>\n" +
            "                    </form>\n" +
            "                </div>\n" +
            "            </div>\n" +
            "            <footer class=\"my-5 pt-5 text-muted text-center text-small\">\n" +
            "                <p class=\"mb-1\">&copy; 2019-2020 小谭全球粉丝后援会</p>\n" +
            "            </footer>")
    });
</script>
<script type="text/javascript">
    window.onload = function () {
        booktable();
    }
</script>

//图书列表函数
<script>
function booktable() {
    $.ajax({
        type:'post',
        datatype:'json',
        url:'${root}/getAllBooks',
        data:{},
        success: function (jsonData) {
            console.log(jsonData)
            bookList(jsonData.Books)
        },
        error: function (data) {
            alert("失败了");
        }
    });
    }
function bookList(dataArray) {
    $.each(dataArray, function (index, item) {
        var id = item.id;
        var tr;
        tr += "<td class='samewidth'>" + item.name + "</td>";
        tr += "<td class='samewidth'>" + item.isbn + "</td>";
        tr += "<td class='samewidth'>" + item.type + "</td>";
        tr += "<td class='samewidth'>" + item.description.substring(0, 10) + "</td>";
        tr += "<td class='samewidth'>" + "<button onclick=\"edit(" + id + ")\">编辑</button> <button onclick=\"del(" + id + ",this)\">删除</button>" + "</td>";
        $("#tb1").append("<tr>" + tr + "</tr>");
    })
}
</script>
<script>
function edit(id) {
    $.ajax({
        type: 'post',
        url: '${root}/getBookByid',
        data: {id:id},
        success: function (json) {
            var str =  "<div class=\"container\">\n" +
                "    <div class=\"py-5 text-center\">\n" +
                "        <img class=\"d-block mx-auto mb-4\" src=\"https://getbootstrap.com/assets/brand/bootstrap-solid.svg\" alt=\"\" width=\"72\" height=\"72\">\n" +
                "        <h2>图书信息编辑</h2>\n" +
                "    </div>\n" +
                "    <div class=\"container\">\n" +
                "        <div class=\"col-md-12 mb-3\">\n" +
                "            <h4 class=\"mb-3\">图书信息</h4>\n" +
                "            <form class=\"needs-validation\" novalidate>\n" +
                "                <div class=\"row\">\n" +
                "                    <div class=\"col-md-6 mb-3\">\n" +
                "                        <label for=\"firstName\">书名</label>\n" +
                "                        <input type=\"text\" class=\"form-control\" value=\""+json.Book.name+"\" id=\"firstName\" required>\n" +
                "                    </div>\n" +
                "                </div>\n" +
                "                <div class=\"mb-3\">\n" +
                "                    <label for=\"email\" placehoder>IBSN编码</label>\n" +
                "                    <input type=\"email\" class=\"form-control\" value=\""+json.Book.isbn+"\" id=\"email\" >\n" +
                "                </div>\n" +
                "\n" +
                "                <div class=\"mb-3\">\n" +
                "                    <label for=\"address\">书籍类型</label>\n" +
                "                    <input type=\"text\" class=\"form-control\" value=\""+json.Book.type+"\" id=\"address\"  required>\n" +
                "                </div>\n" +
                "\n" +
                "                <div class=\"mb-3\">\n" +
                "                    <label for=\"address2\">书籍描述</label>\n" +
                "                    <input type=\"text\" class=\"form-control\" value=\""+json.Book.description+"\" id=\"address2\" >\n" +
                "                </div>\n" +
                "\n" +
                "                <hr class=\"mb-4\">\n" +
                "                <button class=\"btn btn-primary btn-lg btn-block\" type=\"submit\">提交修改</button>\n" +
                "            </form>\n" +
                "        </div>\n" +
                "    </div>\n" +
                "\n" +
                "    <footer class=\"my-5 pt-5 text-muted text-center text-small\">\n" +
                "        <p class=\"mb-1\">&copy; 2019-2020 小谭全球粉丝后援会</p>\n" +
                "    </footer>\n" +
                "</div>";
            $('main').html(str);
        },
        error: function (data) {

        }
    });
}
</script>
<script>
    function del(id,tag) {
        $.ajax({
            type: 'post',
            url:'${root}/librarian/deleteBookById',
            //data
            data:{id:id},
            success:function (jsonData) {
                if(jsonData.code ==1)
                {
                    $(tag).parents('tr').remove();
                }
                if(jsonData.code ==2)
                {
                    alert("书籍不存在");
                }
            },
            error:function () {
                alert("删除失败");
            }
        });
    }
</script>
</body>
</html>