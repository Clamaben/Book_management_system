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
    <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search" style="background-color:rgba(128,128,128,0.75)" id="search">
    <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
            <a class="nav-link" href="#" id="queryBooks">查询</a>
        </li>
    </ul>
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
            <div>
                <button onclick="add()">添加书籍</button>
            </div>
            <div class="table-responsive">
                <table id="tb" class="table table-striped table-sm">
                    <thead>
                    <tr>
                        <th class="samewidth">书名</th>
                        <th class="samewidth">ISBN编码</th>
                        <th class="samewidth">类型</th>
                        <th class="samewidth">描述</th>
                        <th class="samewidth">库存</th>
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
<%--//图书列表--%>
<script>
        $('#bookList').click(
            function () {
                $('main').html("<h2>Show</h2>\n" +
                    "            <div class=\"table-responsive\">\n" +
                        "<div>\n" +
                    "                <button onclick=\"add()\">添加书籍</button>\n" +
                    "            </div>\n"+
                    "                <table id=\"tb\" class=\"table table-striped table-sm\">\n" +
                    "                    <thead>\n" +
                    "                    <tr>\n" +
                    "                        <th class=\"samewidth\">书名</th>\n" +
                    "                        <th class=\"samewidth\">ISBN编码</th>\n" +
                    "                        <th class=\"samewidth\">类型</th>\n" +
                    "                        <th class=\"samewidth\">描述</th>\n" +
                    "                        <th class=\"samewidth\">库存</th>\n" +
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
<%--//个人信息修改--%>
<script>
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
    //因为用户名成为标识了，所以修改个人信息不允许修改用户名，只能修改密码
    function settingInformation() {
        var name='<security:authentication property="principal.username"></security:authentication>'
        var changedPassword=$('#Password').val();
        $.ajax({
            type:'post',
            url:'${root}/AdminController/updateByName',
            data:{name:name,password:changedPassword},
            success:function (jsonData) {
                alert('修改成功')
            },
            error:function () {
                alert('error');
            }
        })
    }
</script>
<%--//页面初始化--%>
<script type="text/javascript">
    window.onload = function () {
        booktable();
    }
</script>
<%--//图书列表函数--%>
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
        tr += "<td class=\"samewidth\">" + item.name + "</td>";
        tr += "<td class=\"samewidth\">" + item.isbn + "</td>";
        tr += "<td class=\"samewidth\">" + item.type + "</td>";
        tr += "<td class=\"samewidth\">" + item.description.substring(0, 10) + "</td>";
        tr += "<td class=\"samewidth\">" + item.stock + "</td>";
        tr += "<td class=\"samewidth\">" + "<button onclick=\"edit(" + id + ")\">编辑</button> <button onclick=\"del(" + id + ",this)\">删除</button>" + "</td>";
        $("#tb1").append("<tr>" + tr + "</tr>");
    })
}
</script>
<%--//编辑功能--%>
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
                "                        <label for=\"bookName\">书名</label>\n" +
                "                        <input type=\"text\" class=\"form-control\" value=\""+json.Book.name+"\" id=\"bookName\" required>\n" +
                "                    </div>\n" +
                "                </div>\n" +
                "                <div class=\"mb-3\">\n" +
                "                    <label for=\"ISBN\" placehoder>ISBN编码</label>\n" +
                "                    <input type=\"email\" class=\"form-control\" value=\""+json.Book.isbn+"\" id=\"ISBN\" >\n" +
                "                </div>\n" +
                "\n" +
                "                <div class=\"mb-3\">\n" +
                "                    <label for=\"bookType\">书籍类型</label>\n" +
                "                    <input type=\"text\" class=\"form-control\" value=\""+json.Book.type+"\" id=\"bookType\"  required>\n" +
                "                </div>\n" +
                "\n" +
                "                <div class=\"mb-3\">\n" +
                "                    <label for=\"description\">书籍描述</label>\n" +
                "                    <input type=\"text\" class=\"form-control\" value=\""+json.Book.description+"\" id=\"description\" >\n" +
                "                </div>\n" +
                "\n" +
                "                <div class=\"col-md-3 mb-3\">\n" +
                "                    <label for=\"stock\">库存</label>\n" +
                "                    <input type=\"text\" class=\"form-control\" value=\""+json.Book.stock+"\" id=\"stock\"  required>\n" +
                "                </div>\n" +
                "\n" +
                "<div class=\"file-box\">\n" +
                "                    <label for=\"address\">上传新图片</label>\n" +
                "    <img id=\"preview\" />\n" +
                "    <input type=\"file\" name=\"file\" id = \"input_file\" accept=\"image/*\" value=\""+json.Book.img_url+"\"><br>\n" +
                "    <button onclick=\"upload()\">上传</button>\n" +
                "</div>"+
                "                <hr class=\"mb-4\">\n" +
                "                <button class=\"btn btn-primary btn-lg btn-block\" type=\"submit\" onclick=\"updateBook()\">提交修改</button>\n" +
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
            alert("请求出错！！");
        }
    });
}
</script>
<%--删除功能--%>
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
<%--添加功能--%>
<script>
    function add() {
        $('main').html("<div class=\"container\">\n" +
            "    <div class=\"py-5 text-center\">\n" +
            "        <img class=\"d-block mx-auto mb-4\" src=\"https://getbootstrap.com/assets/brand/bootstrap-solid.svg\" alt=\"\" width=\"72\" height=\"72\">\n" +
            "        <h2>图书信息添加</h2>\n" +
            "    </div>\n" +
            "    <div class=\"container\">\n" +
            "        <div class=\"col-md-12 mb-3\">\n" +
            "            <h4 class=\"mb-3\">图书信息</h4>\n" +
            "            <form class=\"needs-validation\" novalidate>\n" +
            "                <div class=\"row\">\n" +
            "                    <div class=\"col-md-6 mb-3\">\n" +
            "                        <label for=\"bookName\">书名</label>\n" +
            "                        <input type=\"text\" class=\"form-control\" id=\"bookName\" required>\n" +
            "                    </div>\n" +
            "                </div>\n" +
            "                <div class=\"mb-3\">\n" +
            "                    <label for=\"ISBN\" placehoder>ISBN编码</label>\n" +
            "                    <input type=\"email\" class=\"form-control\"  id=\"ISBN\" >\n" +
            "                </div>\n" +
            "\n" +
            "                <div class=\"mb-3\">\n" +
            "                    <label for=\"bookType\">书籍类型</label>\n" +
            "                    <input type=\"text\" class=\"form-control\"  id=\"bookType\"  required>\n" +
            "                </div>\n" +
            "\n" +
            "                <div class=\"mb-3\">\n" +
            "                    <label for=\"description\">书籍描述</label>\n" +
            "                    <input type=\"text\" class=\"form-control\"  id=\"description\" >\n" +
            "                </div>\n" +
            "\n" +
            "                <div class=\"col-md-3 mb-3\">\n" +
            "                    <label for=\"stock\">库存</label>\n" +
            "                    <input type=\"text\" class=\"form-control\"  id=\"stock\"  required>\n" +
            "                </div>\n" +
            "\n" +
                "<div class=\"file-box\">\n" +
            "                    <label for=\"address\">上传图片</label>\n" +
            "    <img id=\"preview\" />\n" +
            "    <input type=\"file\" name=\"file\" id = \"input_file\" accept=\"image/*\" ><br>\n" +
            "    <button onclick=\"upload()\">上传</button>\n" +
            "</div>"+
            "                <hr class=\"mb-4\">\n" +
            "                <button class=\"btn btn-primary btn-lg btn-block\" type=\"submit\" onclick=\"addBook()\">提交</button>\n" +
            "            </form>\n" +
            "        </div>\n" +
            "    </div>\n" +
            "\n" +
            "    <footer class=\"my-5 pt-5 text-muted text-center text-small\">\n" +
            "        <p class=\"mb-1\">&copy; 2019-2020 小谭全球粉丝后援会</p>\n" +
            "    </footer>\n" +
            "</div>");
    }
