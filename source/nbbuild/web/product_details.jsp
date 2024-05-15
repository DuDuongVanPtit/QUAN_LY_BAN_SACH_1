
<%@page import="model.m_KHACHHANG"%>
<%@page import="model.m_NHANXET"%>
<%@page import="model.c_NHANXET"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="model.c_SACH"%>
<%@page import="model.c_TACGIA"%>
<%@page import="model.m_SACH"%>
<%@page import="model.c_THELOAI"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
  <meta charset="UTF-8">
<%
    Date date = new Date();
    DateFormat dateFormat1 = new SimpleDateFormat("yyyy/MM/dd");
    String ngay = dateFormat1.format(date);
    DateFormat dateFormat2 = new SimpleDateFormat("HH:mm:ss");
    String gio = dateFormat2.format(date);
%>

<script src="js/jquery.min.js"></script>


<div id="main_bar">
    <div class="detail_">
   
    <div class="product-details">
        <%
            String id = request.getParameter("id");
            int idd = Integer.parseInt(id);
            m_SACH s = c_SACH.timSachTheoMa(idd);
        %>
        <div class="col-xs-6 col-sm-4">
            <div class="view-product">
                <img src="<%=s.getLinkAnh()%>" />
            </div>
        </div>
        <div class="col-xs-12 col-sm-8">
            <div class="product-information">
                <div class="no">
                    <div class="row">
                        <img class="img-responsive newarrival" src="images/home/neww.png"/>
                        <h2><%=s.getTenSach()%></h2>
                        <div class="col-sm-5">              
                            <img src="images/home/rating.png" alt="" />
                            <p><b>Mã sách: </b><%= s.getMaSach()%></p>
                            <p><b>Tác giả: </b><%= c_TACGIA.getTenTacGia(s.getMaTacGia())%></p>
                            <p><b>Trạng thái:</b><% String tt;
                                if (s.getSoLuongTon() > 0) {
                                    tt = "   Còn hàng";
                                } else {
                                    tt = "   Hết hàng";
                                }%><%=tt%></p>
                        </div>
                        <div class="col-sm-7">    
                            <br/>
                            <p><i class="glyphicon glyphicon-ok"></i>  Dịch vụ bọc sách plastic cao cấp.</p>
                            <p><i class="glyphicon glyphicon-ok"></i>  Miễn phí giao hàng toàn quốc.</p>
                            <p><i class="glyphicon glyphicon-ok"></i>  Miễn phí đổi trả trong vòng 7 ngày.</p>
                        </div>
                    </div>

                    <span> <span>Giá: <%=s.getGiaBan()%> đ </span> 
                        <label>Số lượng:</label>
                        <input class="sl" type="number" value="1" min=1 />
                    </span>
                    <br/>
                </div>
                <center>
                    <a href="#"><button type="button" class="btn btn-default cart" id="themVaoGioHang" name="<%= s.getMaSach()%>">
                            <i class="fa fa-shopping-cart" ></i> Thêm vào giỏ hàng
                        </button></a>
                    <a href="#"><button type="button" class="btn btn-default cart" id="themVaoYeuThich">
                            <i class="fa fa-star" ></i> Thêm vào yêu thích
                        </button></a>
                </center> 
            </div>

            <!--/product-information-->
        </div>
    </div>

    <div class="category-tab shop-details-tab">
        <div class="col-sm-12">
            <ul class="nav nav-tabs">
                <li><a href="#details" data-toggle="tab">Nội dung</a></li>
                <li><a href="#companyprofile" data-toggle="tab">Thông tin
                        chi tiết</a></li>
                <li class="active"><a href="#reviews" data-toggle="tab">Nhận
                        xét(<%= c_NHANXET.soNhanXet(idd)%>)</a></li>
            </ul>
        </div>

        <div class="tab-content">
            <div class="tab-pane fade" id="details">
                <p style="line-height: 1.8">
                    "<%=s.getTomTat()%>"
                </p>
            </div>

            <div class="tab-pane fade" id="companyprofile">
                <table class="table">
                    <tr>
                        <td>Thể loại: </td>
                        <td><%= c_THELOAI.timTenTHELOAI(s.getMaTheLoai())%></td>
                    </tr>
                    <tr>
                        <td>Tác giả: </td>
                        <td><%= c_TACGIA.getTenTacGia(s.getMaTacGia())%></td>
                    </tr>
                    <tr>
                        <td>Năm xuất bản: </td>
                        <td><%= s.getNamXuatBan()%></td>
                    </tr>
                    <tr>
                        <td>Số trang: </td>
                        <td><%= s.getSoTrang()%></td>
                    </tr>
                    <tr>
                        <td>Khối lượng: </td>
                        <td><%= s.getKhoiLuong()%></td>
                    </tr>
                    <tr>
                        <td>Ngôn ngữ: </td>
                        <td><%= s.getNgonNgu()%></td>
                    </tr>
                    <tr>
                        <td>Gía bán: </td>
                        <td><%= s.getGiaBan()%></td>
                    </tr>
                    <tr>
                        <td>Khuyến mãi: </td>
                        <td>- <%= s.getKhuyenMai()%> %</td>
                    </tr>
                    <tr>
                        <td>Đánh giá: </td>
                        <td><%= s.getDiem()%> điểm </td>
                    </tr>
                </table>
            </div>

            <div class="tab-pane fade active in" id="reviews">
                <div class="col-sm-12">
                    <ul>
                        <li class="mk"><a><i class="fa fa-user"></i>NAME</a></li>
                        <li><a><i class="fa fa-clock-o"></i><%=gio%></a></li>
                        <li><a><i class="fa fa-calendar-o"></i><%=ngay%></a></li>
                    </ul>
                    <div class="DS_nhanXet">
                        <%
                            List<m_NHANXET> list9 = c_NHANXET.getlist(idd);
                            for (m_NHANXET k : list9) {%>
                        <div class="nxet">

                            <div>
                                <span>
                                    <img width="4%" src="images/home/us3.png" style="margin-right: 10px; border-radius: 50px"/><p style="display: inline; color:#3b5998;font-size: 14px;"><%= k.getTen()%></p>
                                    <i class="glyphicon glyphicon-map-marker" style="padding-left: 25px;padding-right: 15px; color:#9197a3;"></i><p style="display: inline; color:#9197a3"><%= k.getEmail()%></p>
                                </span>
                            </div> 
                            <p style="margin-left: 50px"><%= k.getNoiDung()%></p>    
                        </div>

                        <%}%>
                    </div>
                    <p style="margin-top: 20px">
                        <b>Viết bình luận</b>
                    </p>

                    <%
                        m_KHACHHANG kh = (m_KHACHHANG) session.getAttribute("khachHang");
                        if (kh != null) {
                    %>
                    <script>
                        $(document).ready(function () {
                            $("#reviews li:first").html('<a><i class="fa fa-user"></i><%= kh.getTenKH()%></a>');
                        });
                    </script>  
                    <form>
                        <span> 
                            <input type="text" placeholder="Tên" value="<%= kh.getTenKH()%>" class="ten_nx" name="<%=kh.getMaKH()%>"/> 
                            <input type="email" placeholder="Email" value="<%= kh.getEmail()%>" class="email_nx" />
                        </span>
                        <textarea class ="nd_nx"></textarea>

                        <div class="row">
                            <div class="col-sm-8">
                                <div class="form-group">
                                    <label><b>Đánh giá:  </b> </label>
                                    <label class="radio-inline q">
                                        <input type="radio" name="optionsRadiosInline"value="1" >1
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="optionsRadiosInline" value="2">2
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="optionsRadiosInline" value="3" checked="" >3
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="optionsRadiosInline" value="4">4
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="optionsRadiosInline" value="5">5
                                    </label>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <p class="thong_bao pull-right"></p>
                            </div>
                        </div>
                        <button type="button" class="btn btn-default pull-right" id="nx">Gửi</button>
                    </form>
                    <%} else {%>

                    <form>
                        <span> 
                            <input type="text" placeholder="Your Name" name="1" class="ten_nx"/> 
                            <input type="email" placeholder="Email Address" class="email_nx"/>
                        </span>
                        <textarea class="nd_nx"></textarea>
                        <div class="row">
                            <div class="col-sm-8">
                                <div class="form-group">
                                    <label><b>Đánh giá:  </b> </label>
                                    <label class="radio-inline q">
                                        <input type="radio" name="optionsRadiosInline"  value="1" >1
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="optionsRadiosInline" value="2">2
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="optionsRadiosInline" value="3" checked="">3
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="optionsRadiosInline" value="4">4
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="optionsRadiosInline" value="5">5
                                    </label>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <p class="thong_bao pull-right"></p>
                            </div>
                        </div>

                        <button type="button" class="btn btn-default pull-right" id="nx">Gửi</button>
                    </form>
                    <%}%>
                </div>
            </div>

        </div>
    </div>
    </div>
    <!--/category-tab-->
    
     <br/>
   <br/>
   <div class="recommended_items"><!--recommended_items-->
       <h2 class="title text-center" style="padding-top: 0px">Sách cùng tác giả</h2>
        <div id="new-book-carousel" class="carousel slide" data-ride="carousel" data-interval="false">
            <div class="carousel-inner">
                <div class="item active  ">	
                    <%
                        List<m_SACH> list3 = c_SACH.cungTacGia(0, s.getMaTacGia());
                        for (m_SACH ss : list3) {
                    %>
                    <div class="col-xs-6 col-sm-4">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <a href="#" class="xemChiTiet" name="<%= ss.getMaSach()%>">
                                    <div class="productinfo text-center">

                                        <center><img src="<%= ss.getLinkAnh()%>" class="avtBook"/></center>
                                        <span class="savings-tab s3"> - <%= ss.getKhuyenMai()%> %</span>

                                        <h4><%= ss.getTenSach()%></h4>
                                            <p class="author"><% String tenTacGia;
                                            tenTacGia = c_TACGIA.getTenTacGia(ss.getMaTacGia());%> <%= tenTacGia%></p>
                                             
                                    </div>
                                    <div class="product-overlay">
                                        <div class="overlay-content">
                                            <p class="m"><%= ss.getTenSach()%></p>
                                            <p class="author"><% String tenTacGia1;
                                                    tenTacGia1 = c_TACGIA.getTenTacGia(ss.getMaTacGia());%> <%= tenTacGia1%></p>
                                            <h3><%= ss.getGiaBan()%> đ</h3>
                                            <div class="btn btn-default add-to-cart"><i class="glyphicon glyphicon-hand-up"></i>Chi tiết</div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>  
                    <%}%>

                </div>
                <div class="item">	
                    <%
                        List<m_SACH> list4 = c_SACH.cungTacGia(1, s.getMaTacGia());
                        for (m_SACH sss : list4) {
                    %>
                    <div class="col-xs-6 col-sm-4">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <a href="#" class="xemChiTiet" name="<%= sss.getMaSach()%>">
                                    <div class="productinfo text-center">

                                        <center><img src="<%= sss.getLinkAnh()%>" class="avtBook"/></center>
                                        <span class="savings-tab s3"> - <%= sss.getKhuyenMai()%> %</span>
                                        <h4><%= sss.getTenSach()%></h4>
                                            <p class="author"><% String tenTacGia;
                                                tenTacGia = c_TACGIA.getTenTacGia(sss.getMaTacGia());%> <%= tenTacGia%></p>
                                      
                                    </div>
                                    <div class="product-overlay">
                                        <div class="overlay-content">
                                            <p class="m"><%= sss.getTenSach()%></p>
                                            <p class="author"><% String tenTacGia1;
                                                    tenTacGia1 = c_TACGIA.getTenTacGia(sss.getMaTacGia());%> <%= tenTacGia1%></p>
                                            <h3><%= sss.getGiaBan()%> đ</h3>
                                            <div class="btn btn-default add-to-cart"><i class="glyphicon glyphicon-hand-up"></i>Chi tiết</div>
                                        </div>
                                    </div>
                                </a>

                            </div>
                        </div>
                    </div>  
                    <%}%>
                </div>
            </div>

            <a class="left control-carousel" href="#new-book-carousel" data-slide="prev">
                <i class="fa fa-angle-left"></i>
            </a>
            <a class="right control-carousel" href="#new-book-carousel" data-slide="next">
                <i class="fa fa-angle-right"></i>
            </a>			
        </div>
    </div><!--/recommended_items-->
    <!--/product-details-->
    <script>
        $(document).ready(function () {
            $(".xemChiTiet").click(function () {
                var url, data;
                url = "product_details.jsp";
                data = {"id": $(this).attr("name")};
                $("#main_bar").html('<center><img style="width: 4%; margin-top: 30px; margin-bottom:600px" class="img-responsive" src="images/home/load.gif"/></center>');
                $("#main_bar").load(url, data);
            });
        });
    </script>  
