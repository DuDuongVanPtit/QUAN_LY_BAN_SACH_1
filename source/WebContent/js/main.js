/* global email_regex */

$(document).ready(function () {

    jQuery(window).load(function () {
        $("#main_bar").load("main_bar.jsp");
        var h = $('.c2').html();
        if (h == "")
        {
            $('.c2').hide();
        }
    });

    var sach = [{value: '', data: ''}];

    $.ajax({
        url: "servlet_timSach",
        dataType: "json",
        success: function (dataa) {
            $.each(dataa, function (i, dataa)
            {
                sach.push({value: dataa["TenSach"], data: dataa["MaSach"]});
            });
        }
    });

    $(".ten_sach").click(function () {
        $(".timkiem").attr("placeholder", "Tên sách ...");
        $(".timkiem").val('');
        sach.splice(0, sach.length);
        $.ajax({
            url: "servlet_timSach",
            dataType: "json",
            success: function (dataa) {
                $.each(dataa, function (i, dataa)
                {
                    sach.push({value: dataa["TenSach"], data: dataa["MaSach"]});
                });
            }
        });
    });


    $(".nha_xuat_ban").click(function () {
        $(".timkiem").attr("placeholder", "Nhà xuất bản ...");
        $(".timkiem").val('');
        sach.splice(0, sach.length);
        $.ajax({
            url: "servlet_timNXB",
            dataType: "json",
            success: function (dataa) {
                $.each(dataa, function (i, dataa)
                {
                    sach.push({value: dataa["TenNXB"], data: dataa["MaNXB"]});
                });

            }
        });
    });
    $(".tac_gia").click(function () {
        $(".timkiem").attr("placeholder", "Tác giả ...");
        $(".timkiem").val('');
        sach.splice(0, sach.length);
        $.ajax({
            url: "servlet_timTacGia",
            dataType: "json",
            success: function (dataa) {
                $.each(dataa, function (i, dataa)
                {
                    sach.push({value: dataa["TenTacGia"], data: dataa["MaTacGia"]});
                });
            }
        });
    });

    $('#autocomplete').autocomplete({
        lookup: sach,
        onSelect: function (suggestion) {

            var ten = suggestion["value"];
            var ma = suggestion["data"];

            var k = $(".timkiem").attr("placeholder");
            if (k == "Tên sách ...")
            {
                var url, data;
                url = "product_details.jsp";
                data = {"id": ma};
                $("#main_bar").html('<center><img style="width: 5%; margin-top: 30px" class="img-responsive" src="images/home/load.gif"/></center>');
                $("#main_bar").load(url, data);
                $(".img").show();
                $("#slider").hide();
            } else
            if (k == "Tác giả ...")
            {
                var url, data;
                url = "viewBook.jsp";
                data = {"id": ma, "a": "TacGia", "page": "1"};
                $("#main_bar").html('<center><img style="width: 5%; margin-top: 30px" class="img-responsive" src="images/home/load.gif"/></center>');
                $("#main_bar").load(url, data);
                $(".img").show();
                $("#slider").hide();
            } else if (k == "Nhà xuất bản ...")
            {
                var url, data;
                url = "viewBook.jsp";
                data = {"id": ma, "a": "nxb", "page": "1"};
                $("#main_bar").html('<center><img style="width: 5%; margin-top: 30px" class="img-responsive" src="images/home/load.gif"/></center>');
                $("#main_bar").load(url, data);
                $(".img").show();
                $("#slider").hide();
            }
        }
    });


    $(".logoo").click(function () {
        $("#main_bar").html('<center><img style="width: 5%; margin-top: 30px" class="img-responsive" src="images/home/load.gif"/></center>');
        $("#main_bar").load("main_bar.jsp");
        $(".img").hide();
        $("#slider").show();
    });

    $("#img-switcher img:not(:first)").hide();
    $("#img-switcher img:first").addClass("current");
    var t = setInterval(switcher, 1000);
    function switcher() {
        var $cur = $('img.current');
        var $next = $cur.next('img');
        if ($next.length == 0)
        {
            $next = $('#img-switcher img:first');
        }
        $cur.removeClass('current').fadeOut(500);
        $next.addClass('current').fadeIn(500);
    }

    $('#img-switcher').hover(function () {
        clearInterval(t);
    }, function () {
        t = setInterval(switcher, 1000);
    });

    $(".email_dn").blur(function () {
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
                            $('.ml').hide();
                            location.reload(true);
                        } else
                        {
                            $(".matKhau_dn").val("");
                            alert("Thất bại");
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
                        $(".lg").html('<i class="fa fa-lock"></i> đăng nhập');
                        $('.ml').show();
                        $("#dangNhap").html("Đăng nhập");
                        location.reload(true);
                    }
                }
            });
        }
    });

    $(".TheLoai").click(function () {
        var url, data;
        url = "viewBook.jsp";
        data = {"id": $(this).attr("name"), "a": "TheLoai", "page": "1"};
        $("#main_bar").html('<center><img style="width: 5%; margin-top: 30px" class="img-responsive" src="images/home/load.gif"/></center>');
        $("#main_bar").load(url, data);
        $(".img").show();
        $("#slider").hide();
    });

    $(".TacGia").click(function () {
        var url, data;
        url = "viewBook.jsp";
        data = {"id": $(this).attr("name"), "a": "TacGia", "page": "1"};
        $("#main_bar").html('<center><img style="width: 5%; margin-top: 30px" class="img-responsive" src="images/home/load.gif"/></center>');
        $("#main_bar").load(url, data);
        $(".img").show();
        $("#slider").hide();
    });

    $(".nxb").click(function () {
        var url, data;
        url = "viewBook.jsp";
        data = {"id": $(this).attr("name"), "a": "nxb", "page": "1"};
        $("#main_bar").html('<center><img style="width: 5%; margin-top: 30px" class="img-responsive" src="images/home/load.gif"/></center>');
        $("#main_bar").load(url, data);
        $(".img").show();
        $("#slider").hide();
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

            $(".tb").html('<center><img style="width: 3%" class="img-responsive" src="images/home/load.gif"/></center>');
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
                                    $('#myModal').modal('hide');
                                    alert("Đăng ký thành công");
                                    $(".ten_dk").val("");
                                    $(".dc_dk").val("");
                                    $(".sdt_dk").val("");
                                    $(".email_dk").val("");
                                    $('.ml').hide();
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


