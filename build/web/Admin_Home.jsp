<%-- 
   Document   : profile.jsp
   Created on : Sep 3, 2023, 3:40:49 PM
   Author     : Hoang Van An
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width initial-scale=1.0">
        <title>Admin dashboard</title>
        <!-- GLOBAL MAINLY STYLES-->
        <link href="./assets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link href="./assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
        <link href="./assets/vendors/themify-icons/css/themify-icons.css" rel="stylesheet" />
        <!-- PLUGINS STYLES-->
        <link href="./assets/vendors/jvectormap/jquery-jvectormap-2.0.3.css" rel="stylesheet" />
        <script src="https://kit.fontawesome.com/d75d72b9b4.js" crossorigin="anonymous"></script>
        <!-- THEME STYLES-->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>

        <link href="assets/css/main.min.css" rel="stylesheet" />
        <!-- PAGE LEVEL STYLES-->

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>

    <body class="fixed-navbar sidebar-mini">
        <div class="page-wrapper">
            <!-- START HEADER-->
            <header class="header">
                <div class="page-brand">
                    <a class="link" href="home.jsp">
                        <span class="brand">ANBOOK ADMIN</span>
                        <span class="brand-mini">AM</span>
                    </a>
                </div>
                <div class="flexbox flex-1">
                    <!-- START TOP-LEFT TOOLBAR-->
                    <ul class="nav navbar-toolbar">
                        <li>
                            <a class="nav-link sidebar-toggler js-sidebar-toggler"><i class="ti-menu"></i></a>
                        </li>
                        <li>
                            <form class="navbar-search" action="javascript:;">
                                <div class="rel">
                                </div>
                            </form>
                        </li>
                    </ul>
                    <!-- END TOP-LEFT TOOLBAR-->
                    <!-- START TOP-RIGHT TOOLBAR-->
                    <ul class="nav navbar-toolbar">
                        <li class="dropdown dropdown-user">
                            <a class="nav-link dropdown-toggle link" data-toggle="dropdown">
                                <img src="./assets/img/me.jpg" />
                                <span>${user.name}</span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" href="profile.jsp"><i class="fa fa-user"></i>Home</a>
                                <a class="dropdown-item" href="history.jsp"><i class="fa fa-cog"></i>History</a>
                                <a class="dropdown-item" href="data.jsp"><i class="fa fa-support"></i>Data</a>
                                <li class="dropdown-divider"></li>
                                <a class="dropdown-item" href="login.jsp"><i class="fa fa-power-off"></i>Logout</a>
                            </ul>
                        </li>
                    </ul>
                    <!-- END TOP-RIGHT TOOLBAR-->
                </div>
            </header>
            <!-- END HEADER-->
            <!-- START SIDEBAR-->
            <nav class="page-sidebar" id="sidebar">
                <div id="sidebar-collapse">
                    <div class="admin-block d-flex">
                        <div>
                            <img src="./assets/img/me.jpg"  width="40px" style="border-radius: 50%;"/>
                        </div>
                        <div class="admin-info">
                            <div class="font-strong">${user.name}</div><small>${user.username}</small></div>
                    </div>
                    <ul class="side-menu metismenu">
                        <li>
                            <a href="home.jsp"><i class="sidebar-item-icon fa-solid fa-house"></i>
                                <span class="nav-label">Home</span>
                            </a>
                        </li>
                        <li class="heading">PAGES</li>
                        <li>
                            <a class="active" href="profile.jsp"><i class="sidebar-item-icon fa-solid fa-user"></i>
                                <span class="nav-label">Profile</span></a>
                        </li>
                        <li>
                            <a href="history.jsp"><i class="sidebar-item-icon fa fa-edit"></i>
                                <span class="nav-label">History</span></a>
                        </li>
                        <li>
                            <a href="data.jsp"><i class="sidebar-item-icon fa-solid fa-database"></i>
                                <span class="nav-label">Data</span></a>
                        </li>
                        <li class="heading">ORTHERS</li>
                    </ul>
                </div>
            </nav>
            <!-- END SIDEBAR-->

            <div class="content-wrapper">
                <div class="page-content fade-in-up">
                    <div class="row">
                        <div class="col-lg-4 col-md-6">
                            <div class="ibox color-white widget-stat bg-purple" id="temperatureWidget">
                                <div class="ibox-body">
                                    <h2 class="m-b-5 font-strong" id="temperatureValue">Khách hàng</h2>
                                    <div class="m-b-5">10 khách hàng mới</div><i class="fa-solid fa-user widget-stat-icon"></i>
                                    <div><i class="fa-solid fa-clock"></i> <small id="timecontrol1">Trung Bình</small></div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-lg-4 col-md-6">
                            <div class="ibox color-white widget-stat bg-yellow" id="temperatureWidget">
                                <div class="ibox-body">
                                    <h2 class="m-b-5 font-strong" id="temperatureValue">Đánh giá</h2>
                                    <div class="m-b-5">20 đánh giá mới</div><i class="fa-solid fa-magnifying-glass widget-stat-icon"></i>
                                    <div><i class="fa-solid fa-clock"></i> <small id="timecontrol1">Trung Bình</small></div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-lg-4 col-md-6">
                            <div class="ibox color-white widget-stat bg-success" id="temperatureWidget">
                                <div class="ibox-body">
                                    <h2 class="m-b-5 font-strong" id="temperatureValue">Đơn hàng</h2>
                                    <div class="m-b-5">20 đơn hàng mới</div><i class="fa-solid fa-list widget-stat-icon"></i>
                                    <div><i class="fa-solid fa-clock"></i> <small id="timecontrol1">Trung Bình</small></div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        <!-- BEGIN PAGA BACKDROPS-->
        <div class="sidenav-backdrop backdrop"></div>
        <div class="preloader-backdrop">
            <div class="page-preloader">Loading</div>
        </div>
        <!-- END PAGA BACKDROPS-->
        <!-- CORE PLUGINS-->
        <script src="./assets/vendors/jquery/dist/jquery.min.js" type="text/javascript"></script>
        <script src="./assets/vendors/popper.js/dist/umd/popper.min.js" type="text/javascript"></script>
        <script src="./assets/vendors/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="./assets/vendors/metisMenu/dist/metisMenu.min.js" type="text/javascript"></script>
        <script src="./assets/vendors/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <!-- PAGE LEVEL PLUGINS-->
        <script src="./assets/vendors/chart.js/dist/Chart.min.js" type="text/javascript"></script>
        <!-- CORE SCRIPTS-->
        <script src="assets/js/app.min.js" type="text/javascript"></script>
        <!-- PAGE LEVEL SCRIPTS-->
        <script src="./assets/js/scripts/profile-demo.js" type="text/javascript"></script>
    </body>
</html>
<style>
    a{
        text-decoration: none;
    }
    .profile-social a {
        font-size: 16px;
        margin: 0 10px;
        color: #999;
    }

    .profile-social a:hover {
        color: #485b6f;
    }

    .profile-stat-count {
        font-size: 22px
    }
</style>
