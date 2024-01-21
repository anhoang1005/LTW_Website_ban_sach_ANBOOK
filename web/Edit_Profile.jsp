<%-- 
    Document   : Register
    Created on : Jun 9, 2023, 12:47:52 AM
    Author     : Hoang Van An
--%>

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
        <title>Đăng kí tài khoản</title>
        <link href="css/style.css" rel="stylesheet" type="text/css">
         <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="//code.jquery.com/jquery-3.2.1.slim.min.js" type="text/javascript"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" type="text/javascript"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" type="text/javascript"></script>
    </head>
    <body>
        <!-- Menu -->
        <jsp:include page="Menu.jsp"></jsp:include>
        
        <div id="logreg-forms" style="border-radius: 3%; border: 1px solid #333">
                <form class="form-signin" action="users?action=register" method="post">
                    <h1 class="h3 mb-3 font-weight-normal" style="text-align: center"> Chỉnh sửa tài khoản</h1>
                    <p class="text-danger">${mess}</p>
                    <input name="name" value="${ten}" type="text" id="user-name" class="form-control" placeholder="Họ tên" required="" autofocus="">
                    <p> <p/>
                    <input name="namsinh" value="${dob}" type="text" id="user-name" class="form-control" placeholder="Năm sinh" required="" autofocus="">
                    <p> <p/>
                    <input name="email" value="${thudientu}" type="text" id="user-name" class="form-control" placeholder="Email" required="" autofocus="">
                    <p> <p/>
                    <input name="adress" value="${diachi}" type="text" id="user-name" class="form-control" placeholder="Địa chỉ" required="" autofocus="">
                    <p> <p/>

                <button class="btn btn-primary btn-block" type="submit">Xác nhận </button>
            </form>
        </div>
        
        <jsp:include page="Footer.jsp"></jsp:include>
        
    </body>
</html>
<style>
    body {
    /* Thiết lập hình ảnh làm nền */
    background-image: url('img/background/background2.jpg');
    /* Căn giữa và lặp lại hình ảnh nếu cần */
    background-position: center;
    background-repeat: no-repeat;
    /* Kích thước của hình ảnh */
    background-size: cover;
}
</style>