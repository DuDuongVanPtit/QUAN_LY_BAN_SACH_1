
<%@page import="model.c_SACHYEUTHICH"%>
<%@page import="model.m_GIOHANG"%>
<%@page import="model.c_THELOAI"%>
<%@page import="model.c_TACGIA"%>
<%@page import="model.c_DONHANG"%>
<%@page import="model.m_DONHANG"%>
<%@page import="model.m_KHACHHANG"%>
<%@page import="model.m_NXB"%>
<%@page import="model.c_NXB"%>
<%@page import="model.m_TACGIA"%>
<%@page import="model.c_TACGIA"%>
<%@page import="model.m_THELOAI"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.c_THELOAI"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
  <meta charset="UTF-8">
    </head>
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
    <script>
        $(document).ready(function () {
            $(".img").hide();
        });
    </script>
    <body>
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
        <div class="mn">
            <div class="container">
                <div class="col-sm-6" style="margin-top: 10px">
                    <div class="contactinfo">
                        <ul class="nav nav-pills ModuleContent">
                            <li><span>HOTLINE <em class="fa fa-caret-right"></em> </span><strong> 0326 765 923</strong></li>
                          
                        </ul>
                    </div>
                </div>
                <div class="shop-menu pull-right">
                    <ul class="nav navbar-nav">  
                        <li class="dropdown">
                            <%
                                m_KHACHHANG kh = (m_KHACHHANG) session.getAttribute("khachHang");
                                if (kh != null) {
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
                            <a data-toggle="dropdown" class="lg" href="#" style="color: #00923f;"> Xin chào <%=kh.getTenKH()%></a>
                            <ul class="dropdown-menu l">
                                <div class="signup-form"><!--sign up form-->
                                    <div class ="form_dk">
                                        <input type="email" placeholder="Email" class="email_dn" value="<%=kh.getEmail()%>"/><span id="msg" style="font-size: 12px"></span>
                                        <input type="password" placeholder="Mật khẩu" value="<%=kh.getMatKhau()%>" class="matKhau_dn"/>
                                        <button type="button" class="btn btn-default pull-right"  id ="dangNhap" >Đăng xuất</button>
                                        <button type="button" class="btn btn-default ml"  data-toggle="modal" data-target="#myModal" >Đăng ký</button>
                                    </div>
                                </div><!--/sign up form-->
                            </ul>
                            <%} else {%>
                            <a hrer="#" data-toggle="dropdown" class="lg login" style="color: #696763;"><i class="fa fa-lock"></i> Đăng nhập</a>
                            <ul class="dropdown-menu l" >
                                <div class="signup-form"><!--sign up form-->
                                    <div class ="form_dk">
                                        <input type="email" placeholder="Email" class="email_dn" /><span id="msg" style="font-size: 12px"></span>
                                        <input type="password" placeholder="Mật khẩu" class="matKhau_dn"/>
                                        <button type="button" class="btn btn-default"  id ="dangNhap" >Đăng nhập</button>
                                        <button type="button" class="btn btn-default ml"  data-toggle="modal" data-target="#myModal" >Đăng ký</button>
                                    </div>
                                </div><!--/sign up form-->
                            </ul>
                            <%}%>
                        </li>
                        <li>
                            <a href="content.jsp?id=1"><img class="img-responsive" src="../images/home/cart.png"/></a>
                            <span class="c1" style="top: 20%;left: 60%; display: none"></span>
                        </li>
                        <li class="ad" style="display: none">
                            <a href="http://localhost:8080/admin/index.jsp" >Trang ADMIN</a>
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
                    
                    
                    <div class="col-sm-3 col-xs-6" id="nav-fill">
                        <form id="search-form" action="servlet_timSach" method="post"> <!-- Đường dẫn và phương thức của servlet -->
                            <input type="text" id="searchbook" placeholder="Tên sách..." />
                            <button id="searchBook-btn">Tìm</button>
                        </form>
<!--                        <input type="text" id="searchbook"  placeholder="Tên sách..." />
                        <button id="searchBook-btn">tìm</button>-->