</div>

<script>
    $(document).ready(function () {
        
        $(".img1, .img2").hide();
        $('.thong_bao').hide();
        $("#themVaoGioHang").click(function () {
            var t = <%=s.getMaSach()%>;
            var sll = $(".sl").val();
            var ob = {n: "themVaoGioHang", ma: t, sl: sll};
            $.ajax({
                type: "POST",
                url: "servlet_Giohang",
                data: ob,
                success: function (data) {
                    var j = data;
                    if (j > 0)
                    {
                        $(".c1").html(j).show();
                    } else
                    {
                        $(".c1").hide();
                    }
                }
            });
        });

        $("#themVaoYeuThich").click(function () {
            var t = <%=s.getMaSach()%>;
            var kh = $(".ten_nx").attr("name");
            if (kh == "1")
            {
                $(".c2").hide();
                window.location = '/content.jsp?id=2';
                return;
            }
            var ob = {n: "themVaoYeuThich", maSach: t, maKh: kh};
            $.ajax({
                type: "POST",
                url: "servlet_khachHang",
                data: ob,
                success: function (data) {
                    var j = data;
                    if (j > 0)
                    {
                        $(".c2").html(j).show();
                    } else
                    {
                        $(".c2").hide();
                    }
                }
            });
        });

        $("#nx").click(function () {
            var kh_a = $(".ten_nx").attr("name");
            var ten_a = $(".ten_nx").val();
            var email_a = $(".email_nx").val();
            var nd_a = $(".nd_nx").val();
            var diem_a = $("input[name='optionsRadiosInline']:checked").val();
            var sach_a = $("#themVaoGioHang").attr("name");

            if (ten_a == "" || email_a == "" || nd_a == "")
            {
                $('.thong_bao').html("Nhập đầy đủ thông tin!").css("color", "#FE980F").show();
                return;
            } else
            {
                var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                if (!filter.test(email_a))
                {
                    $(".thong_bao").html("Email không hợp lệ !").css("color", "#FE980F").show();
                    $(".email_nx").val("");
                    return;
                }

                var ob = {n: "themNhanXet", email: email_a, ten: ten_a, nd: nd_a, diem: diem_a, idkh: kh_a, idSach: sach_a};
                $.ajax({
                    type: "POST",
                    url: "servlet_NhanXet",
                    data: ob,
                    success: function (data) {
                        var html = '<div class="nxet"><div><span><img width="4%" src="images/home/us3.png" style="margin-right: 10px; border-radius: 50px;"/><p style="display: inline; color:#3b5998;font-size: 14px;">' + ten_a + '</p><i class="glyphicon glyphicon-map-marker" style="padding-left: 25px;padding-right: 15px; color:#9197a3;"></i><p style="display: inline; color:#9197a3">' + email_a + '</p></span></div><p style="margin-left: 50px">' + nd_a + '</p></div>';
                        $(".DS_nhanXet").append(html);
                        $(".nd_nx").val("");
                        $('.thong_bao').hide();
                    }
                });
            }
        });
    });

</script>
<script>
    $(document).ready(function () {
        $("tr:odd").css("background-color", "#F0F0E9");
        $(".Nhaxuatban").css("padding-bottom", "207px");
    });
</script>