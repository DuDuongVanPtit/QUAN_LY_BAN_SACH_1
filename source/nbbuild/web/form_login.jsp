<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
  <meta charset="UTF-8">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>form_login</title>
        <script src="js/jquery.min.js"></script>
    </head>
    
    <body>
        <script>
            $(document).ready(function () {
                $(".c2").hide();
                $(".email_dnn").keyup(function ()
                {
                    var t = $(".email_dnn").val();
                    if (t != "")
                    {
                        var ob = {n: "kiemTra", email_dn: t};
                        $.ajax({
                            type: "POST",
                            url: "servlet_DangNhap",
                            data: ob,
                            success: function (data) {
                                if (data != 1) {
                                    $("#m").html("Email chưa đăng ký!").css("color", "#FE980F").css("margin-left", "5px");
                                } else
                                {
                                    $("#m").html("");
                                }
                            }
                        });
                    } else
                    {
                        $("#m").html("");
                    }

                });

                $(".dnn").click(function () {
                    var t = $.trim($(".email_dnn").val());
                    var m = $.trim($(".matKhau_dnn").val());
                    if (t == "" || m == "")
                    {
                        $(".thong_bao1").html("Nhập đầy đủ thông tin!").css("color", "#00923f");
                        return;
                    } else
                    {
                        var ob = {n: "DangNhap", email_dn: t, matKhau_dn: m};
                        $.ajax({
                            type: "POST",
                            url: "servlet_DangNhap",
                            data: ob,
                            success: function (data) {
                                if (data == 1) {
                                    $(".lg").html(t);
                                    $("#dangNhap").html("Đăng xuất");
                                    $("#content").html('<center><img style="width: 3%; margin-top: 30px;margin-bottom: 600px" class="img-responsive" src="images/home/load.gif"/></center>');
                                    $('#content').load("acc.jsp");
                                } else
                                {
                                    $(".matKhau").val("");
                                    $(".thong_bao1").html("Đăng nhập lại!").css("color", "#00923f");
                                    return;
                                }
                            }
                        });
                    }
                });

                $(".sdt_dkk").keydown(function (event) {

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

                $(".email_dkk").keyup(function () {
                    var t = $(".email_dkk").val();
                    if (t != "")
                    {
                        var ob = {n: "kiemTra", email_dn: t};
                        $.ajax({
                            type: "POST",
                            url: "servlet_DangNhap",
                            data: ob,
                            success: function (data) {
                                if (data == 1) {
                                    $("#mi").html("Email đã đăng ký!").css("color", "#FE980F").css("margin-left", "5px");
                                    $('.dkk').attr('disabled', true);
                                } else
                                {
                                    $("#mi").html("");
                                    $('.dkk').attr('disabled', false);
                                }
                            }
                        });
                    } else
                    {
                        $('.dkk').attr('disabled', false);
                        $(".mi").html("");
                    }
                });

                $('.dkk').click(function () {
                    var ten_dk = $.trim($(".ten_dkk").val());
                    var dc_dk = $.trim($(".dc_dkk").val());
                    var sdt_dk = $.trim($(".sdt_dkk").val());
                    var email_dk = $.trim($(".email_dkk").val());
                    var mk_dk = $.trim($(".mk_dkk").val());

                    if (ten_dk == "" || dc_dk == "" || sdt_dk == "" || email_dk == "" || mk_dk == "")
                    {
                        $(".thong_bao2").html("Nhập đầy đủ thông tin !").css("color", "#00923f");
                        return;
                    } else
                    {
                        var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                        if (!filter.test(email_dk))
                        {
                            $(".thong_bao2").html("Email không hợp lệ !").css("color", "#00923f");
                            $(".email_dkk").val("");
                            return;
                        }
                        var ob = {n: "DangKy", email: email_dk, matKhau: mk_dk, ten: ten_dk, dc: dc_dk, sdt: sdt_dk};
                        $.ajax({
                            type: "POST",
                            url: "servlet_DangNhap",
                            data: ob,
                            success: function (data) {
                                if (data == 1) {
                                    var o = {n: "DangNhap", email_dn: email_dk, matKhau_dn: mk_dk};
                                    $.ajax({
                                        type: "POST",
                                        url: "servlet_DangNhap",
                                        data: o,
                                        success: function (data) {
                                            if (data == 1) {
                                                $(".lg").html(email_dk);
                                                $(".email_dn").val(email_dk);
                                                $(".matKhau_dn").val(mk_dk);
                                                $("#dangNhap").html("Đăng xuất");
                                                $("#content").html('<center><img style="width: 3%; margin-top: 30px;margin-bottom: 600px" class="img-responsive" src="images/home/load.gif"/></center>');
                                                $('#content').load("acc.jsp");
                                            }
                                        }
                                    });
                                } else
                                {
                                    $(".thong_bao1").html("Thất bại !").css("color", "#00923f");
                                    return;
                                }
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
        
        <div id="contact-page">
    <div class="bg container col-sm-12" >
    <section id="form" autocomplete="off"><!--form-->       
            <h1 class="title-pages">Tài khoản</h1>
            <div class="register-req">
                <p>Vui lòng nhập đăng nhập trước</p>
            </div><!--/register-req-->
            <div class="row">
                <div class="col-sm-3">
                    <div class="login-form"><!--login form-->
                        <p style="font-size: 16px;">Đăng nhập</p>
                        <form>
                            <input type="email" placeholder="Email"  class="email_dnn"/><div><span id="m"></span></div>
                            <input type="password" placeholder="Mật khẩu" class="matKhau_dnn"/>
                            <p class="thong_bao1 pull-left" style="margin-left: 5px;font-size: 12px;"></p>
                            <button type="button" class="btn btn-default pull-right dnn">Đăng nhập</button>
                        </form>
                    </div><!--/login form-->
                </div>
                <div class="col-sm-1">
                    <center><h2 class="orr">|</h2></center>
                </div>
                <div class="col-sm-4">
                    <div class="signup-form">
                        <p style="font-size: 16px;">Đăng kí tài khoản mới</p>
                        <form>
                            <input type="text" placeholder="Tên người sử dụng" class="ten_dkk"/>
                            <input type="text" placeholder="Địa chỉ" class="dc_dkk"/>
                            <input type="text" placeholder="Số điện thoại" class="sdt_dkk"/>
                        </form>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="signup-form">
                        <form style="margin-top: 38px;">
                            <input type="email" placeholder="Email" class="email_dkk"/><div><span id="mi"></span></div>
                            <input type="password" placeholder="Mật khẩu" class="mk_dkk"/>
                            <p class="thong_bao2 pull-left" style="margin-left: 5px;font-size: 12px;"></p>
                            <button type="button" class="btn btn-default pull-right dkk" >Đăng kí</button>
                        </form>
                    </div>
                </div>
            </div>
     
    </section><!--/form-->
    </div>
        </div>
</body>
</html>