
<%@page import="model.c_SACH"%>
<%@page import="model.m_SACHYEUTHICH"%>
<%@page import="model.c_SACHYEUTHICH"%>
<%@page import="model.m_SACH"%>
<%@page import="model.c_DONHANG"%>
<%@page import="model.m_DONHANG"%>
<%@page import="model.c_THANHTOAN"%>
<%@page import="model.m_THANHTOAN"%>
<%@page import="java.util.List"%>
<%@page import="model.m_KHACHHANG"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.c_TACGIA"%>
<%@page import="model.m_GIOHANG"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
  <meta charset="UTF-8">

<script>
    $(document).ready(function () {
        $('.chinh_sua').hide();
        $('.suakh').click(function () {
            $('.tkhoan').hide();
            $('.chinh_sua').show();
            $('.ql').css('padding-bottom', '0px');

        });
        $('.huy').click(function () {
            $('.tkhoan').show();
            $('.chinh_sua').hide();
            $('.ql').css('padding-bottom', '15px');
            $(".thong_bao").html("");
        });

        $('.sua_Kh').click(function () {
            var ten = $('.ten_sua').val();
            var dc = $('.dc_sua').val();
            var mk = $('.mk_sua').val();
            var sdt = $('.sdt_sua').val();
            var id = $('.ma').html();
            var email = $('.email').html();
            if (ten == "" || dc == "" || mk == "" || sdt == "")
            {
                $(".thong_bao").html("Nhập đầy đủ !").css("color", "#FE980F");
                return;
            } else
            {
                var ob = {n: "suaKhachHang", id: id, tenn: ten, dcc: dc, mkk: mk, sdtt: sdt, email: email};
                $.ajax({
                    type: "POST",
                    url: "servlet_khachHang",
                    data: ob,
                    success: function (data) {
                        if (data == 1) {
                            $('#content').load('contact_us.jsp');
                        } else
                        {
                            $(".thong_bao").html("Thất bại !").css("color", "#FE980F");
                        }
                    }
                });
            }
        });

        $(".sdt_sua").keydown(function (event) {

            if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9
                    || event.keyCode == 27 || event.keyCode == 13
                    || (event.keyCode == 65 && event.ctrlKey === true)
                    || (event.keyCode >= 35 && event.keyCode <= 39)) {
                return;
            } else {
                if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105)) {
                    event.preventDefault();
                }
            }
        });
    });

</script>

