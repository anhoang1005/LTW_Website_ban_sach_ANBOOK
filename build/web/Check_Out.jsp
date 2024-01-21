<%-- 
    Document   : Check_Out
    Created on : Jan 10, 2024, 11:50:17 AM
    Author     : Hoang Van An
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Thanh Toan</title>
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
                                <li class="breadcrumb-item"><a href="home">Home</a></li>
                                <li class="breadcrumb-item"><a href="category">Category</a></li>
                                <li class="breadcrumb-item"><a href="">Thanh Toán</a></li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="row">
                    <div class="col-md-4 order-md-2 mb-4">
                        <h4 class="d-flex justify-content-between align-items-center mb-3">
                            <span class="text-muted">Giỏ hàng</span>
                            <span class="badge badge-secondary badge-pill">${fn:length(cart)}</span>
                    </h4>
                    <ul class="list-group mb-3 sticky-top">
                        <c:forEach var="cart" items="${cart}">
                            <li class="list-group-item d-flex justify-content-between lh-condensed">
                                <div>
                                    <img src="${cart.book.image}" style="height: 50px; width: auto" />
                                    <h6 class="my-0"> ${cart.book.title}</h6>
                                    <small class="text-muted">${cart.book.authorname} | ${cart.book.publishdate} | Số lượng: ${cart.quantity}</small>
                                </div>
                                <span class="text-muted">${cart.book.price}đ </span>
                            </li>
                        </c:forEach>
                        <li class="list-group-item d-flex justify-content-between">
                            <span>Phí giao hàng</span>
                            <span>25000đ</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between">
                            <span>Thành tiền</span>
                            <strong>100000d</strong>
                        </li>
                    </ul>
                    <form class="card p-2">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Mã giảm giá">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-secondary">Xác nhận</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-md-8 order-md-1">
                    <h4 class="mb-3">Hóa đơn thanh toán</h4>
                    <form action="customer_orders?action=add&aid=${user.id}" method="post" class="needs-validation" novalidate="">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="firstname">Họ Tên</label>
                                <input name ="nameorder" type="text" value ="${user.name}" class="form-control" id="firstName" placeholder="" required="">
                                <div class="invalid-feedback">Bắt buộc nhập tên hợp lệ!</div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="lastName">Số điện thoại</label>
                                <input name="telorder" type="text" value="${user.sdt}" class="form-control" id="lastName" placeholder="" required="">
                                <div class="invalid-feedback"> Bắt buộc! </div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="username">Email</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">@</span>
                                </div>
                                <input name="userorder" type="text" value="${user.email}" class="form-control" id="username" placeholder="Username" required="">
                                <div class="invalid-feedback" style="width: 100%;"> Bắt buộc! </div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="address">Địa chỉ giao hàng</label>
                            <input name="adressorder" type="text" class="form-control" id="address" placeholder="12, Ao Sen" required="">
                            <div class="invalid-feedback"> Vui lòng nhập địa chỉ giao hàng </div>
                        </div>
                        <div class="row">
                            <div class="col-md-5 mb-3">
                                <label for="country">Tỉnh</label>
                                <select name="country" class="custom-select d-block w-100" id="country" required="">
                                    <option  value="Hà Noi" selected>Hà Nội</option>
                                    <option value="Ho Chi Minh City">TP. Hồ Chí Minh</option>
                                    <option value="Da Nang">Đà Nẵng</option>
                                    <option value="HaiPhong">Hải Phòng</option>
                                    <option value="Can Tho">Cần Thơ</option>
                                    <option value="An Giang">An Giang</option>
                                    <option value="Bà Rịa - Vũng Tàu">Bà Rịa - Vũng Tàu</option>
                                    <option value="Bắc Giang">Bắc Giang</option>
                                    <option value="Bắc Kạn">Bắc Kạn</option>
                                    <option value="Bạc Liêu">Bạc Liêu</option>
                                    <option value="Bắc Ninh">Bắc Ninh</option>
                                    <option value="Bến Tre">Bến Tre</option>
                                    <option value="Bình Định">Bình Định</option>
                                    <option value="Bình Dương">Bình Dương</option>
                                    <option value="Bình Phước">Bình Phước</option>
                                    <option value="Bình Thuận">Bình Thuận</option>
                                    <option value="Cà Mau">Cà Mau</option>
                                    <option value="Cao Bằng">Cao Bằng</option>
                                    <option value="Đắk Lắk">Đắk Lắk</option>
                                    <option value="Đắk Nông">Đắk Nông</option>
                                    <option value="Điện Biên">Điện Biên</option>
                                    <option value="Đồng Nai">Đồng Nai</option>
                                    <option value="Đồng Tháp">Đồng Tháp</option>
                                    <option value="Gia Lai">Gia Lai</option>
                                    <option value="Hà Giang">Hà Giang</option>
                                    <option value="Hà Nam">Hà Nam</option>
                                    <option value="Hà Tĩnh">Hà Tĩnh</option>
                                    <option value="Hải Dương">Hải Dương</option>
                                    <option value="Hậu Giang">Hậu Giang</option>
                                    <option value="Hòa Bình">Hòa Bình</option>
                                    <option value="Hưng Yên">Hưng Yên</option>
                                    <option value="Khánh Hòa">Khánh Hòa</option>
                                    <option value="Kiên Giang">Kiên Giang</option>
                                    <option value="Kon Tum">Kon Tum</option>
                                    <option value="Lai Châu">Lai Châu</option>
                                    <option value="Lâm Đồng">Lâm Đồng</option>
                                    <option value="Lạng Sơn">Lạng Sơn</option>
                                    <option value="Lào Cai">Lào Cai</option>
                                    <option value="Long An">Long An</option>
                                    <option value="Nam Định">Nam Định</option>
                                    <option value="Nghệ An">Nghệ An</option>
                                    <option value="Ninh Bình">Ninh Bình</option>
                                    <option value="Ninh Thuận">Ninh Thuận</option>
                                    <option value="Phú Thọ">Phú Thọ</option>
                                    <option value="Quảng Bình">Quảng Bình</option>
                                    <option value="Quảng Nam">Quảng Nam</option>
                                    <option value="Quảng Ngãi">Quảng Ngãi</option>
                                    <option value="Quảng Ninh">Quảng Ninh</option>
                                    <option value="Quảng Trị">Quảng Trị</option>
                                    <option value="Sóc Trăng">Sóc Trăng</option>
                                    <option value="Sơn La">Sơn La</option>
                                    <option value="Tây Ninh">Tây Ninh</option>
                                    <option value="Thái Bình">Thái Bình</option>
                                    <option value="Thái Nguyên">Thái Nguyên</option>
                                    <option value="Thanh Hóa">Thanh Hóa</option>
                                    <option value="Thừa Thiên Huế">Thừa Thiên Huế</option>
                                    <option value="Tiền Giang">Tiền Giang</option>
                                    <option value="Trà Vinh">Trà Vinh</option>
                                    <option value="Tuyên Quang">Tuyên Quang</option>
                                    <option value="Vĩnh Long">Vĩnh Long</option>
                                    <option value="Vĩnh Phúc">Vĩnh Phúc</option>
                                    <option value="Yên Bái">Yên Bái</option>
                                </select>
                                <div class="invalid-feedback"> Vui lòng chon tỉnh thánh phố! </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="state">Quận/Huyện</label>
                                <input name="district" type="text" class="form-control" id="zip" placeholder="" required="">
                                <div class="invalid-feedback"> Vui lòng nhập! </div>
                            </div>
                            <div class="col-md-4 mb-3">

                                <input name="totalprice" type="hidden" value="100000d" class="form-control" id="zip">
                                <div class="invalid-feedback"> Vui lòng nhập! </div>
                            </div>
                        </div>
                        <hr class="mb-4">
                        <div class="d-block my-3">
                            <label for="state">Phương thức thanh toán:</label>
                            <div class="custom-control custom-radio">
                                <input id="credit" name="checkmethod" value="1" type="radio" class="custom-control-input" checked="" required="">
                                <label class="custom-control-label" for="credit">Thanh toán khi nhận hàng</label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input id="debit" name="checkmethod" value="0" type="radio" class="custom-control-input" required="">
                                <label class="custom-control-label" for="debit">Thanh toán qua tài khoản ngân hàng</label>
                            </div>
                        </div>
                        <hr class="mb-4">
                        <h4 class="mb-3">Thông tin thẻ(nếu thanh toán khi giao hàng thì không cần nhập thông tin này)</h4>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="cc-name">Tên chủ tài khoản</label>
                                <input type="text" class="form-control" id="cc-name" placeholder="" required="">
                                <small class="text-muted">Tên đầy đủ chủ thẻ</small>
                                <div class="invalid-feedback"> Vui lòng nhâp! </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="cc-number">Số tài khoản</label>
                                <input type="text" class="form-control" id="cc-number" placeholder="" required="">
                                <small class="text-muted">Số tài khoản của bạn</small>
                                <div class="invalid-feedback"> Nhập số tài khoản </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 mb-3">
                                <label for="cc-expiration">Expiration</label>
                                <input type="text" class="form-control" id="cc-expiration" placeholder="" required="">
                                <div class="invalid-feedback"> Expiration date required </div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="cc-cvv">CVV</label>
                                <input type="text" class="form-control" id="cc-cvv" placeholder="" required="">
                                <div class="invalid-feedback"> Security code required </div>
                            </div>
                        </div>
                        <hr class="mb-4">
                        <button class="btn btn-primary btn-lg btn-block" type="submit">ĐẶT HÀNG</button>
                    </form>
                </div>
            </div>

        </div>

        <jsp:include page="Footer.jsp"></jsp:include>

        <script>
            (function () {
                'use strict'

                window.addEventListener('load', function () {
                    // Fetch all the forms we want to apply custom Bootstrap validation styles to
                    var forms = document.getElementsByClassName('needs-validation')

                    // Loop over them and prevent submission
                    Array.prototype.filter.call(forms, function (form) {
                        form.addEventListener('submit', function (event) {
                            if (form.checkValidity() === false) {
                                event.preventDefault()
                                event.stopPropagation()
                            }
                            form.classList.add('was-validated')
                        }, false)
                    })
                }, false)
            }())
        </script>


    </body>
</html>