<!--                        <ul class="nav navbar-nav collapse navbar-collapse" style="display: inline">       
                            <li class="search_box">
                                <input type="text" id="searchbook"  placeholder="Tên sách ..." />
                            </li>
                            <li class="dropdown">
                                <a href="#" style="color:black">Lọc <i class="fa fa-angle-down"></i></a>
                                <ul role="menu" class="sub-menu" style="width: 150px">
                                    <li><a href="#" class="ten_sach">Tên sách</a></li>                                  
                                    <li><a href="#" class="tac_gia">Tác giả</a></li> 
                                    <li><a href="#" class="nha_xuat_ban">Nhà xuất bản</a></li> 
                                </ul>
                            </li>
                        </ul>          -->
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
                            <li><a href="content.jsp?id=1" >Thanh toán</a></li>   
                             <li><a href="content.jsp?id=4" >Giới thiệu</a></li>
                            <li>
                                <a href="content.jsp?id=2" >Tài khoản</a>
                                <span class="c2" style="top: -17%;left: 80%; display: none"></span>
                            </li>

                        </ul>
                    </div>
          
                </div>
            </div>
        </div><!--/header-bottom-->

    </header>
    <!--/header-->


    <div class="container">

        <div class="col-sm-3" >
                <div id="bar row" style="background: white">
                    <br/>
                    <div class="theLoai panel-group ">
                        <%
                            c_THELOAI tl = new c_THELOAI();
                            List<m_THELOAI> list1 = new ArrayList<m_THELOAI>();
                            list1 = tl.getlist();
                        %>
                        <h2 class="title text-center ma" style="margin-top: 0px; margin-right: 0; margin-left: 0;">Thể loại</h2>

                        <ul class="nav nav-pills nav-stacked g category-products ">
                            <%
                                for (m_THELOAI tll : list1) {
                                    int idTheLoai = tll.getMaTheLoai();
                            %>
                            <li class="TheLoai" name="<%=idTheLoai%>"><a href="#">
                                    <span class="pull-right">(<%= c_THELOAI.getSoLuongSachCuaTheLoai(idTheLoai)%>)
                                    </span><%= tll.getTenTheLoai()%></a></li>                                  
                                    <%}%>
                        </ul>
                    </div>
                    <div class="tacGia panel-group ">
                        <%
                            c_TACGIA t = new c_TACGIA();
                            List<m_TACGIA> list2 = new ArrayList<m_TACGIA>();
                            list2 = t.getlist();
                        %>
                        <h2 class="title text-center ma" style="margin-top: 0px; margin-left: 0; margin-right: 0">Tác giả</h2>

                        <ul class="nav nav-pills nav-stacked g category-products">
                            <%
                                for (m_TACGIA tg : list2) {
                                    int idTacGia = tg.getMaTacGia();
                            %>
                            <li class="TacGia" name="<%=idTacGia%>" ><a href="#"> <span class="pull-right">(<%= c_TACGIA.getSoLuongSachCuaTG(tg.getMaTacGia())%>)
                                    </span><%= tg.getTenTacGia()%></a></li>

                            <%}%>
                        </ul>
                    </div>
                        <div class="Nhaxuatban panel-group " style="padding-bottom: 146px">
                        <%
                            c_NXB n = new c_NXB();
                            List<m_NXB> list3 = new ArrayList<m_NXB>();
                            list3 = n.getlist();
                        %>
                        <h2 class="title text-center ma" style="margin-top: 0px; margin-left: 0; margin-right: 0;">Nhà xuất bản</h2>

                        <ul class="nav nav-pills nav-stacked g category-products">
                            <%
                                for (m_NXB nx : list3) {
                                    int idNXB = nx.getMaNXB();
                            %>
                            <li class="nxb" name="<%=idNXB%>" ><a href="#"> <span class="pull-right">(<%= c_NXB.getSoLuongSachCuaNXB(nx.getMaNXB())%>)
                                    </span><%= nx.getTenNXB()%></a></li>

                            <%}%>
                        </ul>

                    </div>   
                         
                </div>
                            <div class="panel-group img1" style="margin-top: 90px"> 
                        <img class="media-object" src="images/home/1.png">
                       </div>
                        <div class="panel-group img2" style="margin-top: 95px"> 
                         <img class="media-object" src="images/home/2.png">
                        </div>
                   
            </div>

            <div class="col-sm-9">
                
                <div id="slider"><jsp:include page="slider.jsp"></jsp:include></div>
              
                <br/>
                <br/>
                <div id="main_bar"><center><img style="width: 5%; margin-top: 30px" class="img-responsive" src="images/home/load.gif"/></center></div>
            </div>
                
                
                <div class="col-sm-12" style="margin-top: 36px"> <img class="media-object img-responsive" src="images/home/3.jpg"></div>
    </div>
               
    <div id="result"></div>
    
    <div ><jsp:include page="footer.jsp"></jsp:include></div>

