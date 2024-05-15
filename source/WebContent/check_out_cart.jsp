<%@page import="model.c_SACHYEUTHICH"%>
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
                        $('.datHang1,.datHang2').attr('disabled', true);
                    });
                </script>
                
<div id="contact-page">
    <div class="bg container col-sm-12" >
        <section id="cart_items">
          
                <h1 class="title-pages">Giỏ hàng</h1>
                <%
                    int tt = 0;
                    ArrayList<m_GIOHANG> cart = (ArrayList<m_GIOHANG>) session.getAttribute("cart");
                    if (cart != null) {
                %>

                <div class="table-responsive cart_info">
                    <table class="table table-condensed ka">
                        <thead>
                            <tr class="cart_menu">
                                <td class="image" style="-webkit-border-radius: 8px 0px 0 0;">Thông tin sách</td>
                                <td class="description"></td>
                                <td class="price">Giá</td>
                                <td class="quantity">Số lượng</td>
                                <td class="total" >Thành tiền</td>
                                <td style="-webkit-border-radius: 0px 8px 0 0;"></td>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (m_GIOHANG c : cart) {
                            %>
                            <tr>
                                <td class="cart_product">
                                    <img src="<%= c.getm_SACH().getLinkAnh()%>">
                                </td>
                                <td class="cart_description" name="<%= c.getm_SACH().getMaSach()%>">
                                    <h4><%= c.getm_SACH().getTenSach()%></h4>
                                    <p><%= c_TACGIA.getTenTacGia(c.getm_SACH().getMaTacGia())%></p>
                                </td>
                                <td class="cart_price">
                                    <p class="gia"><%= c.getm_SACH().getGiaBan()%> đ</p>
                                </td>
                                <td class="cart_quantity">
                                    <input class="soluong" type="number" name="<%= c.getm_SACH().getMaSach()%>" value="<%= c.getsl()%>" min="1">
                                    <!--<p><%= c.getsl()%></p>-->
                                </td>
                                <td class="cart_total">
                                    <p class="cart_total_price tongtien"><% tt += c.getm_SACH().getGiaBan() * c.getsl();%><%= c.getm_SACH().getGiaBan() * c.getsl()%> đ</p>
                                </td>
                                <td class="cart_delete">
                                    <a class="cart_quantity_delete xoa" href="#" name="<%= c.getm_SACH().getMaSach()%>"><i class="fa fa-times"></i></a>
                                </td>
                            </tr>
                            <%}%>
                            <tr>
                                <td colspan="4">&nbsp;</td>
                                <td colspan="2">
                                    <table class="table table-condensed total-result">
                                        <tr>
                                            <td>TỔNG CỘNG:</td>
                                            <td style="color: #cf1524; font-weight: bold;font-size:18px"><%=tt%> đ</td>
                                        </tr>                               
                                        <tr class="shipping-cost">
                                            <td>Phí chuyển hàng:</td>
                                            <td>Miễn phí</td>										
                                        </tr>
                                    </table>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>

                <script>
                  
                        $('.datHang1,.datHang2').attr('disabled', false);
                </script>
                <%}%>

                <div class="register-req">
                    <p><strong>Vui lòng nhập đầy đủ thông tin!</strong></p>
                </div><!--/register-req-->

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
                    });
                </script>  
                <div class="shopper-informations">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="shopper-info">
                                <p>Địa chỉ giao hàng</p>
                                <form>
                                    <input type="text" placeholder="Tên" value="<%= kh.getTenKH()%>" class="ten_dh">
                                    <input type="text" placeholder="Số điện thoại" value="<%= kh.getSDT()%>" class="sdt_dh">
                                    <input type="email" name="<%= kh.getEmail()%>" placeholder="Email" value="<%= kh.getEmail()%>" class="email_dh">
                                    <input type="text" placeholder="Địa chỉ" value="<%= kh.getDiaChi()%>" class="dc_dh" >
                                </form>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="order-message">
                                <p>Ghi chú khi giao hàng</p>
                                <textarea name="message"  placeholder="Yêu cầu, lưu ý nếu có" rows="25" class="ghiChu_dh"></textarea>
                            </div>	
                        </div>		
                        <div class="col-sm-4">
                            <div class="shopper-info">
                                <p>Thanh toán</p>
                                <form>
                                    <select class="httt_dh">
                                        <% List<m_THANHTOAN> l = c_THANHTOAN.getlist();
                                            for (m_THANHTOAN n : l) {
                                        %>
                                        <option value="<%= n.getMaTT()%>"><%= n.getKieuTT()%></option>                            
                                        <%}%>
                                    </select>
                                    <input type="text" placeholder="TỔNG CỘNG: <%= tt%> đ" disabled="true" class="tt_dh" name="<%= tt%>">
                                    <div class="haha">
                                        <div>Chủ tài khoản: Nhà sách <strong>Read & Relax</strong></div>
                                        <div>Mã tài khoản: 6400 2053 63921</div>
                                        <div>Mọi thắc mắc vui lòng <b><a href="#" style="color: #00923f" class="lh">liên hệ</a></b> tới nhà sách hoặc gọi tới +84 326 765 923 để được nhân viên giải đáp.</div>
                                    </div>
                                    <p class="thong_bao pull-left" style="margin-left: 5px;font-size: 12px;"></p>
                                    <a href="#"><button type="button" class="btn btn-default pull-right datHang1">Đặt hàng</button></a>
                                </form>

                            </div>
                        </div>				
                    </div>
                </div>
                <%} else {%>
                <script>
                    $(document).ready(function () {
                        $(".c2").hide();
                    });
                </script>  
                <div class="shopper-informations">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="shopper-info">
                                <p>Địa chỉ giao hàng</p>
                                <form>
                                    <input type="text" placeholder="Tên" class="ten_dh">
                                    <input type="text" placeholder="Số điện thoại" class="sdt_dh">
                                    <input type="email" name="none" placeholder="Email" class="email_dh">
                                    <input type="text" placeholder="Địa chỉ" class="dc_dh">
                                </form>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="order-message">
                                <p>Ghi chú khi giao hàng</p>
                                <textarea name="message"  placeholder="Yêu cầu, lưu ý nếu có" rows="25" class="ghiChu_dh"></textarea>
                            </div>	
                        </div>		
                        <div class="col-sm-4">
                            <div class="shopper-info">
                                <p>Thanh toán</p>
                                <form>
                                    <select class="httt_dh">
                                        <option>-- Hình thức thanh toán --</option>
                                        <% List<m_THANHTOAN> l = c_THANHTOAN.getlist();
                                            for (m_THANHTOAN n : l) {
                                        %>
                                        <option value="<%= n.getMaTT()%>" ><%= n.getKieuTT()%></option>
                                        <%}%>
                                    </select>
                                    <input type="text" placeholder="TỔNG CỘNG: <%= tt%> đ" disabled="true" class="tt_dh" name="<%= tt%>">
                                    <div class="haha">
                                        <div>Chủ tài khoản: Read & Relax</div>
                                        <div>Mã tài khoản: 0326 765 923</div>
                                        <div>Mọi thắc mắc vui lòng <b><a href="#" style="color: #00923f" class="lh">liên hệ</a></b> tới nhà sách hoặc gọi tới +84 326 765 923 để được nhân viên giải đáp.</div>
                                    </div>
                                    <p class="thong_bao pull-left" style="margin-left: 5px;font-size: 12px;"></p>
                                    <a href="#"><button type="button" class="btn btn-default pull-right datHang2">Đặt hàng</button></a>
                                </form>
                            </div>
                        </div>				
                    </div>
                </div>
                <% }%>
        </section> <!--/#cart_items-->

        <section id="ok" style="margin-top: 70px">
            <div class="container">
                <center>
                    <img class="media-object" src="images/home/o.png" style="width: 10%">
                    <h3><label style="display: inline">Đặt hàng thành công. </label></h3>

                    <h5 style="display: inline">Cảm ơn bạn đã đặt hàng & sử dụng dịch vụ tại nhà sách <strong>Read & Relax!</strong></h5>
                    <div class="order-id-info">
                        Mã đơn hàng của bạn: 
                        <br/>
                        <span class="ma_DonHang">6340119</span>
                        <br/>
                    </div>
                    <div class="customer-care-info">
                        <p>Thông tin đặt hàng của bạn tại <strong>BookStore.com</strong> đã được ghi nhận. Nhân viên sẽ liên lạc với bạn trong thời gian sớm nhất.</p>
                        <p>Nếu có bất kì điều gì thắc mắc, xin hãy gọi cho chúng tôi:<span class="hotline">1900 6656</span> (8h-21h, T7-CN)</p>
                        <p>Hoặc gửi email tới: BookStore@gmail.com .</p>
                    </div>

                    <div class="has-action"  style=" margin-top: 20px;">
                        <a href="index.jsp" style="background-color: #59B516; color:  whitesmoke;padding-top: 8px;padding-bottom: 8px;padding-right: 14px;padding-left: 14px;">Tiếp tục mua sách tại nhà sách?</a>
                    </div>

                </center>
            </div>
        </section>

    </div>
