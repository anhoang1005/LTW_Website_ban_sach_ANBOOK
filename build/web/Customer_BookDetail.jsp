<%-- 
    Document   : Home
    Created on : May 4, 2023, 2:59:22 PM
    Author     : Hoang Van An
--%>


<%@page import="model.Review"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html> 
<html>

    <head>

        <!-- Site meta -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>${bookB.title}</title>

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
                                <li class="breadcrumb-item"><a href="home?action=view">Trang chủ</a></li>
                                <li class="breadcrumb-item"><a href="category.html">${bookB.catename}</a></li>
                            <li class="breadcrumb-item"><a href="">${bookB.title}</a></li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <!-- Image -->
                <div class="col-12 col-lg-5">
                    <div class="card bg-light mb-5">
                        <div class="card-body">
                            <a href="" data-toggle="modal" data-target="#productModal">
                                <img class="img-fluid" src="${bookB.image}" style="width: 100%;" />
                                <p class="text-center">Xem</p>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Add to cart -->
                <div class="col-12 col-lg-7 add_to_cart_block">
                    <div class="card bg-light mb-5">
                        <div class="card-body">
                            <p class="name" style="color: black; font-size: 25px">${bookB.title}</p>
                            <p>
                                <i style="color: #FFCC33" class="fa fa-star"></i>
                                <i style="color: #FFCC33" class="fa fa-star"></i>
                                <i style="color: #FFCC33" class="fa fa-star"></i>
                                <i style="color: #FFCC33" class="fa fa-star"></i>
                                <i style="color: #FFCC33" class="fa fa-star"></i>
                                (5/5)
                                | 5 Đánh giá  |  ${bookB.soldcount} Đã bán  |  Còn lại: ${bookB.quantity}
                                <a class="pull-right" href="#reviews">Xem tất cả đánh giá</a>
                            <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-100">

                            </p>
                            <p class="price">${bookB.price}đ</p>
                            <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-100">
                            <p>- Mã sách: SP00${bookB.bookid}</p>
                            <p>- Tác giả: <a href="bookdetail?action=viewauthor&aid=${authorA.id}">${bookB.authorname}</a></p>
                            <p>- Số trang: ${bookB.pagecount}</p>
                            <p>- Nhà phát hành: <a href="bookdetail?action=publisherview&pid=${publisherP.id}">${publisher.name}</a></p>
                            <p>- Ngày phát hành: ${bookB.publishdate}</p>
                            <p>- Danh mục: <a href="bookdetail?action=cateview&cid=${category.id}">${category.name}</a></p>


                            <form method="post" action="cart?action=add">
                                <div class="form-group">
                                    <label>Số lượng :</label>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <button type="button" class="quantity-left-minus btn btn-danger btn-number"  data-type="minus" data-field="">
                                                <i class="fa fa-minus"></i>
                                            </button>
                                        </div>
                                        <input type="text" class="form-control"  id="quantity" name="quantity" min="1" max="100" value="1">
                                        <input type="hidden" name ="bookid" value="${bookB.bookid}">
                                        <div class="input-group-append">
                                            <button type="button" class="quantity-right-plus btn btn-success btn-number" data-type="plus" data-field="">
                                                <i class="fa fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-success btn-lg btn-block text-uppercase" ><i class="fa-solid fa-cart-plus"></i> THÊM VÀO GIỎ HÀNG</button>
                            </form>
                            <div class="product_rassurance">
                                <ul class="list-inline">
                                    <li class="list-inline-item"><i class="fa fa-truck fa-2x"></i><br/>Giao hàng nhanh</li>
                                    <li class="list-inline-item"><i class="fa fa-credit-card fa-2x"></i><br/>Thanh toán an toàn</li>
                                    <li class="list-inline-item"><i class="fa fa-phone fa-2x"></i><br/>0867865001</li>
                                </ul>
                            </div>

                            <div class="datasheet p-3 mb-2 bg-info text-white">
                                <a href="" class="text-white"><i class="fa fa-file-text"></i> Lưu</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <!-- Description -->
                <div class="col-12">
                    <div class="card border-light mb-3">
                        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-align-justify"></i> MÔ TẢ</div>
                        <div class="card-body">
                            <p class="card-text">
                                <strong>Về tác phẩm:</strong>
                                <br>
                                ${bookB.des}
                            </p>
                            <br><!-- comment -->
                            <p class="card-text">
                                <strong>Về tác giả: ${authorA.name}(${authorA.namsinh})</strong>
                                <br>
                                ${authorA.des}
                            </p>

                        </div>
                    </div>
                </div>
            </div>


            <div class="row">
                <!-- Description -->
                <div class="col-12">
                    <div class="card border-light mb-3">
                        <div class="card-header bg-primary text-white text-uppercase"><i class="fa-solid fa-comment"></i></i> ĐÁNH GIÁ SẢN PHẨM</div>
                        <c:if test="${myreview ne null and user ne null}">
                            <div class="card-body">
                                <p class="card-text">
                                    <strong><i class="fa-solid fa-user"></i> ${myreview.username}(Tôi)</strong>
                                    <br>
                                <p>
                                    <c:forEach var="i" begin="1" end="${myreview.rating}">
                                        <i style="color: #FFCC33" class="fa fa-star"></i>
                                    </c:forEach>
                                    <c:forEach var="i" begin="1" end="${5-myreview.rating}">
                                        <i style="color: #FFCC33" class="fa-regular fa-star"></i>
                                    </c:forEach>
                                    | ${myreview.date}
                                </p>
                                </p>
                                <p class="card-text">
                                    <span>${myreview.comment}</span>
                                    <br>
                                <p class="d-flex justify-content-between align-items-center">
                                    <span><a href=""><i class="fa-solid fa-thumbs-up"></i>${myreview.like}</a></span>
                                    <span class="ml-auto">
                                        <a href="#updateReviewModal" class="btn btn-sm btn-warning" data-toggle="modal"><i class="fa-solid fa-pen-to-square"></i> Sửa</a>
                                        <a href="#deleteReviewModal" class="btn btn-sm btn-danger" data-toggle="modal"><i class="fa-solid fa-trash"></i> Xóa</a>
                                    </span>
                                </p>
                                </p>
                            </div>
                            <hr class="bg-dark mb-2 mt-0 d-inline-block mx-auto w-100">
                        </c:if>

                        <c:if test="${myreview eq null and user ne null}">
                            <div class="card-body">
                                <p class="card-text">
                                    <strong><i class="fa-solid fa-user"></i> ${user.username}</strong>
                                    <br>
                                </p>
                                <p class="card-text">
                                    <span>Bạn chưa đánh giá cho sản phẩm này!</span>
                                    <br>
                                <p class="d-flex justify-content-between align-items-center">
                                    <!--<span><a href=""><i class="fa-solid fa-thumbs-up"></i>10</a></span>-->
                                    <span class="ml-auto">
                                        <a href="#addReviewModal" class="btn btn-sm btn-success" data-toggle="modal"><i class="fa-solid fa-plus"></i> Thêm đánh giá</a>
                                    </span>
                                </p>
                                </p>
                            </div>
                            <hr class="bg-dark mb-2 mt-0 d-inline-block mx-auto w-100">
                        </c:if>
                            
                            
                            <c:if test="${user eq null and (empty(listR) or listR[0] eq null)}">
                                <div class="card-body">
                                    <p class="card-text">
                                        <span>Chưa có đánh giá nào cho sản phẩm này!</span>
                                        <br>
                                    <p class="d-flex justify-content-between align-items-center">
                                        <!--<span><a href=""><i class="fa-solid fa-thumbs-up"></i>10</a></span>-->
                                        <span class="ml-auto">
                                            <a href="Login.jsp" class="btn btn-sm btn-success"><i class="fa-solid fa-plus"></i>Đăng nhập để đánh giá!</a>
                                        </span>
                                    </p>
                                    </p>
                                </div>
                                <hr class="bg-dark mb-2 mt-0 d-inline-block mx-auto w-100">
                            </c:if>

                        <c:forEach var="review" items="${listR}">
                            <c:if test="${review ne myreview}">
                                <div class="card-body">
                                    <p class="card-text">
                                        <strong><i class="fa-solid fa-user"></i> ${review.username}</strong>
                                        <br>
                                    <p>
                                        <c:forEach var="i" begin="1" end="${review.rating}">
                                            <i style="color: #FFCC33" class="fa fa-star"></i>
                                        </c:forEach>
                                        <c:forEach var="i" begin="1" end="${5-review.rating}">
                                            <i style="color: #FFCC33" class="fa-regular fa-star"></i>
                                        </c:forEach>
                                        | ${review.date}
                                    </p>
                                    </p>
                                    <p class="card-text">
                                        <span>${review.comment}</span>
                                        <br>
                                    <p class="d-flex justify-content-between align-items-center">
                                        <span><a href=""><i class="fa-solid fa-thumbs-up"></i>${review.like}</a></span>
                                    </p>
                                    </p>
                                </div>
                                <hr class="bg-dark mb-2 mt-0 d-inline-block mx-auto w-100">
                            </c:if>
                        </c:forEach>

                    </div>
                </div>
            </div>

            <div class="row">
                <!-- Description -->
                <div class="col-12">
                    <div class="card border-light mb-3">
                        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-align-justify"></i> SẢN PHẨM TƯƠNG TỰ</div>
                        <div class="card-body">
                            <div class="col-sm-12">
                                <div class="row">
                                    <c:forEach var="book" items="${listB}">
                                        <div class="col-12 col-md-6 col-lg-3" onmouseover="this.style.transform = 'scale(1.03)'" onmouseout="this.style.transform = 'scale(1)'" style="transition: 0.3s">
                                            <a href="bookdetail?action=view&bookid=${book.bookid}">
                                                <div style="border: 1px solid #CCC" class="card">
                                                    <img class="card-img-top" src="${book.image}" alt="Card image cap">
                                                    <div class="card-body">
                                                        <h4 class="card-title" style="font-size: 12px">
                                                            <a href="books_detail?action=view&bid=${book.bookid}" title="View Product">${book.title}</a>
                                                        </h4>
                                                        <p class="card-text" style="font-size: 12px">${book.authorname}</p>
                                                        <div style="display: flex; justify-content: space-between;">
                                                            <p style="text-align: left; font-size: 15px; margin: 0; color: red"><strong>${book.price}đ</strong></p>
                                                            <p style="text-align: right; font-size: 15px; margin: 0;">${book.pagecount} đã bán</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </c:forEach>
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
                            </div>

                        </div>
                    </div>
                </div>
            </div>    

            <!-- Footer -->
            <jsp:include page="Footer.jsp"></jsp:include>

                <!-- Modal Add Review-->
                <div id="addReviewModal" class="modal fade" role="dialog">
                    <div class="modal-dialog">
                        <!-- Nội dung modal -->
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Đánh giá sách</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <!-- Nội dung form đánh giá -->
                                <form action="bookdetail?action=addrv" method="POST">
                                    <!-- Thêm các trường đánh giá vào đây -->
                                    <div class="form-group">
                                        <input type="hidden" value="${bookB.bookid}" class="form-control" id="book" name="bookid" min="1" max="5">
                                    <input type="hidden" value="${user.id}" class="form-control" id="user" name="userid" min="1" max="5">
                                </div>
                                <div class="form-group">
                                    <label for="rating">Đánh giá:</label>
                                    <div class="rating">
                                        <span class="star" data-rating="1">&#9733;</span>
                                        <span class="star" data-rating="2">&#9733;</span>
                                        <span class="star" data-rating="3">&#9733;</span>
                                        <span class="star" data-rating="4">&#9733;</span>
                                        <span class="star" data-rating="5">&#9733;</span>
                                        <input type="hidden" name="rating" id="selected_rating" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="comment">Bình luận:</label>
                                    <textarea class="form-control" id="comment" name="comment" rows="4" required></textarea>
                                </div>
                                <button type="submit" class="btn btn-primary">Gửi đánh giá</button>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        </div>
                    </div>
                </div>
            </div>


            <!-- Modal Update Review-->
            <div id="updateReviewModal" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <!-- Nội dung modal -->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Cập nhật đánh giá</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <form action="bookdetail?action=updaterv" method="POST">
                                <div class="form-group">
                                    <input type="hidden" value="${bookB.bookid}" class="form-control" id="upbook" name="bookid" min="1" max="5">
                                    <input type="hidden" value="${user.id}" class="form-control" id="upuser" name="userid" min="1" max="5">
                                </div>
                                <div class="form-group">
                                    <label for="rating">Đánh giá:</label>
                                    <input value="${myreview.rating}" type="number" class="form-control" id="rating" name="rating" min="1" max="5" required>
                                </div>
                                <div class="form-group">
                                    <label for="comment">Bình luận:</label>
                                    <textarea class="form-control" id="comment" name="comment" rows="4" required>${myreview.comment}</textarea>
                                </div>
                                <div class="form-group">
                                    <label for="imagereview">Thêm ảnh:</label>
                                    <input type="file" class="form-control" id="image" name="imagereview" min="1" max="5">
                                </div>
                                <button type="submit" class="btn btn-primary">Cập nhật</button>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Delete Review-->
            <div id="deleteReviewModal" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <!-- Nội dung modal -->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Xóa đánh giá</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <form action="bookdetail?action=deleterv" method="POST">
                                <div class="form-group">
                                    <input type="hidden" value="${bookB.bookid}" class="form-control" id="debook" name="bookid" min="1" max="5">
                                    <input type="hidden" value="${user.id}" class="form-control" id="deuser" name="userid" min="1" max="5">
                                </div>
                                <h6 class="modal-title" style="color: red">Bạn có chắc muốn xoá đánh giá này?</h6>
                        </div>
                        <div class="modal-footer justify-content-between">
                            <button type="submit" class="btn btn-danger">Xác nhận</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        </div>
                        </form>
                    </div>
                </div>
            </div>              

            <!-- Modal image -->
            <div class="modal fade" id="productModal" tabindex="-1" role="dialog" aria-labelledby="productModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="productModalLabel">${bookB.title}</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <img class="img-fluid" src="${bookB.image}" style="width: 100%"/>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- JS -->
            <script src="//code.jquery.com/jquery-3.2.1.slim.min.js" type="text/javascript"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" type="text/javascript"></script>
            <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" type="text/javascript"></script>
            <script type="text/javascript">
                                            //Plus & Minus for Quantity product
                                            $(document).ready(function () {
                                                var quantity = 1;

                                                $('.quantity-right-plus').click(function (e) {
                                                    e.preventDefault();
                                                    var quantity = parseInt($('#quantity').val());
                                                    $('#quantity').val(quantity + 1);
                                                });

                                                $('.quantity-left-minus').click(function (e) {
                                                    e.preventDefault();
                                                    var quantity = parseInt($('#quantity').val());
                                                    if (quantity > 1) {
                                                        $('#quantity').val(quantity - 1);
                                                    }
                                                });

                                            });
            </script>
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    const stars = document.querySelectorAll(".star");

                    stars.forEach(function (star) {
                        star.addEventListener("click", function () {
                            const rating = this.getAttribute("data-rating");
                            document.getElementById('selected_rating').value = rating;

                            stars.forEach(function (s) {
                                if (s.getAttribute("data-rating") <= rating) {
                                    s.classList.add("rated");
                                } else {
                                    s.classList.remove("rated");
                                }
                            });
                        });
                    });
                });

            </script>

            <script src="//code.jquery.com/jquery-3.2.1.slim.min.js" type="text/javascript"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" type="text/javascript"></script>
            <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" type="text/javascript"></script>

    </body>

</html>
<style>
    /* Thêm CSS để điều chỉnh hình ảnh sao */
    .rating {
        unicode-bidi: bidi-override;
        direction: ltr;
        text-align: center;
    }
    .rating > .star {
        display: inline-block;
        position: relative;
        cursor: pointer;
        font-size: 24px;
    }
    .rating > .star:hover:before,
    .rating > .star.rated:before {
        content: "\2605";
        position: absolute;
        left: 0;
        color: orange;
    }
</style>