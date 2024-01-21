<%-- 
    Document   : Login
    Created on : Jun 9, 2023, 12:42:17 AM
    Author     : Hoang Van An
--%>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <script src="https://kit.fontawesome.com/d75d72b9b4.js" crossorigin="anonymous"></script>
        <title>Đăng nhập</title>
        <link href="css/style.css" rel="stylesheet" type="text/css">

    </head>
    <body>
        <!-- Menu -->
        <jsp:include page="Menu.jsp"></jsp:include>
        <div id="logreg-forms" style="border-radius: 5%; border: 1px solid #333">
            <form class="form-signin" action="users?action=login" method="post">
                <h1 class="h3 mb-3 font-weight-normal" style="text-align: center"><strong>ĐĂNG NHẬP</strong></h1>
                <p class="text-danger" style="color: red">${mess}</p>
                <p class="text-sucess" style="color: green">${success}</p>
                <input name="user"  type="text" id="inputEmail" class="form-control" placeholder="Tên đăng nhập" required="" autofocus="">
                <p> </p>
                <input name="pass"  type="password" id="inputPassword" class="form-control" placeholder="Mật khẩu" required="">

                <div class="form-group form-check">
                    <input name="remember" value="1" type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">Nhớ mật khẩu</label>
                </div>

                <button class="btn btn-success btn-block" type="submit"><i class="fas fa-sign-in-alt"></i> Đăng nhập</button>
                <center><a href="#">Quên mật khẩu</a></center>
                <hr>
                <a href="Register.jsp"><button class="btn btn-primary btn-block" type="button" id="btn-signup"><i class="fas fa-user-plus"></i> Đăng kí</button></a>
            </form>
            <br>
            
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="//code.jquery.com/jquery-3.2.1.slim.min.js" type="text/javascript"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" type="text/javascript"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
<style>
    body {
    /* Thiết lập hình ảnh làm nền */
    background-image: url('img/background/background1.jpg');
    /* Căn giữa và lặp lại hình ảnh nếu cần */
    background-position: center;
    background-repeat: no-repeat;
    /* Kích thước của hình ảnh */
    background-size: cover;
}
</style>