</div>


<script>
    $(document).ready(function () {
        $("#ok").hide();
    });
</script>
<script>
    $(document).ready(function () {

        $(".soluong").change(function () {
            var sll = $(this).val();
            var t = $(this).attr('name');

            var ob = {n: "suaSoLuong", ma: t, sl: sll};
            $.ajax({
                type: "POST",
                url: "servlet_Giohang",
                data: ob,
                success: function (data) {
                    // $("#content").html('<center><img style="width: 3%; margin-top: 30px;margin-bottom: 600px" class="img-responsive" src="images/home/load.gif"/></center>');
                    $("#content").load("check_out_cart.jsp");
                }
            });
        });

        $(".lh").click(function () {
            $("#content").load("contact_us.jsp");
        });
        $(".xoa").click(function () {
            var n = $(this).attr('name');
            var ob = {n: "xoaSachTrongGioHang", ma: n};
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
                    //$("#content").html('<center><img style="width: 3%; margin-top: 30px;margin-bottom: 600px" class="img-responsive" src="images/home/load.gif"/></center>');
                    $("#content").load("check_out_cart.jsp");
                }
            });
        });
        $(".sdt_dh").keydown(function (event) {

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
        $(".datHang1, .datHang2").click(function () {
            var kh_dh = $(".email_dh").val();
            var ten_dh = $(".ten_dh").val();
            var sdt_dh = $(".sdt_dh").val();
            var dc_dh = $(".dc_dh").val();
            var gc_dh = $(".ghiChu_dh").val();
            var httt_dh = $(".httt_dh").val();
            console.log(kh_dh);
            var tt_dh = $(".tt_dh").attr('name');
            if (ten_dh == "" || sdt_dh == "" || dc_dh == "" || httt_dh == "-- Hình thức thanh toán --")
            {
                $(".thong_bao").html("Nhập đầy đủ thông tin!").css("color", "#FE980F");
                return;
            } else
            {
                $("#cart_items").html('<center><img style="width: 3%; margin-top: 30px ; margin-bottom: 600px" class="img-responsive" src="images/home/load.gif"/></center>');
                var ob = {n: "datHang", kh: kh_dh, ten: ten_dh, sdt: sdt_dh, dc: dc_dh, gc: gc_dh, httt: httt_dh, tt: tt_dh};
                $.ajax({
                    type: "POST",
                    url: "../servlet_DatHang",
                    data: ob,
                    success: function (data) {
                        if (data != -1) {
                            $("#ok").show();
                            $("#cart_items").hide();
                            $(".ma_DonHang").html(data);
                            $(".c1").hide();
                        } else
                        {
                            $(".thong_bao").html("Thất bại!").css("color", "#FE980F");
                            return;
                        }
                    }
                });
            }
        });
        
                    $("#40").removeClass("menu-act");
            $("#100").addClass("menu-act");
            $("#20").removeClass("menu-act");
            $("#30").removeClass("menu-act");
    });
</script>