<div id="contact-page">
    <div class="bg container col-sm-12" >
        <section id="acc">
            <%
                m_KHACHHANG kh = (m_KHACHHANG) session.getAttribute("khachHang");
            %>
            <div>
                <h1 class="title-pages">Tài khoản</h1>

                <div class="col-sm-12 tk">
                    <p>Thông tin tài khoản</p>

                    <div class="tkhoan">
                         <table class="table">
                        <tr>
                            <td >Mã tài khoản :  </td>
                            <td  class="ma"><%= kh.getMaKH()%></td>
                            <td  >Tên tài khoản: </td>
                            <td ><%= kh.getTenKH()%></td>

                         </tr>
                        <tr>
                            <td  >Địa chỉ : </td>
                            <td ><%= kh.getDiaChi()%></td>
                            <td  >Email : </td>
                            <td  class="email"><%= kh.getEmail()%></td>
                        </tr>

                        <tr>
                            <td  >Số điện thoại : </td>
                            <td ><%= kh.getSDT()%></td>
                            <td  >Mật khẩu : </td>
                            <td >***********</td>
                        </tr>
                         </table>

                        <a href="#" class="suakh pull-right" style="color: #3b5998; margin-top: 30px">Chỉnh sửa</a>
                    </div>

                    <div class="chinh_sua">
                        <table class="table">
                            <tr>
                                <td >Email: </td>
                                <td  ><%= kh.getEmail()%></td>
                                <td >Tên: </td>
                                <td  ><input type="text" value="<%= kh.getTenKH()%>" class="ten_sua" style="border:none; border-bottom: 1px dotted #987D7D"></td>
                            </tr>

                            <tr>
                                <td >Địa chỉ: </td>
                                <td  ><input type="text" value="<%= kh.getDiaChi()%>" class="dc_sua" style="border:none; border-bottom: 1px dotted #987D7D"></td>
                                <td >Mật khẩu: </td>
                                <td ><input type="password" value="<%= kh.getMatKhau()%>" class="mk_sua"  style="border:none; border-bottom: 1px dotted #987D7D" ></td>
                            </tr>

                            <tr>
                                <td >Số điện thoại: </td>
                                <td  ><input type="text" value="<%= kh.getSDT()%>" class="sdt_sua" style="border:none; border-bottom: 1px dotted #987D7D"></td>
                            </tr>
                             <tr>
                                 <td></td>
                                 <td></td>
                                 <td></td>
                                <td><button type="button" class="btn btn-default pull-right sua_Kh">Lưu</button><button type="button" class="btn btn-default pull-right huy" style="margin-right: 5px">Hủy</button></td>
                            </tr>
                            <td><p class="thong_bao pull-left" style="margin-left: 5px;font-size: 12px;"></p></td>
                        </table>                 
                    </div>
                </div>


                <div class="col-sm-12 dsyt" style="margin-bottom: 30px;">
                    <div class="title">
                        <p>Danh sách yêu thích</p>
                    </div>
                    <div class="cte">
                        <%
                            List<m_SACHYEUTHICH> list = c_SACHYEUTHICH.getlistIDKH(kh.getMaKH());
                            for (m_SACHYEUTHICH ss : list) {
                                int i = ss.getMaSach();
                                m_SACH s = new m_SACH();
                                s = c_SACH.timSachTheoMa(i);
                        %>
                        <div class="col-xs-6 col-sm-3">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <center><img src="<%= s.getLinkAnh()%>" class="avtBook"/></center>
                                        <h4><%= s.getTenSach()%></h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>

                <div class="col-sm-12 dshd">
                    <div class="register-req" style=" margin-top: 20px;margin-bottom: 20px;">
                        <p style="display: inline">Danh sách đơn hàng</p>
                        <a href="#" class="rf pull-right" style="color:#3b5998;font-size: 14px;margin-right: 10px">Tải lại trang</a>
                    </div><!--/register-req-->
                    <table class="table table-hover xem">
                        <thead>                                  
                            <tr>
                                <th>Mã</th>
                                <th>Ngày</th>                                 
                                <th>Tổng tiền</th>
                                <th>Địa chỉ nhận</th>  
                                <th>Số điện thoại</th> 
                                <th><center>Thanh toán</center></th>                                      
                    <th><center>Giao hàng</center></th>  
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<m_DONHANG> list1 = c_DONHANG.dsDonHang_maKH(kh.getMaKH());
                                for (m_DONHANG s : list1) {
                                    int id = s.getSoDH();
                            %>
                            <tr>
                                <td><%= s.getSoDH()%></td>
                                <td><%= s.getNgHD()%></td>
                                <td><%= s.getTongTien()%></td>
                                <td><%= s.getDiaChiNN()%></td>
                                <td><%= s.getSDTNN()%></td>
                                <td><center><% if (s.getTrangThaiTT() == 1) {%><img class="media-object" src="images/home/o.png" style="width: 15%"><%} else {%><img class="media-object" src="images/home/w.png" style="width: 19%"><%}%></center></td>
                        <td><center><% if (s.getTrangThaiGiaoHang() == 1) {%><img class="media-object" src="images/home/o.png" style="width: 15%"><%} else {%><img style="width: 19%" class="media-object" src="images/home/w.png"><%}%></center></td>
                        <td ><a href="#" class="ct" name="<%= s.getSoDH()%>" style="color: #3b5998;" data-toggle="modal" data-target="#chitiethoadon">Xem chi tiết</a></td>          
                        </tr>
                        <%}%>
                        </tbody>
                    </table>
                </div>       

            </div>       
            <!-- Modal -->
            <div class="modal fade" id="chitiethoadon" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content" style="padding: 10px 20px;">
                        <div class="modal-header" style="padding-bottom: 25px;margin-bottom: 25px;border-bottom: 1px solid #00923f">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title" style="margin-bottom: 10px">HÓA ĐƠN</h4>
                            <table class="table table-hover t" style="background-color: rgba(228, 228, 228, 0.13);">
                                <tr>
                                    <td>Mã hóa đơn:</td>
                                    <td><p id="1"></p></td>
                                  
                                </tr>
                                 <tr>
                                  
                                    <td>Ngày hóa đơn: </td>
                                    <td><p id="2"></p></td>
                                    <td>Tổng tiền: </td>
                                    <td><p id="7" style="color: #cf1524; font-weight: bold;font-size:18px"></p></td>
                                </tr>
                                <tr>
                                    <td>Số điện thoại:</td>
                                    <td></p> <input disabled id="4"/></td>
                                    <td>Người nhận: </td>
                                    <td><input disabled id="3"/></td>
                                </tr>
                                <tr>
                                    <td>Mã thanh toán: </td>
                                    <td><input type="number" min=1 max="2" disabled  id="8" /></td>
                                    <td>Địa chỉ nhận:</td>
                                    <td><input disabled id="5"/></td>  
                                </tr>
                                <tr>
                                    <td>Ghi chú:</td>  
                                    <td colspan="3"> <textarea disabled id="6"></textarea></td>
                                </tr>
                                <tr>
                                    <td>Trạng thái thanh toán: </td>
                                    <td> <p id="9"></p></td>
                                    <td>Trạng thái giao hàng: </td>
                                    <td><p id="10"></p></td>
                                     </tr>
                                
                                 <tr>
                                     <td></td>
                                     <td></td>
                                     <td></td>
                                    <td><div class="mo pull-right"><a href=# style="margin-left: 15px;display: none;" class="huy_dh">hủy</a><a href=# style="display: inline; margin-right: 20px; margin-left: 15px" class="sua_dh">sửa</a><a href=# style="display: inline; margin-right: 12px;" class="xoa_dh">xóa</a></div></td>
                                </tr>
                            </table> 

                        </div>
                        <div class="modal-body" style="padding-left: 15px; padding-right: 15px;">
                            <table class="table table-hover xem_ct">
                                <thead>                                  
                                    <tr style="border-bottom: 1px dotted #f5f5f5;">
                                        <td>Mã sách</td> 
                                        <td>Tên sách</td>
                                        <td>Số lượng</td>
                                        <td>Đơn giá</td>
                                        <td>Thành tiền</td>  
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                        </div>
                    </div>
                </div>

            </div>
        </section> <!--/#cart_items-->
    </div>
</div>
<script>
    $(document).ready(function () {

        $('.ct').click(function () {

            var idd = $(this).attr('name');
            var ob = {
                id: idd,
                n: "chiTietHoaDon"
            };
            $("#i").html(idd);
            var obb = {
                id: idd,
                n: "timhoadon"
            };
            $.ajax({
                type: "GET",
                url: "http://localhost:8080/servlet_DatHang",
                data: obb,
                dataType: "json",
                success: function (data) {
                    $("#1").html(data["SoDH"]);
                    $("#2").html(data["NgHD"]);
                    $("#3").val(data["TenNN"]);
                    $("#4").val(data["SDTNN"]);
                    $("#5").val(data["DiaChiNN"]);
                    $("#6").val(data["GhiChu"]);
                    $("#7").html(data["TongTien"] + "đ");
                    $("#8").val(data["MaTT"]);
                    var ml = data["TrangThaiTT"];
                    if (ml == "1") {
                        $("#9").html('<img class="media-object" src="images/home/o.png" style="width: 14% ; display: inline;">');
                    } else
                    {
                        $("#9").html('<img style="width: 7% ; display: inline;" class="media-object" src="images/home/w.png">');
                    }
                    var lm = data["TrangThaiGiaoHang"];
                    if (lm == "1") {
                        $("#10").html('<img class="media-object" src="images/home/o.png" style="width: 14%; display: inline;">');
                    } else {
                        $("#10").html('<img style="width: 7% ; display: inline;" class="media-object" src="images/home/w.png">');
                    }

                    if (ml == "1" || lm == "1")
                    {
                        $('.huy_dh,.xoa_dh,.sua_dh').hide();
                    } else
                    {
                        $('.huy_dh,.xoa_dh,.sua_dh').show();
                    }
                    $('.huy_dh').hide();
                }
            });
            $(".xem_ct > tbody").empty();

            $.ajax({
                type: "GET",
                url: "http://localhost:8080/servlet_DatHang",
                data: ob,
                dataType: "json",
                success: function (data) {
                    $.each(data, function (i, data) {
                        var html = "<tr><td>" + data["MaSach"] + "</td>";
                         html += "<td>" + data["TenSach"] + "</td>";
                        html += "<td>" + data["SoLuong"] + "</td>";
                        html += "<td>" + data["DonGiaBan"] + "</td>";
                        html += "<td>" + data["ThanhTien"] + "</td></tr>";
                        $('.xem_ct').append(html);
                    });
                }
            });

        });

        $("#4").keydown(function (event) {

            if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9
                    || event.keyCode == 27 || event.keyCode == 13
                    || (event.keyCode == 65 && event.ctrlKey === true)
                    || (event.keyCode >= 35 && event.keyCode <= 39)) {
                return;
            } else {
                if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105)) {
                    event.preventDefault();
                }
            }
        });

        $('.huy_dh').click(function () {
            $('.sua_dh').html("sửa");
            $('.huy_dh').hide();
            $("#3").attr("disabled", true);
            $("#4").attr("disabled", true);
            $("#5").attr("disabled", true);
            $("#6").attr("disabled", true);
            $("#8").attr("disabled", true);
            $("#9>input").attr("disabled", true);
            $("#10>input").attr("disabled", true);
        });
        $('.sua_dh').click(function () {
            var a = $(this).html();
            if (a == "sửa")
            {
                var a = $(this).html("lưu");
                $('.huy_dh').show();
                $("#3").attr("disabled", false);
                $("#4").attr("disabled", false);
                $("#5").attr("disabled", false);
                $("#6").attr("disabled", false);
                $("#8").attr("disabled", false);
                $("#9>input").attr("disabled", false);
                $("#10>input").attr("disabled", false);
            } else if (a == "lưu")
            {
                var i1 = $("#1").html();
                var i3 = $("#3").val();
                var i4 = $("#4").val();
                var i5 = $("#5").val();
                var i6 = $("#6").val();
                var i8 = $("#8").val();
                var i9 = 0;
                var i10 = 0;
                var ob = {
                    i1: i1, i3: i3, i4: i4, i5: i5, i6: i6, i8: i8, i9: i9, i10: i10, n: "sua_hoadon"
                };
                $.ajax({
                    type: "GET",
                    url: "http://localhost:8080/servlet_DatHang",
                    data: ob,
                    success: function (data) {
                        if (data == "1")
                        {
                            $('.sua_dh').html("sửa");
                            $('.huy_dh').hide();
                            $("#3").attr("disabled", true);
                            $("#4").attr("disabled", true);
                            $("#5").attr("disabled", true);
                            $("#6").attr("disabled", true);
                            $("#8").attr("disabled", true);
                            $("#9>input").attr("disabled", true);
                            $("#10>input").attr("disabled", true);
                            $("#3").val(i3);
                            $("#4").val(i4);
                            $("#5").val(i5);
                            $("#6").val(i6);
                            $("#8").val(i8);
                            if (i9 == '0') {
                                $("#9>input").attr("checked", false);
                            } else {
                                $("#9>input").attr("checked", true);
                            }
                            if (i10 == '0') {
                                $("#10>input").attr("checked", false);
                            } else {
                                $("#10>input").attr("checked", true);
                            }
                        }
                    }
                });
            }
        });

        $('.rf').click(function () {
            $('#content').load('acc.jsp');
        });
        $('.xoa_dh').click(function () {
            var k = confirm("Bạn có chắc chắn muốn xóa không?");
            if (k == true)
            {
                var ob = {
                    i1: $("#1").html(),
                    n: "xoaHoaDon"
                };
                $.ajax({
                    type: "GET",
                    url: "http://localhost:8080/servlet_DatHang",
                    data: ob,
                    success: function (data) {
                        $('.close').click();
                        //$("#page-wrapper").html('<center><img style="width: 5%; margin-top: 30px" class="img-responsive" src="/images/home/load.gif"/></center>');

                    }
                });
            }
        });

        $("#40").removeClass("menu-act");
        $("#100").removeClass("menu-act");
        $("#20").addClass("menu-act");
        $("#30").removeClass("menu-act");
    });

</script>