</body>
</html>
<script>
    $(document).ready(function () {
        $('#searchBook-btn').click(function(event) {
            // Ngăn chặn hành vi mặc định của nút submit
            event.preventDefault();

            // Lấy giá trị của input
            var tenSach = $('#searchbook').val();

            // Gửi AJAX request
            $.ajax({
                url: 'servlet_timSach', // Đường dẫn đến Servlet của bạn
                type: 'POST', // Phương thức POST
                data: { ten: tenSach }, // Dữ liệu gửi đi, ở đây là tên sách
                success: function(data) { // Xử lý kết quả trả về từ Servlet
                    // Phân tích dữ liệu JSON thành một mảng JavaScript
                    console.log(data);
                    
                    var books = JSON.parse(data);

                    // Xóa nội dung cũ của mô hình trước khi thêm dữ liệu mới
                    $('#result').empty();

                    // Lặp qua mỗi cuốn sách trong mảng
                    books.forEach(function(book) {
                        // Tạo một phần tử HTML mới cho cuốn sách
                        var bookElement = $('<div class="book">\
                                                <img src="' + book.LinkAnh + '" alt="Book Cover" class="book-cover">\
                                                <div class="book-details">\
                                                    <h3 class="book-title">' + book.TenSach + '</h3>\
                                                    <p class="book-author">Tác giả: ' + book.MaTacGia + '</p>\
                                                    <p class="book-summary">' + book.TomTat + '</p>\
                                                    <p class="book-price">Giá bìa: ' + book.GiaBia + '</p>\
                                                    <!-- Thêm thông tin sách khác nếu cần -->\
                                                </div>\
                                            </div>');

                        // Thêm phần tử sách vào mô hình
                        $('#result').append(bookElement);
                    });
                },
                error: function(xhr, status, error) { // Xử lý khi có lỗi xảy ra
                    console.error(error); // In ra lỗi để kiểm tra
                }
            });
        });
        
        
        
//        $(".n").click(function () {
//            var url, data;
//            url = "product_details.jsp";
//            data = {"id": 1};
//            $("#main_bar").html('<center><img style="width: 4%; margin-top: 30px; margin-bottom:600px" class="img-responsive" src="images/home/load.gif"/></center>');
//            $("#main_bar").load(url, data);
//        });
//        
//        $('#searchBook-btn').click(function() { // Bắt sự kiện khi người dùng nhấp chuột vào nút tìm kiếm
//            var tenSach = $('#searchbook').val(); // Lấy giá trị của input
//            $.ajax({
//                url: 'servlet_timSach', // Đường dẫn đến Servlet của bạn
//                type: 'GET', // Phương thức gửi dữ liệu
//                data: { ten: tenSach }, // Dữ liệu gửi đi, ở đây là tên sách
//                success: function(data) { // Xử lý kết quả trả về từ Servlet
//                    // Ở đây bạn có thể xử lý dữ liệu trả về, ví dụ hiển thị lên giao diện
//                    console.log(data); // In ra console để kiểm tra
//                },
//                error: function(xhr, status, error) { // Xử lý khi có lỗi xảy ra
//                    console.error(error); // In ra lỗi để kiểm tra
//                }
//            });
//        });
    });

</script>  