<%-- 
    Document   : Profile
    Created on : Jan 11, 2024, 8:03:54 PM
    Author     : Hoang Van An
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Tài khoản</title>
        <!-- CSS -->
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="//fonts.googleapis.com/css?family=Open+Sans:400,300,600" rel="stylesheet" type="text/css">
        <script src="//code.jquery.com/jquery-3.2.1.slim.min.js" type="text/javascript"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" type="text/javascript"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <script src="https://kit.fontawesome.com/d75d72b9b4.js" crossorigin="anonymous"></script>
    </head>
    <body>
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
                    <div class="col-12 col-sm-4 text-center">
                        <div class="card bg-light mb-3">
                            <div class="card-body">
                                <div class="mb-3" style="border-radius: 70%; position: relative; overflow: hidden; padding-top: 100%;">
                                    <img style="border: 1px solid #CCC; width: 100%; height: auto; position: absolute; top: 0; left: 0;" class="img-circle" src="https://i.pinimg.com/236x/c2/f6/52/c2f652b8e274a1afe838d753251a0c47.jpg" />
                                </div>

                                <h5 class="font-strong m-b-10 m-t-10">${user.name}</h5>
                            <div class="m-b-20 text-muted mb-3">${user.username}</div>
                            <div class="profile-social m-b-20 mb-5">
                                <a href="https://www.facebook.com/duyvu.hoang.5682"><i class="fa fa-twitter ml-2 mr-2"></i></a>
                                <a href="https://www.facebook.com/duyvu.hoang.5682"><i class="fa fa-facebook ml-2 mr-2"></i></a>
                                <a href="https://www.facebook.com/duyvu.hoang.5682"><i class="fa fa-instagram ml-2 mr-2"></i></a>
                                <a href="https://www.facebook.com/duyvu.hoang.5682"><i class="fa fa-user ml-2 mr-2"></i></a>
                            </div>
                            <a class="btn btn-success btn-sm ml-3 mb-2 position-relative col-8" href="#">
                                Chỉnh sửa thông tin
                            </a>
                            <a href="#changePassModal" class="btn btn-sm ml-3 btn-danger col-8 delete" data-toggle="modal">
                                <i class="fa-solid fa-pen-to-square"></i> Đổi mật khẩu
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-sm-8">
                    <div class="card">
                        <div class="card-header bg-primary text-white"><i class="fa-solid fa-user"></i> OVER VIEW
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6" style="border: none">
                                    <h5 class="text-info m-b-20 m-t-10"> <i class="fa-solid fa-user"></i> Thông tin định danh</h5>
                                    <ul class="list-group list-group-full list-group-divider">
                                        <li class="list-group-item"><strong>Họ tên:</strong>
                                            <span class="pull-right color-green">${user.name}</span>
                                        </li>
                                        <li class="list-group-item"><strong>Username:</strong>
                                            <span class="pull-right color-green">${user.username}</span>
                                        </li>
                                        <li class="list-group-item"><strong>Năm sinh:</strong>
                                            <span class="pull-right color-green">${user.namsinh}</span>
                                        </li>
                                        <li class="list-group-item"><strong>Email:</strong>
                                            <span class="pull-right color-green">${user.email}</span>
                                        </li>
                                        <li class="list-group-item"><strong>Sdt:</strong>
                                            <span class="pull-right color-green">${user.sdt}</span>
                                        </li>
                                        <li class="list-group-item"><strong>Địa chỉ:</strong>
                                            <span class="pull-right color-green">${user.adress}</span>
                                        </li>
                                        <li class="list-group-item"><strong>Role:</strong>
                                            <span class="pull-right color-green">${user.role}</span>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-md-6" style="border: none">
                                    <h5 class="text-info m-b-20 m-t-10"> <i class="fa-solid fa-pen-to-square"></i> Chỉnh sửa thông tin</h5>
                                    <form action="users?action=edit" method="POST">
                                        <div class="form-group">
                                            <label for="name">Họ tên:</label>
                                            <input name="name" type="text" value="${user.name}" class="form-control" id="name" placeholder="Nhập tên" required>
                                            <input name="userid" type="hidden" value="${user.id}" class="form-control" id="name" placeholder="Nhập tên" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="namsinh">Năm sinh:</label>
                                            <input name="namsinh" type="date" value="${user.namsinh}" class="form-control" id="dob" aria-describedby="emailHelp" placeholder="Nhập tên" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="email">Email:</label>
                                            <input name="email" type="text" value="${user.email}" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Nhập tên" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="adress">Địa chỉ:</label>
                                            <input name="adress" type="text" value="${user.adress}" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Nhập tên" required>
                                        </div>
                                        <div class="mx-auto mb-3">
                                            <button type="submit" class="btn btn-primary text-right">Lưu</button></div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <jsp:include page="Footer.jsp"></jsp:include>

            <!-- Modal xác nhận xóa -->
            <div class="modal fade" id="changePassModal" tabindex="-1" role="dialog" aria-labelledby="deleteReviewModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="deleteReviewModalLabel">Xác nhận xóa</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="users?action=changepass" method="POST">
                                <div class="form-group">
                                    <label for="password">Mật khẩu cũ:</label>
                                    <input name="password" type="password" class="form-control" id="name" placeholder="Nhập password" required>
                                    <input name="userid" type="hidden" value="${user.id}" class="form-control" id="name" placeholder="Nhập tên" required>
                                </div>
                                <div class="form-group">
                                    <label for="newpass">Mật khẩu mới:</label>
                                    <input name="newpass" type="password" class="form-control" id="dob" aria-describedby="emailHelp" placeholder="Nhập..." required>
                                </div>
                                <div class="form-group">
                                    <label for="repass">Nhập lại mật khẩu mới:</label>
                                    <input name="repass" type="password" class="form-control" id="dob" aria-describedby="emailHelp" placeholder="Nhập..." required>
                                </div>
                            <div class="mx-auto mb-3">
                                <button type="submit" class="btn btn-primary text-right">Xác nhận</button></div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
