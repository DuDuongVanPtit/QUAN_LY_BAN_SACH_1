$(document).ready(function () {

    jQuery(window).load(function () {
        $("#main_bar").load("main_bar.jsp");
        var h = $('.c2').html();
        if (h == "")
        {
            $('.c2').hide();
        }
    });
    $(".ten_sach").click(function () {
        $(".timkiem").attr("placeholder", "Tên sách ...");
    });

    $(".nha_xuat_ban").click(function () {
        $(".timkiem").attr("placeholder", "Nhà xuất bản ...");
    });

    $(".tac_gia").click(function () {
        $(".timkiem").attr("placeholder", "Tác giả ...");
    });

    $('.gio_hang,.thanh_toan').click(function () {
        // $("#content").html('<center><img style="width: 3%; margin-top: 30px;margin-bottom: 600px" class="img-responsive" src="images/home/load.gif"/></center>');
        $('#content').load('check_out_cart.jsp');
    });

    $('.lien_he').click(function () {
        // $("#content").html('<center><img style="width: 3%; margin-top: 30px;margin-bottom: 600px" class="img-responsive" src="images/home/load.gif"/></center>');
        $('#content').load('contact_us.jsp');
    });

    $(".email_dn").keyup(function () {
        if ($(".email_dn").val() != "")
        {
            var ob = {n: "kiemTra", email_dn: $(".email_dn").val()};
            $.ajax({
                type: "POST",
                url: "servlet_DangNhap",
                data: ob,
                success: function (data) {
                    if (data != 1) {
                        $("#msg").html("Email chưa đăng ký").css("color", "#FE980F").css("margin-left", "5px");
                    } else
                    {
                        $("#msg").html("");
                    }
                }
            });
        } else
        {
            $("#msg").html("");
        }
    });

    $("#dangNhap").click(function () {
        var temp = $("#dangNhap").html();
        if (temp == "Đăng nhập")
        {
            var t = $.trim($(".email_dn").val());
            var m = $.trim($(".matKhau_dn").val());

            if (t == "" || m == "")
            {
                alert("Nhập đầy đủ thông tin");
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

                            location.reload(true);
                        } else
                        {
                            $(".matKhau_dn").val("");
                            alert("Nhập lại mật khẩu");
                            return;
                        }
                    }
                });
            }
        } else
        {
            var ob = {n: "DangXuat"};
            $.ajax({
                type: "POST",
                url: "servlet_DangNhap",
                data: ob,
                success: function (data) {
                    if (data == 1) {
                        $(".lg").html('<i class="fa fa-lock"></i> Đăng nhập');
                        $('.ml').show();
                        $("#dangNhap").html("Đăng nhập");
                         location.reload(true);
                    }
                }
            });
        }
    });

    $(".email_dk").keyup(function () {
        if ($(".email_dk").val() != "")
        {
            var ob = {n: "kiemTra", email_dn: $(".email_dk").val()};
            $.ajax({
                type: "POST",
                url: "servlet_DangNhap",
                data: ob,
                success: function (data) {
                    if (data == 1) {
                        $(".msg").html("Email đã đăng ký").css("color", "#FE980F").css("margin-left", "5px");
                        $('.dangKy').attr('disabled', true);
                    } else
                    {
                        $(".msg").html("");
                        $('.dangKy').attr('disabled', false);
                    }
                }
            });
        } else
        {
            $(".msg").html("");
            $('.dangKy').attr('disabled', false);
        }
    });

    $(".sdt_dk").keydown(function (event) {

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

    $('.dangKy').click(function () {
        var ten_dk = $.trim($(".ten_dk").val());
        var dc_dk = $.trim($(".dc_dk").val());
        var sdt_dk = $.trim($(".sdt_dk").val());
        var email_dk = $.trim($(".email_dk").val());
        var mk_dk = $.trim($(".mk_dk").val());
        if (ten_dk == "" || dc_dk == "" || sdt_dk == "" || email_dk == "" || mk_dk == "")
        {
            $(".tb").html("Nhập đầy đủ thông tin !").css("color", "#FE980F");
            return;
        } else
        {
            var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            if (!filter.test(email_dk))
            {
                $(".tb").html("Email không hợp lệ !").css("color", "#FE980F");
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
                                    $(".msg").html("");
                                    $("#dangNhap").html("Đăng xuất");
                                    $('.ml').hide();
                                    $('#myModal').modal('hide');
                                    alert("Đăng ký thành công");
                                    $(".ten_dk").val("");
                                    $(".dc_dk").val("");
                                    $(".sdt_dk").val("");
                                    $(".email_dk").val("");
                                    $(".mk_dk").val("");
                                    location.reload(true);
                                }
                            }
                        });
                    } else
                    {
                        alert("Đăng ký thất bại");
                        return;
                    }
                }
            });
        }
    });
});


