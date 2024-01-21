<%-- 
    Document   : Cart
    Created on : Jan 10, 2024, 1:43:50 AM
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
        <title>Gio hang</title>
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
        <c:set var="total" value="0"></c:set>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="home">Home</a></li>
                                <li class="breadcrumb-item"><a href="category">Cart</a></li>
                                <li class="breadcrumb-item"><a href="#"></a></li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>

            <div class="container mb-4">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h3 class="mb-0">Giỏ hàng(${fn:length(cart)})</h3>
                <button type="submit" class="btn btn-success btn-sm">
                    <i class="fa fa-shopping-cart"></i> TIẾP TỤC MUA HÀNG
                </button>
            </div>
            <div class="row">
                <div class="col-sm-9">
                    <div class="table-responsive">
                        <c:if test="${fn:length(cart) == 0}">
                            <p> Ban chua mua san pham nao </p>

                        </c:if>
                        <c:if test="${fn:length(cart) > 0}">
                            <table class="table table-striped custom-table">
                                <thead>
                                    <tr>
                                        <th class="text-center" scope="col">
                                            <input type="checkbox" value="" aria-label="Checkbox for following text input">
                                        </th>
                                        <th class="text-center" scope="col">Ảnh</th>
                                        <th class="text-center" scope="col">Sản phẩm</th>
                                        <th class="text-center" scope="col">Phân loại</th>
                                        <th class="text-center" scope="col">Đơn giá</th>
                                        <th class="text-center" scope="col">Số lượng</th>
                                        <th class="text-center" scope="col">Tổng</th>
                                        <th class="text-center" scope="col">Thao tác</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <c:forEach var="cart" items="${cart}">
                                        <c:set var="total" value="${total + cart.totalprice}"></c:set>
                                            <tr>
                                                <th class="text-center" scope="row">
                                                    <input type="checkbox" value="" aria-label="Checkbox for following text input">
                                                </th>
                                                <th class="text-center">
                                                    <img style="width: 50%; height: auto" src="${cart.book.image}" alt="alt"/>
                                            </th>
                                            <td class="text-center">${cart.book.title}</td>
                                            <td class="text-center">${cart.book.catename}</td>
                                            <td class="text-center">${cart.book.price}</td>
                                            <td class="text-center">${cart.quantity}</td>
                                            <td class="text-center" style="color: red">${cart.totalprice}d</td>
                                            <td class="text-center">
                                                <a href="#deleteReviewModal" class="btn btn-sm btn-danger delete" data-bookid="${cart.book.bookid}" data-toggle="modal">
                                                    <i class="fa fa-trash"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                    </div>
                </div>

                <div class="col-sm-3">
                    <div class="card bg-light mb-3">
                        <div class="card-header bg-primary text-white text-uppercase"><i class="fa-solid fa-cart-shopping"></i> Thanh toán giỏ hàng</div>
                        <div class="card-body">
                            <p class="name" style="color: black; font-size: 1em"><strong>Số sản phẩm: ${fn:length(cart)}</strong></p>
                            <hr class="bg-dark mb-2 mt-0 d-inline-block mx-auto w-100">
                            <form action="cart?action=checkout" method="POST">
                                <div class="form-group">
                                    <label for="shipping">Shipping:</label>
                                    <input class="form-control" type="text" name="shipping">
                                </div>
                                <div class="form-group">
                                    <label for="givesale">Mã giảm giá:</label>
                                    <input class="form-control" type="text" name="givesale" placeholder="Nhap code...">
                                </div>
                                <hr class="bg-dark mb-2 mt-0 d-inline-block mx-auto w-100">
                                <input class="form-control" type="hidden" name="totalprice" value="${total}">
                                <p class="name" style="color: black; font-size: 1em"><strong>Tổng thanh toán: <span style="color: red">${total}d</span></strong></p>
                                <button type="submit" class="btn btn-success btn-sm col-sm-12">
                                    <i class="fa fa-shopping-cart"></i> THANH TOÁN
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12">
                <nav aria-label="...">
                    <ul class="pagination">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1">Previous</a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item active">
                            <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>

        <jsp:include page="Footer.jsp"></jsp:include>

        <!--Modal sua gio hang-->
        <div class="modal fade" id="updateReviewModal" tabindex="-1" role="dialog" aria-labelledby="deleteReviewModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteReviewModalLabel">Thay đổi số lượng</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="rating">số lượng:</label>
                            <input type="number" class="form-control" id="quantity" name="quantity" min="1" max="10" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                        <a href="#" class="btn btn-info confirm-update">Xác nhận</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal xác nhận xóa -->
        <div class="modal fade" id="deleteReviewModal" tabindex="-1" role="dialog" aria-labelledby="deleteReviewModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteReviewModalLabel">Xác nhận xóa</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Bạn có chắc chắn muốn xóa sản phẩm này?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                        <a href="#" class="btn btn-danger confirm-delete">Xóa</a>
                    </div>
                </div>
            </div>
        </div>

        <script>
            document.querySelectorAll('.update').forEach(updateButton => {
                updateButton.addEventListener('click', function (event) {
                    event.preventDefault();
                    
                    var bookId = this.getAttribute('data-bookid');
                    var quantity = this.getAttribute('data-quantity');
                    document.getElementById('quantity').setAttribute('value', quantity);
                    const confirmUpdateButton = document.querySelector('.confirm-update');
                    confirmUpdateButton.href = `cart?action=update&bookid=` + bookId + '&quantity=' + quantity;
                });
            });
        </script>
        <script>
            document.querySelectorAll('.delete').forEach(deleteButton => {
                deleteButton.addEventListener('click', function (event) {
                    event.preventDefault();

                    var bookId = this.getAttribute('data-bookid');
                    const confirmDeleteButton = document.querySelector('.confirm-delete');
                    confirmDeleteButton.href = `cart?action=delete&bookid=` + bookId;
                });
            });
        </script>

    </body>
</html>