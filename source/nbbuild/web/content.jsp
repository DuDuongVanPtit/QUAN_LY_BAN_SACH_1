
<%@page import="model.c_SACHYEUTHICH"%>
<%@page import="model.m_KHACHHANG"%>
<%@page import="model.c_TACGIA"%>
<%@page import="model.m_GIOHANG"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
  <meta charset="UTF-8">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="../images/home/iconlogo.png">
        <title>Read & Relax | Home</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">   

        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min_1.js"></script>
        <script type="text/javascript" src="js/jquery.autocomplete.min.js"></script>
        <script src="js/main.js"></script>
        <script src="js/c.js"></script>
        <link href="css/animate.css" rel="stylesheet"> 
    </head>
    <%
        m_KHACHHANG km = (m_KHACHHANG) session.getAttribute("khachHang");
        if (km != null) {
            if (km.getEmail().equals("admin")) {
    %>
    <script>
        $(document).ready(function () {
            $(".ad").show();
        });
    </script>
    <%} else {%>
    <script>
        $(document).ready(function () {
            $(".ad").hide();
        });
    </script>
    <% }
        }%>

    <%
        int j = 0;
        int tt = 0;
        ArrayList<m_GIOHANG> cart = (ArrayList<m_GIOHANG>) session.getAttribute("cart");
        if (cart != null) {
            j = cart.size();
        }
    %> 
    <script>
        $(document).ready(function () {
            var o = <%= j%>;
            if (o > 0)
            {
                $(".c1").html(o).show();
            } else
            {
                $(".c1").hide();
            }
        });
    </script>
    <body>

        <div class="mn">
            <div class="container">
                <div class="col-sm-6" style="margin-top: 10px">
                    <div class="contactinfo">
                        <ul class="nav nav-pills ModuleContent">
                            <li><span>HOTLINE <em class="fa fa-caret-right"></em> </span><strong> 0326.765.923</strong></li>

                        </ul>
                    </div>
                </div>
                <div class="shop-menu pull-right">
                    <ul class="nav navbar-nav">  
                        <li class="dropdown">
                            <%
                                int i = 0;
                                m_KHACHHANG kh = (m_KHACHHANG) session.getAttribute("khachHang");
                                if (kh != null) {
                                    i = 1;
                                    int syt = c_SACHYEUTHICH.soSachYeuThich(kh.getMaKH());
                            %>
                            <script>
                                $(document).ready(function () {
                                    var oo = <%= syt%>;
                                    if (oo > 0)
                                    {
                                        $(".c2").html(oo).show();
                                    } else
                                    {
                                        $(".c2").hide();
                                    }
                                    $('.ml').hide();
                                });
                            </script>  
                            <a data-toggle="dropdown" class="lg" style="color: #00923f;">Xin chào <%=kh.getTenKH()%></a>
                            <ul class="dropdown-menu l">
                                <div class="signup-form"><!--sign up form-->
                                    <div class ="form_dk">
                                        <input type="email" placeholder="Email" class="email_dn" value="<%=kh.getEmail()%>"/><span id="msg" style="font-size: 12px"></span>
                                        <input type="password" placeholder="Mật khẩu" value="<%=kh.getMatKhau()%>" class="matKhau_dn"/>
                                        <button type="button" class="btn btn-default"  id ="dangNhap" >Đăng xuất</button>
                                        <button type="button" class="btn btn-default ml"  data-toggle="modal" data-target="#myModal">Đăng ký</button>
                                    </div>
                                </div><!--/sign up form-->
                            </ul>
                            <%} else {%>
                            <a data-toggle="dropdown" class="lg login" style="color: #696763;" ><i class="fa fa-lock"></i> Đăng nhập</a>
                            <ul class="dropdown-menu l">
                                <div class="signup-form"><!--sign up form-->
                                    <div class ="form_dk">
                                        <input type="email" placeholder="Email" class="email_dn" /><span id="msg" style="font-size: 12px"></span>
                                        <input type="password" placeholder="Mật khẩu" class="matKhau_dn"/>
                                        <button type="button" class="btn btn-default"  id ="dangNhap" >Đăng nhập</button>
                                        <button type="button" class="btn btn-default ml"  data-toggle="modal" data-target="#myModal">Đăng ký</button>

                                    </div>
                                </div><!--/sign up form-->
                            </ul>
                            <%}%>
                        </li>
                        <li>
                            <a href="#" class="gio_hang"><img class="img-responsive" src="images/home/cart.png"/></a>
                            <span class="c1" style="top: 20%;left: 60%; display: none"></span>
                        </li>
                        <li class="ad" style="display: none">
                            <a href="http://localhost:8080/admin/index.jsp" >Trang chủ</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    <header id="header_content"><!--header-->
        <div class="header-middle"><!--header-middle-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-3 col-xs-6">
                        <div class="logo pull-left">
                            <a href="index.jsp" class="logoo"><img class="img-responsive" src="images/home/logo.png"/></a>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xs-6">

                    </div>
                    <div class="col-sm-3 col-xs-6 ">
                        <ul class="nav navbar-nav collapse navbar-collapse">       
                            <li class="search_box">
                                <input type="text" class="timkiem biginput" name="currency"  id="autocomplete"  placeholder="Tên sách ..." />

                            </li>
                            <li class="dropdown">
                                <a href="#" style="color:black">Lọc <i class="fa fa-angle-down"></i></a>
                                <ul role="menu" class="sub-menu" style="width: 150px">
                                    <li><a href="#" class="ten_sach">Tên sách</a></li>                                  
                                    <li><a href="#" class="tac_gia">Tác giả</a></li> 
                                    <li><a href="#" class="nha_xuat_ban">Nhà xuất bản</a></li> 
                                </ul>
                            </li>
                        </ul>          
                        <!-- Modal -->
                        <div class="modal fade" id="myModal">
                            <div class="modal-dialog">
                                <div class="modal-content lm">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <center><h3 class="modal-title" style="font-size: 16px; margin-top: 25px; color: #00923f">ĐĂNG KÝ TÀI KHOẢN</h3></center>
                                    </div>
                                    <div class="modal-body">
                                        <div class="signup-form">
                                            <table class="table">
                                                <tr>
                                                    <td><input type="text" placeholder="Mã tài khoản" class="ma_dk" disabled/></td>
                                                    <td><input type="text" placeholder="Tên tài khoản" class="ten_dk"/></td>
                                                </tr>
                                                <tr>
                                                    <td><input type="text" placeholder="Địa chỉ" class="dc_dk"/></td>
                                                    <td><input type="email" placeholder="Email" class="email_dk" /><span class="msg" style="font-size: 12px"></span></td>
                                                </tr>
                                                <tr>
                                                    <td><input type="text" placeholder="Số điện thoại" class="sdt_dk"/></td>
                                                    <td><input type="password" placeholder="Mật khẩu" class="mk_dk"/></td>
                                                </tr>
                                            </table>
                                        </div><!--/sign up form-->
                                    </div>
                                    <div class="modal-footer">
                                        <p class="tb pull-left" style="font-size: 12px;margin-left: 5px"></p>
                                        <button class="btn btn-default dangKy">Gửi</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><!--/header-middle-->

        <div class="header-bottom"><!--header-bottom-->
            <div class="container">

                <div class="col-sm-3" style="background: #4eb141;">

                </div>
                <div class="col-sm-9">

                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="mainmenu pull-left">
                        <ul class="nav navbar-nav collapse navbar-collapse">
                            <li><a href="index.jsp" class="logoo" >Tất cả sách</a></li>                   

                            <li><a href="content.jsp?id=1" id="100">Thanh toán</a></li>       
                            <li><a href="content.jsp?id=4" id="40">Giới thiệu</a></li>
                            <li>
                                <a href="content.jsp?id=2"  id="20">Tài khoản</a>
                                <span class="c2" style="top: -17%;left: 80%; display: none"></span>
                            </li>

                        </ul>
                    </div>

                </div>
            </div>
        </div><!--/header-bottom-->

    </header>

    <div class="container">

        <div class="ctt">

            <% String id = request.getParameter("id");%>
            <script>
                $(document).ready(function () {


                    $('.tai_khoan,.yeu_thich').click(function () {
                        var b = <%= i%>;
                        if (b == '1')
                        {
                            // $("#content").html('<center><img style="width: 3%; margin-top: 30px;margin-bottom: 600px" class="img-responsive" src="images/home/load.gif"/></center>');
                            $("#content").load("acc.jsp");
                        } else
                        {
                            // $("#content").html('<center><img style="width: 3%; margin-top: 30px;margin-bottom: 600px" class="img-responsive" src="images/home/load.gif"/></center>');
                            $("#content").load("form_login.jsp");
                        }
                    });
                    jQuery(window).load(function () {
                        var idd = <%= id%>;
                        var b = <%= i%>;
                        if (idd == '1')
                        {
                            // $("#content").html('<center><img style="width: 3%; margin-top: 30px;margin-bottom: 600px" class="img-responsive" src="images/home/load.gif"/></center>');
                            $("#content").load("check_out_cart.jsp");
                        } else
                        {
                            if (idd == '2')
                            {
                                if (b == '1')
                                {
                                    // $("#content").html('<center><img style="width: 3%; margin-top: 30px;margin-bottom: 600px" class="img-responsive" src="images/home/load.gif"/></center>');
                                    $("#content").load("acc.jsp");
                                } else
                                {
                                    // $("#content").html('<center><img style="width: 3%; margin-top: 30px;margin-bottom: 600px" class="img-responsive" src="images/home/load.gif"/></center>');
                                    $("#content").load("form_login.jsp");
                                }
                            } else {
                                if (idd == '3')
                                {
                                    //  $("#content").html('<center><img style="width: 3%; margin-top: 30px;margin-bottom: 600px" class="img-responsive" src="images/home/load.gif"/></center>');
                                    $("#content").load("form_login.jsp");
                                } else {
                                    if (idd == '4')
                                    {
                                        //  $("#content").html('<center><img style="width: 3%; margin-top: 30px;margin-bottom: 600px" class="img-responsive" src="images/home/load.gif"/></center>');
                                        $('#content').load('contact_us.jsp');
                                    }
                                }
                            }
                        }
                    });
                });
            </script>
            <div id="content"><center><img style="width: 3%; margin-top: 30px; margin-bottom: 600px" class="img-responsive" src="images/home/load.gif"/></center></div>

        </div>
    </div>

    <div ><jsp:include page="footer.jsp"></jsp:include></div>
</body>
</html>