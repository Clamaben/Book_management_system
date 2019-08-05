<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='security' uri='http://www.springframework.org/security/tags'%>
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
    <input id="search" class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search" style="background-color:lightgray">
    <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
            <a class="nav-link" href="${root}/toLogin">注销</a>
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
                        <p class="nav-link"id="recomendBooks">
                            推荐书籍
                        </p>

                    </li>
                    <li class="nav-item">
                        <p class="nav-link"id="queryBooks">
                            查询书籍
                        </p>
                    </li>
                    <li class="nav-item">
                        <p class="nav-link"id="booksBorrowed">
                            已借阅书籍
                        </p>
                    </li>
                    <li class="nav-item">
                        <p class="nav-link" id="loanRecord">
                            借阅记录
                        </p>
                    </li>
                </ul>

                <h4 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                    <span>设置</span>
                </h4>

                <ul class="nav nav-tabs flex-column mb-2">
                    <li class="nav-item">
                        <p class="nav-link" id="personalInformation">
                            个人信息
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

</body>
<script>
<%--    界面加载完成第一次默认执行的函数--%>
    window.onload=function (ev) { recommendFunction(1,10); }
</script>
</html>

<script>
    <%--    推荐书籍  --%>
    $('#recomendBooks').click(function () {
        recommendFunction(1,10);
    })
    function recommendFunction(pageNum,pageSize) {
        $.ajax({
            type:'post',
            url:'${root}/borrower/getSomeBooks',
            data:{pageNum:pageNum,pageSize:pageSize},
            success:function (jsonData) {
                var text=[];
                text.push("<div align=\"center\"><h1>推荐书籍</h1></div>\n" +
                    "<div>\n" +
                    "<ul style=\"display: inline\">");

                for (var i=0;i<jsonData.pageInfo.list.length;i++){
                    text.push(recommendContent(jsonData.pageInfo.list[i]));
                }

                text.push("</ul>\n" +
                    "</div>");
                //显示分页
                text.push("<nav aria-label=\"Page navigation example\">\n" +
                    "  <ul class=\"pagination justify-content-center\">");
                if(jsonData.pageInfo.hasPreviousPage){
                    text.push("<li class=\"page-item\">" +
                        "<a class=\"page-link\" onclick='recommendFunction("+jsonData.pageInfo.prePage+",10)' aria-label=\"Previous\">" +
                        "<span aria-hidden=\"true\">&laquo;</span>\n" +
                        "<span class=\"sr-only\">Previous</span>" +
                        "</a>" +
                        "</li>\n");
                }
                for (var i =0;i<jsonData.pageInfo.pages;i++) {
                    if (i==jsonData.pageInfo.pageNum-1) {
                        text.push("<li class=\"page-item\"><a class=\"page-link\"" +
                            "onclick='recommendFunction("+jsonData.pageInfo.navigatepageNums[i]+",10)'" +
                            ">"
                            +jsonData.pageInfo.navigatepageNums[i]+
                            "</a></li>\n");
                    }else{
                        text.push("<li class=\"page-item\"><a class=\"page-link\"" +
                            " onclick='recommendFunction("+jsonData.pageInfo.navigatepageNums[i]+",10)'>"
                            +jsonData.pageInfo.navigatepageNums[i]+
                            "</a></li>\n");
                    }
                }
                if(jsonData.pageInfo.hasNextPage){
                    text.push("<li class=\"page-item\">\n" +
                        "      <a class=\"page-link\" onclick='recommendFunction("+jsonData.pageInfo.nextPage+",10)' aria-label=\"Next\">\n" +
                        "        <span aria-hidden=\"true\">&raquo;</span>\n" +
                        "        <span class=\"sr-only\">Next</span>\n" +
                        "      </a>\n" +
                        "    </li>");
                }
                text.push("  </ul>\n" +
                    "</nav>");

                $('main').html(text.join(" "));
            },
            error:function () {
                alert('error');
            }
        })
    }
    //动态显示图书信息
    function recommendContent(data)  {
        var str='<li style="display: inline-block">\n' +
            '<div style="margin: 30px">\n' +
            '<div class="cover shadow-cover">\n' +
            '<img src="${root}/static/'+data.img_url+' " width="70%"height="70%"></img>\n' +
            '</div>\n' +
            '<div class="info">\n' +
            '<h4 class="title">'+data.name+'</h4>\n' +
            '<h6 class="author">'+data.isbn+'</h6>\n' +
            '</div>\n' +
            '<button type="button" value='+data.id+' class="btn btn-primary" onclick="borrowBook(this)">借书</button>\n' +
            '</div>\n' +
            '</li>';
        return str;
    }
    //借书功能 传 用户name和bookid bookid存在button的value里 调用borrower 的 方法
    function borrowBook(tag){
        var name='<security:authentication property="principal.username"></security:authentication>'
        $.ajax({
            url:'${root}/borrower/BorroweingBookByid',
            type:'post',
            data:{borrowername:name,bookid:tag.value},
            success:function (jsonData) {
                if(jsonData.code==0){
                    alert('借书成功')
                }
            },
            error:function () {
                alert("借书失败")
            }
        })
    }
    //模糊查询书籍 传模糊书名 从最上面的search中获取 输入内容后点击查询书籍
    $('#queryBooks').click(function () {
        var bookname=$('#search').val();
        $.ajax({
            type:'post',
            url:'${root}/getBooksByname',
            data:{name:bookname},
            success:function (jsonData) {
                var text=[];
                text.push("<div align=\"center\"><h1>快速查询</h1></div>\n" +
                    "<div>\n" +
                    "<ul style=\"display: inline\">");

                for (var i=0;i<jsonData.Books.length;i++){
                    text.push(recommendContent(jsonData.Books[i]));
                }
                text.push("</ul>\n" +
                    "</div>");
                $('main').html(text.join(" "));
            },
            error:function () {
                alert('error');
            }
        })
    })
    //显示已借阅书籍，传用户name到后端
    $('#booksBorrowed').click(function () {
        var name='<security:authentication property="principal.username"></security:authentication>'
        $.ajax({
            type:'post',
            url:'${root}/borrower/getBorrowRecord',
            data:{borrowername:name},
            success:function (jsonData) {
                var text=[];
                text.push("<div class=\"container\">\n" +
                    "<div class=\"py-5 text-center\">\n" +
                    "<h3>已借阅书籍</h3>\n" +
                    "</div>\n" +
                    "<div class=\"container\">\n" +
                    "<div class=\"table-responsive\">\n" +
                    "<table class=\"table table-striped table-bordered\">\n" +
                    "<thead>\n" +
                    "<tr>\n" +
                    "<td>书籍名</td>\n" +
                    "<td>作者</td>\n" +
                    "<td>ISBN</td>\n" +
                    "<td>类型</td>\n" +
                    "<td>描述</td>\n" +
                    "<td>操作</td>\n" +
                    " </tr>\n" +
                    "</thead>\n" +
                    "\n" +
                    "<tbody>");

                for (var i=0;i<jsonData.Books.length;i++){
                    text.push(borrowedbookContent(jsonData.Books[i]));
                }

                text.push("</tbody>\n" +
                    "</table>\n" +
                    "</div>\n" +
                    "</div>\n" +
                    "</div>");

                $('main').html(text.join(" "));
            },
            error:function () {
                alert('error');
            }
        })

    })
    //动态显示表格
    function borrowedbookContent(data){
        var str='<tr>\n' +
            '<td>'+data.name+'</td>\n' +
            '<td>'+data.auther+'</td>\n' +
            '<td>'+data.isbn+'</td>\n' +
            '<td>'+data.type+'</td>\n' +
            '<td>'+data.description+'</td>\n' +
            '<td><button value='+data.id+' class="btn btn-secondary" onclick="returnBook(this)">还书</button></td>\n' +
            '</tr>';
        return str;
    }
    //归还书籍 传参用户name和bookid ，bookid存在button里
    function returnBook(tag)
    {
        var name='<security:authentication property="principal.username"></security:authentication>'
        $.ajax({
            url:'${root}/borrower/ReturningBookByid',
            type:'post',
            data:{borrowername:name,bookid:tag.value},
            success:function (jsonData) {
                if(jsonData.code==0){
                    alert("还书成功")
                    $(tag).parents('tr').remove();

                }
            },
            error:function () {
                alert("还书失败")
            }
        })
    }

    $('#loanRecord').click(function () {
        BorroweRecord(1,10);
    })
    function BorroweRecord (pageNum,pageSize) {
        var name='<security:authentication property="principal.username"></security:authentication>'
        $.ajax({
            url:'${root}/borrower/getSomeBR',
            type:'post',
            data:{pageNum:pageNum,pageSize:pageSize,borrowername:name},
            success:function (jsonData) {
                if(jsonData.code==0){
                    var text=[];
                    text.push(" <table class=\"table table-hover\">\n" +
                        "                <thead>\n" +
                        "                <tr>\n" +
                        "                    <th scope=\"col\">Id</th>\n" +
                        "                    <th scope=\"col\">BookName</th>\n" +
                        "                    <th scope=\"col\">BorrowTime</th>\n" +
                        "                    <th scope=\"col\">Status</th>\n" +
                        "                </tr>\n" +
                        "                </thead>\n" +
                        "                <tbody>");
                    for (var i = 0; i <jsonData.pageInfo.list.length; i++) {
                        text.push("    <tr>\n" +
                            "      <th scope=\"row\">"+jsonData.pageInfo.list[i].recordId+"</th>\n" +
                            "      <td>"+jsonData.books[i].name+"</td>\n" +
                            "      <td>"+jsonData.pageInfo.list[i].borrowTime+"</td>\n")
                        if (jsonData.pageInfo.list[i].status == 0) {
                            text.push("      <td><img src=\"${root}/static/images/backbook_red.png\" style=\" width: 30px;height: 30px;\"></img></td>\n" +
                                "    </tr>\n")
                        }else {
                            text.push("      <td><img src=\"${root}/static/images/backbook_green.png\"  style=\" width: 30px;height: 30px;\"></img></td>\n" +
                                "    </tr>\n")
                        }
                    }
                        text.push(" </tbody>\n" +
                            "            </table>");

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
                                    "onclick='BorroweRecord("+jsonData.pageInfo.navigatepageNums[i]+",10)'" +
                                    ">"
                                    +jsonData.pageInfo.navigatepageNums[i]+
                                    "</a></li>\n");
                            }else{
                                text.push("<li class=\"page-item\"><a class=\"page-link\"" +
                                    " onclick='BorroweRecord("+jsonData.pageInfo.navigatepageNums[i]+",10)'>"
                                    +jsonData.pageInfo.navigatepageNums[i]+
                                    "</a></li>\n");
                            }
                        }
                        if(jsonData.pageInfo.hasNextPage){
                            text.push("<li class=\"page-item\">\n" +
                                "      <a class=\"page-link\" onclick='BorroweRecord("+jsonData.pageInfo.nextPage+",10)' aria-label=\"Next\">\n" +
                                "        <span aria-hidden=\"true\">&raquo;</span>\n" +
                                "        <span class=\"sr-only\">Next</span>\n" +
                                "      </a>\n" +
                                "    </li>");
                        }
                        text.push("  </ul>\n" +
                            "</nav>");
                        $('main').html(text.join(" "));
                    }else {
                        alert("无借阅记录");
                    }
                },
                error:function () {
                    alert("error");
                }
            })

    }
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
            '<div style="margin: 30px" align="center"><button class="btn btn-primary btn-lg btn-block col-md-2" type="button" id="settiingButton" onclick="settingInformation()">提交</button></div>\n' +
            ' </form>\n' +
            '</div>\n' +
            '</div>\n' +
            '<footer class="my-5 pt-5 text-muted text-center text-small">\n' +
            '<p class="mb-1">&copy; 2019-2020 小谭全球粉丝后援会</p>\n' +
            '</footer>')
    })
    //因为用户名成为标识了，所以修改个人信息不允许修改用户名，只能修改密码
    function settingInformation() {
        var name='<security:authentication property="principal.username"></security:authentication>'
        var changedPassword=$('#Password').val();
        $.ajax({
            type:'post',
            url:'${root}/self/updateByName',
            data:{username:name,password:changedPassword},
            success:function (jsonData) {
                alert('修改成功')
            },
            error:function () {
                alert('error');
            }
        })
    }
</script>