</script>
<%--//上传图片--%>
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
                $('input_file').val(data.img_url)
            },
            error: function () {
                alert("上传失败");
            }
        })
    }
    
    function addBook() {
        var name = $('bookName').val();
        var ISBN = $('ISBN').val();
        var type = $('bookType').val();
        var description = $('description').val();
        var stock = $('stock').val();
        var img_url = $('input_file').val();
        $.ajax({
            type: 'post',
            url: '${root}/librarian/addBook',
            data: {
                name:name,
                isbn:ISBN,
                type:type,
                description:description,
                stock:stock,
                img_url:img_url
            },
            success: function (jsonData) {
                if(jsonData.code==1)
                {
                    alert("添加成功");
                }
                if(jsonData.code==0)
                {
                    alert("添加失败");
                }
            },
            error: function (jsondata) {

                alert("请求失败");
            }
        });

    }

</script>
<script>
    function updateBook()
    {
        var name = $('bookName').val();
        var ISBN = $('ISBN').val();
        var type = $('bookType').val();
        var description = $('description').val();
        var stock = $('stock').val();
        var img_url = $('input_file').val();
        $.ajax({
            type: 'post',
            url: '${root}/librarian/updateBook',
            data: {
                name:name,
                isbn:ISBN,
                type:type,
                description:description,
                stock:stock,
                img_url:img_url
            },
            success: function (jsonData) {
                if(jsonData.code==0)
                {
                    alert("添加成功");
                }
                if(jsonData.code==1)
                {
                    alert("书籍不存在");
                }
                if(jsonData.code==2)
                {
                    alert("修改失败");
                }
            },
            error: function (jsondata) {

                alert("请求失败");
            }
        });
    }
</script>
<%--//模糊查询书籍 传模糊书名 从最上面的search中获取 输入内容后点击查询书籍--%>
<script>
    //模糊查询书籍 传模糊书名 从最上面的search中获取 输入内容后点击查询书籍
    $('#queryBooks').click(function () {
        var bookname=$('#search').val();
        $.ajax({
            type:'post',
            url:'${root}/getBooksByname',
            data:{name:bookname},
            success:function (jsonData) {
                $('main').html("<h2>Show</h2>\n" +
                    "            <div class=\"table-responsive\">\n" +
                    "<div>\n" +
                    "                <button onclick=\"add()\">添加书籍</button>\n" +
                    "            </div>\n"+
                    "                <table id=\"tb\" class=\"table table-striped table-sm\">\n" +
                    "                    <thead>\n" +
                    "                    <tr>\n" +
                    "                        <th class=\"samewidth\">书名</th>\n" +
                    "                        <th class=\"samewidth\">ISBN编码</th>\n" +
                    "                        <th class=\"samewidth\">类型</th>\n" +
                    "                        <th class=\"samewidth\">描述</th>\n" +
                    "                        <th class=\"samewidth\">库存</th>\n" +
                    "                        <th class=\"samewidth\">操作</th>\n" +
                    "                    </tr>\n" +
                    "                    </thead>\n" +
                    "                    <tbody id=\"tb1\">\n" +
                    "\n" +
                    "                    </tbody>\n" +
                    "</table>\n" +
                    "            </div>");
                bookList(jsonData.Books);
            },
            error:function () {
                alert('请求失败');
            }
        })
    })
</script>
</body>
</html>