<%-- 
    Document   : Home
    Created on : May 4, 2023, 2:59:22 PM
    Author     : Hoang Van An
--%>
<%@page import="model.Category"%>
<%@page import="model.Users"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Trang chủ</title>
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
        <!--begin of menu-->
        <!-- Menu -->
        <jsp:include page="Menu.jsp"></jsp:include>
            <!--end of menu-->

            <!-- Thanh slider -->
            <div class="container mt-3 mb-3">
                <div class="row">
                    <div class="col-sm-9 d-flex">
                        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                                <!-- Thêm các điểm chỉ mục cho mỗi slide -->
                            </ol>
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img class="d-block w-100" src="./img/slider/slider1.webp" alt="First slide">
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block w-100" src="./img/slider/slider2.png" alt="Second slide">
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block w-100" src="./img/slider/slider3.png" alt="Second slide">
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block w-100" src="./img/slider/slider4.jpg" alt="Second slide">
                                </div>
                                <!-- Thêm các slide khác -->
                            </div>
                            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-3 d-flex">
                        <div class="card bg-light">
                            <div class="card-header bg-primary text-white text-uppercase"><i class="fa-solid fa-star"></i> BÁN CHẠY NHẤT</div>
                            <div class="card-body">
                                <center><img class="img-fluid" style="width: 42%; height: auto;" src="${lastB.image}"></center>
                            <h6 class="card-title">${lastB.title}</h6>
                            <div style="display: flex; justify-content: space-between;">
                                <p style="text-align: left; font-size: 1em; margin: 0; color: red"><strong>${lastB.price}đ</strong></p>
                                <p style="text-align: right; font-size: 1em; margin: 0;">${lastB.authorname}</p>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>

        <div class="container">
            <div class="row">
                <div class="col">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home">Home</a></li>
                            <li class="breadcrumb-item"><a href="category">Category</a></li>
                            <li class="breadcrumb-item"><a href="#"></a></li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="card bg-light mb-3">
                        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> DANH MỤC</div>
                        <ul class="list-group category_block">
                            <c:forEach var="cate" items="${listC}">
                                <li class="list-group-item text-white"><a href="home?action=cateview&cid=${cate.id}">${cate.name}</a></li>
                                </c:forEach> 
                        </ul>
                    </div>
                    <div class="card bg-light mb-3">
                        <div class="card-header bg-success text-white text-uppercase"><i class="fa-solid fa-star"></i> Sản phẩm mới nhất</div>
                        <div class="card-body">
                            <center><img class="img-fluid" src="${lastB.image}"></center>
                            <h5 class="card-title">${lastB.title}</h5>
                            <div style="display: flex; justify-content: space-between;">
                                <p style="text-align: left; font-size: 15px; margin: 0; color: red"><strong>${lastB.price}đ</strong></p>
                                <p style="text-align: right; font-size: 15px; margin: 0;">${lastB.authorname}</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-9">
                    <div class="row">
                        <c:forEach var="book" items="${listB}">
                            <div class="col-12 col-md-6 col-lg-3 mb-3" onmouseover="this.style.transform = 'scale(1.03)'" onmouseout="this.style.transform = 'scale(1)'" style="transition: 0.3s">
                                <a href="bookdetail?action=view&bookid=${book.bookid}">
                                    <div style="border: 1px solid #CCC" class="card">
                                        <img class="card-img-top position-relative" src="${book.image}" alt="Card image cap">
                                        <span class="badge badge-danger rounded-circle position-absolute top-0 card-sale start-100 translate-middle">-25%</span>
                                        <div class="card-body">
                                            <h4 class="card-title" style="font-size: 12px">
                                                <a href="books_detail?action=view&bid=${book.bookid}" title="View Product">${book.title}</a>
                                            </h4>
                                            <p class="card-text" style="font-size: 12px">${book.authorname}</p>
                                            <div style="display: flex; justify-content: space-between;">
                                                <p style="text-align: left; font-size: 15px; margin: 0; color: red"><strong>${book.price}đ</strong></p>
                                                <p style="text-align: right; font-size: 12px; margin: 0;">${book.soldcount} đã bán</p>
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
        <!-- Footer -->
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
<style>
    .card-sale {
        top: 0;
        right: 0;
    }
</style>