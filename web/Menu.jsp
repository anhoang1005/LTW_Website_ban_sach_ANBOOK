<%-- 
    Document   : Menu
    Created on : May 6, 2023, 4:38:59 PM
    Author     : Hoang Van An
--%>

<%@page import="model.Users"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Menu -->

<%
    Users user = (Users)session.getAttribute("user");
%>

<%
    if(user!= null && user.getRole().equals("Admin")){
%>
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="home?action=view"><i class="fa-brands fa-shopify"></i> ANBOOK</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <ul class="navbar-nav m-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="home?action=view">Trang chủ<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="admin_books?action=view">Danh sách</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="Contact.jsp"><i class="fa-solid fa-gear"></i> Admin DashBoard</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa-solid fa-user" style="font-size: 12px"></i> <%= user.getName()%>(Admin)</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#"><i class="fa-solid fa-user"></i> Tài khoản</a>
                        <a class="dropdown-item" href="users?action=logout"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
                    </div>
                </li>
            </ul>
            <form action="home?action=search" method="post" class="form-inline my-2 my-lg-0" accept-charset="UTF-8">
                <div class="input-group input-group-sm">
                    <input value="${txtS}" name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Tìm kiếm...">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary btn-number">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
                <a class="btn btn-success btn-sm ml-3 position-relative" href="Cart.jsp">
                    <i class="fa fa-shopping-cart"></i> Giỏ hàng
                    <span class="badge badge-danger rounded-circle position-absolute top-0 start-100 translate-middle">
                    0
                    </span>
                </a>
                <a class="btn btn-success btn-sm ml-3 position-relative dropdown" href="#" >
                    <i class="fa-solid fa-bell"></i>
                    <span class="badge badge-danger rounded-circle position-absolute top-0 start-100 translate-middle">
                    0
                    </span>
                </a>
            </form>
        </div>
    </div>
</nav>
<%
    }
%>

<%
    if(user!= null && user.getRole().equals("Customer")){
%>
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="home?action=view"><i class="fa-brands fa-shopify"></i> ANBOOK</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <ul class="navbar-nav m-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="home?action=view">Trang chủ<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="admin_books?action=view">Danh sách</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="Contact.jsp">Thông tin</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa-solid fa-user" style="font-size: 12px"></i> <%= user.getName()%></a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="Profile.jsp"><i class="fa-solid fa-user"></i> Tài khoản</a>
                        <a class="dropdown-item" href="customerorder?action=view"><i class="fa-solid fa-bag-shopping"></i> Đơn hàng của tôi</a>
                        <a class="dropdown-item" href="users?action=logout"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
                    </div>
                </li>  
            </ul>
            <form action="home?action=search" method="post" class="form-inline my-2 my-lg-0" accept-charset="UTF-8">
                <div class="input-group input-group-sm">
                    <input value="${txtS}" name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Tìm kiếm...">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary btn-number">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
            </form>
                <div class="btn btn-success btn-sm ml-3 position-relative dropdown">
                    <a style="color: white" class="dropdown-toggle" data-toggle="dropdown" href="#" role="button"><i class="fa-solid fa-bell"></i></a>
                    <span class="badge badge-danger rounded-circle position-absolute top-0 start-100 translate-middle">
                        ${fn:length(listN)}
                    </span>
                    <div style="min-width: 200px; max-width: 220px ;max-height: 300px; overflow: auto" class="dropdown-menu">
                        <c:forEach var="notifi" items="${listN}">
                            <a class="dropdown-item" href="#">
                                <img style="width: 30%; height: auto; max-width: 30px" src="https://i.pinimg.com/236x/c2/f6/52/c2f652b8e274a1afe838d753251a0c47.jpg" alt="alt"/>
                                ${notifi.createAt}
                                <br>
                                ${notifi.message}
                            </a>
                        </c:forEach>
                    </div>
                </div>
                <a class="btn btn-success btn-sm ml-3 position-relative" href="Cart.jsp">
                    <i class="fa fa-shopping-cart"></i> Giỏ hàng
                    <span class="badge badge-danger rounded-circle position-absolute top-0 start-100 translate-middle">
                        ${fn:length(cart)}
                    </span>
                </a>
        </div>
    </div>
</nav>
<%
    }
%>


<%
   if(user == null){
%>
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="home?action=view"><i class="fa-brands fa-shopify"></i> ANBOOK</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <ul class="navbar-nav m-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="home?action=view">Trang chủ<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="admin_books?action=view">Danh sách</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="Contact.jsp">Thông tin</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Login.jsp"><i class="fa-solid fa-right-to-bracket"></i> Đăng nhập</a>
                </li> 
                
            </ul>
            <form action="home?action=search" method="post" class="form-inline my-2 my-lg-0" accept-charset="UTF-8">
                <div class="input-group input-group-sm">
                    <input value="${txtS}" name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Tìm kiếm...">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary btn-number">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
                <a class="btn btn-success btn-sm ml-3" href="Login.jsp">
                    <i class="fa fa-shopping-cart"></i> Giỏ hàng
                    <span class="badge badge-light"></span>
                </a>
                <a class="btn btn-success btn-sm ml-3" href="Login.jsp" >
                    <i class="fa-solid fa-bell"></i>
                    <span class="badge badge-light"></span>
                </a>
            </form>
        </div>
    </div>
</nav>
<%
    }
%>