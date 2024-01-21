<%-- 
    Document   : Contact
    Created on : May 6, 2023, 5:34:40 PM
    Author     : Hoang Van An
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <!-- Site meta -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Liên hệ</title>
        
        <!-- CSS -->
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="//fonts.googleapis.com/css?family=Open+Sans:400,300,600" rel="stylesheet" type="text/css">
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <script src="https://kit.fontawesome.com/d75d72b9b4.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <!-- Menu -->
        <jsp:include page="Menu.jsp"></jsp:include>
        
        <div class="container">
            <div class="row">
                <div class="col">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home">Trang chủ</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Liên hệ</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="card">
                        <div class="card-header bg-primary text-white"><i class="fa fa-envelope"></i> Liên hệ chúng tôi
                        </div>
                        <div class="card-body">
                            <form>
                                <div class="form-group">
                                    <label for="name">Tên:</label>
                                    <input type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Nhập tên" required>
                                </div>
                                <div class="form-group">
                                    <label for="email">Địa chỉ email</label>
                                    <input type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Nhập email" required>
                                    <small id="emailHelp" class="form-text text-muted">Email của bạn sẽ được bảo mật</small>
                                </div>
                                <div class="form-group">
                                    <label for="message">Tin nhắn</label>
                                    <textarea class="form-control" id="message" rows="6" required></textarea>
                                </div>
                                <div class="mx-auto">
                                    <button type="submit" class="btn btn-primary text-right">Gửi</button></div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-sm-4">
                    <div class="card bg-light mb-3">
                        <div class="card-header bg-success text-white text-uppercase"><i class="fa fa-home"></i> Địa chỉ</div>
                        <div class="card-body">
                            <p>H2BOOK</p>
                            <p>Luôn cam kết chất lượng đi đầu</p>
                            <p>Hà Nội</p>
                            <p>Email : h2book@example.com</p>
                            <p>Tel: 0867865001</p>
                            <div class="dropdown">
                                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Dropdown button
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" href="#">Actionssssssssssssssssssssssssssssssssssssssss</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Footer -->
        <jsp:include page="Footer.jsp"></jsp:include>
        
        <script src="//code.jquery.com/jquery-3.2.1.slim.min.js" type="text/javascript"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" type="text/javascript"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" type="text/javascript"></script>
        
    </body>
</html>
