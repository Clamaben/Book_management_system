<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='security' uri='http://www.springframework.org/security/tags' %>
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
    <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">图书管理</a>
    <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
            <a class="nav-link" href="${root}/toLogin" >登出</a>
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
                        <p class="nav-link" id="showUser">
                            用户列表
                        </p>
                    </li>
                    <li class="nav-item">
                        <p class="nav-link" id="addUser">
                            添加用户
                        </p>
                    </li>
                </ul>

            </div>
        </nav>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">


        </main>
    </div>
</div>

<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>

<script>
    $('#addUser').click(function () {
        console.log("------------")

        $('main').html('<div class="container">\n' +
            '<div class="py-5 text-center">\n' +
            '<h3>设置个人信息</h3>\n' +
            '</div>\n' +
            '<div class="col-md-12 ">\n' +
            '<form>\n' +
            '\n' +

            '<div align="center">\n' +
            '<div class="col-md-6" >\n' +
            '<label>欢迎用户</label>\n' +
            '<security:authentication property="principal.username"></security:authentication>\n' +
            '<hr/></div>\n' +
            '</div>\n' +
            '<div align="center">\n' +
            '<div class="col-md-6" >\n' +


            '<label >用户名&nbsp; &nbsp;&nbsp;</label>\n' +
            '<input type="text" id="username" >\n' +
            '</div>\n' +
            '</div>\n' +
            '<div align="center">\n' +
            '<div class="col-md-6" >\n' +

            '<label for="Password">密码&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>\n' +
            '<input type="password" id="password"  >\n' +
            '</div>\n' +
            '</div>\n' +
            '<div align="center">\n' +
            '<div class="col-md-6" >\n' +

            '<label >权限&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</label>\n' +
            '<select id=role>' +
            '<option  value="ADMIN">&nbsp;&nbsp;ADMIN  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option> ' +
            '<option value="LIBRARIAN">LIBRARIAN&nbsp;&nbsp;</option> ' +
            '<option value="BORROWER">BORROWER&nbsp;&nbsp;</option> ' +

            '</select >' +
            '</div>\n' +
            '</div>\n' +


            '<div style="margin: 30px" align="center"><button class="btn btn-primary btn-lg btn-block col-md-2" type="button" onclick="addButton(this)">提交</button></div>\n' +
            ' </form>\n' +
            '</div>\n' +
            '</div>\n' +
            '<footer class="my-5 pt-5 text-muted text-center text-small">\n' +
            '<p class="mb-1">&copy; 2019-2020 小谭全球粉丝后援会</p>\n' +
            '</footer>')


    })

    function addButton(e) {
        var id = $('#id').val();
        var username = $('#username').val();
        var password = $('#password').val();
        var role = $('#role').val();

        $.ajax({
            url: '${root}/admin/add',
            type: 'post',
            data: {id: id, username: username, password: password, role: role},
            success: function (jsonData) {
                if (jsonData.code == 0) {
                    alert("添加成功")
                    showAllUser(1);
                }
            },
            error: function () {
                alert("添加失败")
            }
        })
    }

    $('#showUser').click(function () {
        showAllUser(1, 10);
        <%--$.ajax({--%>
        <%--    type: 'post',--%>
        <%--    url: '${root}/admin/getAllUser',--%>
        <%--    data: {},--%>
        <%--    success: function (jsonData) {--%>
        <%--        var text = [];--%>
        <%--        text.push("<div align=\"center\"><h1>所有成员</h1></div>\n" +--%>
        <%--            "<div align=\"center\">\n" +--%>
        <%--            "<ul style=\"display: inline\">");--%>
        <%--        text.push('<table id="users"  class=\"hovertable\">' +--%>
        <%--            '<tr onmouseover=\"this.style.backgroundColor=\'#ffff66\';\" onmouseout=\"this.style.backgroundColor=\'#d4e3e5\';\">' +--%>
        <%--            '<td> id</td>' +--%>
        <%--            '<td> username</td>' +--%>
        <%--            '<td> password</td>' +--%>
        <%--            '<td> role</td>' +--%>

        <%--            '<td> </td>' +--%>
        <%--            '<td> </td>' +--%>

        <%--            '<tr>'--%>
        <%--        );--%>
        <%--        for (var i = 0; i < jsonData.list.length; i++) {--%>
        <%--            text.push(userContent(jsonData.list[i], i + 1));--%>
        <%--        }--%>
        <%--        text.push('<table>');--%>
        <%--        text.push("</ul>\n" +--%>
        <%--            "</div>");--%>

        <%--        $('main').html(text.join(" "));--%>
        <%--    },--%>
        <%--    error: function () {--%>
        <%--        alert('error');--%>
        <%--    }--%>
        <%--})--%>
    })


    function showAllUser(pageNum) {
        $.ajax({
            type: 'post',
            url: '${root}/admin/getAllUser?pageNum=' + pageNum + "&pageSize=10",
            data: {},

            success: function (jsonData) {
                console.log(jsonData);
                var text = [];
                text.push(
                    "<div  align=\"center\">\n"
                  );
                text.push(" <table class=\"table table-hover\">\n" +
                    "                <thead>\n" +
                    "                <tr>\n" +
                    "                    <th scope=\"col\">Id</th>\n" +
                    "                    <th scope=\"col\">username</th>\n" +
                    "                    <th scope=\"col\">password</th>\n" +
                    "                    <th scope=\"col\">role</th>\n" +
                    "                    <th scope=\"col\"></th>\n" +
                    "                    <th scope=\"col\"></th>\n" +
                    "                </tr>\n" +
                    "                </thead>\n" +
                    "                <tbody>");
                for (var i = 0; i < jsonData.pageInfo.list.length; i++) {
                    text.push(userContent(jsonData.pageInfo.list[i], i + 1));
                }
                text.push(" </tbody>\n" +
                    "            </table>");
                text.push(
                    "</div>");
                //添加分页的nav
                text.push("<nav aria-label=\"Page navigation example\">\n" +
                    "  <ul class=\"pagination justify-content-center\">");
                if(jsonData.pageInfo.hasPreviousPage){
                    text.push("<li class=\"page-item\">" +
                        "<a class=\"page-link\" onclick='BorroweRecord("+jsonData.pageInfo.prePage+",10)' aria-label=\"Previous\">" +
                        "<span aria-hidden=\"true\">&laquo;</span>\n" +
                        "<span class=\"sr-only\">Previous</span>" +
                        "</a>" +
                        "</li>\n");
                }
                for (var i =0;i<jsonData.pageInfo.pages;i++) {
                    if (i==jsonData.pageInfo.pageNum-1) {
                        text.push("<li class=\"page-item\"><a class=\"page-link\"" +
                            "onclick='showAllUser("+jsonData.pageInfo.navigatepageNums[i]+")'" +
                            ">"
                            +jsonData.pageInfo.navigatepageNums[i]+
                            "</a></li>\n");
                    }else{
                        text.push("<li class=\"page-item\"><a class=\"page-link\"" +
                            " onclick='showAllUser("+jsonData.pageInfo.navigatepageNums[i]+")'>"
                            +jsonData.pageInfo.navigatepageNums[i]+
                            "</a></li>\n");
                    }
                }
                if(jsonData.pageInfo.hasNextPage){
                    text.push("<li class=\"page-item\">\n" +
                        "      <a class=\"page-link\" onclick='showAllUser("+jsonData.pageInfo.nextPage+")' aria-label=\"Next\">\n" +
                        "        <span aria-hidden=\"true\">&raquo;</span>\n" +
                        "        <span class=\"sr-only\">Next</span>\n" +
                        "      </a>\n" +
                        "    </li>");}

                // }
                // if (jsonData.pageInfo.hasNextPage) {
                //     text.push('<div align=\"center\"><button value=' + jsonData.pageInfo.nextPage + ' class="btn btn-secondary" onclick="jumpPage(this)">下一页</button></div> ');
                // }

                $('main').html(text.join(" "));
            },
            error: function () {
                alert('error');
            }
        })
    }
    function jumpPrevPage(e) {
        // console.log("\n-----e:"+e);
        var str = e.value;
        var strs = new Array(); //定义一数组

        strs = str.split("_"); //字符分割
        console.log(strs[0]);

        if (strs[0]-1<1) {
            alert("当前已经是第一页");
            return;
        }

        // console.log("\n-----page:");

        showAllUser(strs[0]-1);

    }
    function jumpPage(e) {
        // console.log("\n-----e:"+e);
        var str = e.value;
        var strs = new Array(); //定义一数组

        strs = str.split("_"); //字符分割
        console.log(strs[0]);

        if (strs[0] >= strs[1]||strs[0]==0) {
            alert("当前已经到达最后一页");
            return;
        }
        console.log("正在跳转至第"+str[0]+"页")
        // console.log("\n-----page:");

        showAllUser(strs[0]);

    }

    function userContent(data, i) {

        var str = '<tr> ' +

            '<th scope=\"row\">' + data.id + '</th>' +
            '<td >' + data.username + '</td>' +
            '<td >' + data.password + '</td>' +
            '<td >' + data.role + '</td>' +

            '<td ><button value=' + data.id + "_" + i + ' class="btn btn-secondary" onclick="deleteUserById(this)">删除</button></td>\n' +
            '<td  ><button value=' + data.id + "_" + data.username + "_" + data.password + "_" + data.role + "_" + ' class="btn btn-secondary" onclick="updateUserById(this)">修改</button></td>\n' +
            '   </tr>        '
        return str;
    }

    function updateUserById(e) {
        var data = e.value;
        var str = data.toString();
        var strs = new Array(); //定义一数组
        strs = str.split("_"); //字符分割

        $('main').html('<div class="container">\n' +
            '<div class="py-5 text-center">\n' +
            '<h3>设置个人信息</h3>\n' +
            '</div>\n' +
            '<div class="col-md-12 ">\n' +
            '<form>\n' +
            '\n' +

            '<div align="center">\n' +
            '<div class="col-md-6" >\n' +
            '<label>欢迎用户</label>\n' +
            '<security:authentication property="principal.username"></security:authentication>\n' +
            '<hr/></div>\n' +
            '</div>\n' +
            '<div align="center">\n' +
            '<div class="col-md-6" >\n' +

            '<label >id</label>\n' +
            '<input  id="id" type="hidden" value="' + strs[0] + '">\n' +
            '</div>\n' +
            '</div>\n' +
            '<div align="center">\n' +
            '<div class="col-md-6" >\n' +

            '<label >用户名&nbsp; &nbsp;&nbsp;</label>\n' +
            '<input type="text" id="username" value="' + strs[1] + '">\n' +
            '</div>\n' +
            '</div>\n' +
            '<div align="center">\n' +
            '<div class="col-md-6" >\n' +

            '<label for="Password">密码&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>\n' +
            '<input type="password" id="password"  value="' + strs[2] + '">\n' +
            '</div>\n' +
            '</div>\n' +
            '<div align="center">\n' +
            '<div class="col-md-6" >\n' +

            '<label >权限&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</label>\n' +
            '<select id=role>' +
            '<option  value="ADMIN">&nbsp;&nbsp;ADMIN  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option> ' +
            '<option value="LIBRARIAN">LIBRARIAN&nbsp;&nbsp;</option> ' +
            '<option value="BORROWER">BORROWER&nbsp;&nbsp;</option> ' +

            '</select >' +
            // '<input type="text" id="role" value="'+strs[3]+'">\n' +
            '</div>\n' +
            '</div>\n' +


            '<div style="margin: 30px" align="center"><button class="btn btn-primary btn-lg btn-block col-md-2" type="button" onclick="updateButton(this)">提交</button></div>\n' +
            ' </form>\n' +
            '</div>\n' +
            '</div>\n' +
            '<footer class="my-5 pt-5 text-muted text-center text-small">\n' +
            '<p class="mb-1">&copy; 2019-2020 小谭全球粉丝后援会</p>\n' +
            '</footer>')
    }

    function updateButton(e) {
        var id = $('#id').val();
        var username = $('#username').val();
        var password = $('#password').val();
        var role = $('#role').val();
        console.log(role);
        $.ajax({
            url: '${root}/admin/updateById',
            type: 'post',
            data: {id: id, username: username, password: password, role: role},
            success: function (jsonData) {
                if (jsonData.code == 0) {
                    alert("修改成功")
                    showAllUser();
                }
            },
            error: function () {
                alert("删除失败")
            }
        })
    }

    function deleteUserById(e) {
        var str = e.value.toString();
        var strs = new Array(); //定义一数组
        strs = str.split("_"); //字符分割
        // console.log(strs[0]+"-----"+strs[1]);
        // var tab2 = document.getElementById("users");
        // tab2.deleteRow(strs[1]);
        var index = $(e).parents("tr").index(); //这个可获取当前tr的下标
        $(e).parents("tr").remove();
        $.ajax({
            url: '${root}/admin/delUserById?id=' + strs[0],
            type: 'post',
            success: function (jsonData) {
                if (jsonData.code == 0) {
                    alert("删除成功")

                }
            },
            error: function () {
                alert("删除失败")
            }
        })
    }


    $('#loanRecord').click(function () {
        alert("借阅记录")
    })
    $('#personalInformation').click(function () {
        $('main').html('<div class="container">\n' +
            '<div class="py-5 text-center">\n' +
            '<h3>设置个人信息</h3>\n' +
            '</div>\n' +
            '<div class="col-md-12 ">\n' +
            '<form>\n' +
            '\n' +
            '<div align="center">\n' +
            '<div class="col-md-6" >\n' +
            '<label>欢迎用户</label>\n' +
            '<security:authentication property="principal.username"></security:authentication>\n' +
            '<hr/></div>\n' +
            '</div>\n' +
            '<div align="center">\n' +
            '<div class="col-md-6" >\n' +
            '<label for="Password">更改密码</label>\n' +
            '<input type="text" id="Password">\n' +
            '</div>\n' +
            '</div>\n' +
            '<div style="margin: 30px" align="center"><button class="btn btn-primary btn-lg btn-block col-md-2" type="button" id="settiingButton">提交</button></div>\n' +
            ' </form>\n' +
            '</div>\n' +
            '</div>\n' +
            '<footer class="my-5 pt-5 text-muted text-center text-small">\n' +
            '<p class="mb-1">&copy; 2019-2020 小谭全球粉丝后援会</p>\n' +
            '</footer>')
    })


</script>
</body>
</html>
