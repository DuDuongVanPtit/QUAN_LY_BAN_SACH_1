$(document).ready(function () {

    $('.x_tg').click(function () {
        var j = $(this).prop('checked');
        if (j == true)
        {
            var k = confirm("Bạn có chắc chắn muốn xóa không?");
            if (k == true)
            {
                var ob = {
                    ma: $(this).attr('name'),
                    n: "xoa"
                };
                $.ajax({
                    type: "GET",
                    url: "../servlet_tacGia",
                    data: ob,
                    success: function (data) {
                        if (data == 1)
                        {
                            $(this).parent().remove();
                            $(".tg_tb").html("");
                            $('.rf').click();
                        } else
                        {
                            $(this).attr("checked", false);
                            $(".tg_tb").html("Không được phép xóa !").css("color", "#FE980F");
                        }
                    }
                });
            } else
            {
                $(this).attr("checked", false);
            }
        }
    });

    $('.x_nxb').click(function (event)
    {
        var j = $(this).prop('checked');
        if (j == true)
        {
            var k = confirm("Bạn có chắc chắn muốn xóa không?");
            if (k == true)
            {
                var ob = {
                    ma: $(this).attr('name'),
                    n: "xoa"
                };
                $.ajax({
                    type: "POST", // phương thức gởi đi
                    url: "../servlet_nhaXuatBan", // nơi mà dữ liệu sẽ chuyển đến khi submit
                    data: ob,
                    success: function (data) { // if everything goes well
                        if (data == 1)
                        {
                            $(this).parent().remove();
                            $('.rf').click();
                            $(".tg_nxb").html("");
                        } else
                        {
                            $(this).attr("checked", false);
                            $(".tg_nxb").html("Không được phép xóa !").css("color", "#FE980F");
                        }
                    }
                });
            } else
            {
                $(this).attr("checked", false);
            }
        }
    });

    $('#them_nxb').click(function (event)
    {
        var v = $.trim($(".ten_them_nxb").val());
        if (v == "")
        {
            alert("Nhập tên nhà xuất bản");
            return;
        } else
        {
            var ob = {
                name: v,
                n: "them"
            };
            $.ajax({
                type: "POST", // phương thức gởi đi
                url: "../servlet_nhaXuatBan", // nơi mà dữ liệu sẽ chuyển đến khi submit
                data: ob,
                success: function (data) { // if everything goes well
                    if (data == 1)
                    {
                        $('.rf').click();
                        $(".ten_them_nxb").val("");
                    } else
                    {
                        alert("Thất bại");
                    }
                }
            });
        }
    });
    $('#them_tg').click(function (event)
    {
        var v = $.trim($(".ten_them_tg").val());
        if (v == "")
        {
            alert("Nhập tên tác giả");
            return;
        } else
        {
            var ob = {
                name: v,
                n: "them"
            };
            $.ajax({
                type: "POST", // phương thức gởi đi
                url: "../servlet_tacGia", // nơi mà dữ liệu sẽ chuyển đến khi submit
                data: ob,
                success: function (data) { // if everything goes well
                    if (data == 1)
                    {
                        $('.rf').click();
                        $(".ten_them_tg").val("");
                    } else
                    {
                        alert("Thất bại");
                    }
                }
            });
        }
    });

    $('#sua_tg').click(function (event)
    {
        var v1 = $(".ma_sua_tg").val();
        var v2 = $(".ten_truoc_tg").val();
        var v3 = $(".ten_sau_tg").val();
        if (v1 == "" || v2 == "" || v3 == "")
        {
            alert("Nhập đầy đủ thông tin");
            return;
        } else
        {
            var ob = {
                ma: v1,
                name: v3,
                n: "sua"
            };
            $.ajax({
                type: "POST", // phương thức gởi đi
                url: "../servlet_tacGia", // nơi mà dữ liệu sẽ chuyển đến khi submit
                data: ob,
                success: function (data) { // if everything goes well
                    if (data == 1)
                    {
                        $('.rf').click();
                    } else
                    {
                        alert("Không được phép");
                    }
                }
            });
        }
    });

    $('.ma_sua_tg,.ma_sua_nxb,.ma_sua_tl,.ma_sua_tt').keydown(function (event) {

        if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9
                || event.keyCode == 27 || event.keyCode == 13
                || (event.keyCode == 65 && event.ctrlKey === true)
                || (event.keyCode >= 35 && event.keyCode <= 39)) {
            return;
        } else {
            // If it's not a number stop the keypress
            if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105)) {
                event.preventDefault();
            }
        }
    });

    $('.ten_them_tg').keyup(function (event) {
        var v = $(this).val();
        if (v != "")
        {
            var ob = {
                ten: v,
                n: "timMa"
            };
            $.ajax({
                type: "POST", // phương thức gởi đi
                url: "../servlet_tacGia", // nơi mà dữ liệu sẽ chuyển đến khi submit
                data: ob,
                success: function (data) { // if everything goes well
                    if (data != -1)
                    {
                        $(".mes_them_tg").html("Đã tồn tại").css("color", "red").css("margin", "3px");
                        $("#them_tg").attr('disabled', true);
                    } else
                    {
                        $(".mes_them_tg").html("");
                        $("#them_tg").attr('disabled', false);
                    }
                }
            });
        } else {
            $(".mes_them_tg").html("");
        }
    });

    $('.ma_sua_tg').keyup(function (event) {
        var v = $(this).val();
        if (v != "")
        {
            var ob = {
                ma: v,
                n: "timTen"
            };
            $.ajax({
                type: "POST", // phương thức gởi đi
                url: "../servlet_tacGia", // nơi mà dữ liệu sẽ chuyển đến khi submit
                data: ob,
                success: function (data) { // if everything goes well
                    $(".ten_truoc_tg").val(data);
                }
            });
        } else {
            $(".ten_truoc_tg").val("");
        }
    });

    $('.ten_truoc_tg').keyup(function (event) {
        var v = $(this).val();
        if (v != "")
        {
            var ob = {
                ten: v,
                n: "timMa"
            };
            $.ajax({
                type: "POST", // phương thức gởi đi
                url: "../servlet_tacGia", // nơi mà dữ liệu sẽ chuyển đến khi submit
                data: ob,
                success: function (data) { // if everything goes well
                    if (data != -1)
                    {
                        $(".ma_sua_tg").val(data);
                    } else
                    {
                        $(".ma_sua_tg").val("");
                    }
                }
            });
        } else {
            $(".ma_sua_tg").val("");
        }
    });

    $('.ten_them_nxb').keyup(function (event) {
        var v = $(this).val();
        if (v != "")
        {
            var ob = {
                ten: v,
                n: "timMa"
            };
            $.ajax({
                type: "POST", // phương thức gởi đi
                url: "../servlet_nhaXuatBan", // nơi mà dữ liệu sẽ chuyển đến khi submit
                data: ob,
                success: function (data) { // if everything goes well
                    if (data != -1)
                    {
                        $(".mes_them_nxb").html("Đã tồn tại").css("color", "red").css("margin-top", "7px");
                        $("#them_nxb").attr('disabled', true);
                    } else
                    {
                        $(".mes_them_nxb").html("");
                        $("#them_nxb").attr('disabled', false);
                    }
                }
            });
        } else {
            $(".mes_them_nxb").html("");
            $("#them_nxb").attr('disabled', false);
        }
    });

    $('.ten_truoc_nxb').keyup(function (event) {
        var v = $(this).val();
        if (v != "")
        {
            var ob = {
                ten: v,
                n: "timMa"
            };
            $.ajax({
                type: "POST", // phương thức gởi đi
                url: "../servlet_nhaXuatBan", // nơi mà dữ liệu sẽ chuyển đến khi submit
                data: ob,
                success: function (data) { // if everything goes well
                    if (data != -1)
                    {
                        $(".ma_sua_nxb").val(data);
                    } else
                    {
                        $(".ma_sua_nxb").val("");
                    }
                }
            });
        } else {
            $(".ma_sua_nxb").val("");
        }
    });

    $('.ma_sua_nxb').keyup(function (event) {
        var v = $(this).val();
        if (v != "")
        {
            var ob = {
                ma: v,
                n: "timTen"
            };
            $.ajax({
                type: "POST", // phương thức gởi đi
                url: "../servlet_nhaXuatBan", // nơi mà dữ liệu sẽ chuyển đến khi submit
                data: ob,
                success: function (data) { // if everything goes well
                    $(".ten_truoc_nxb").val(data);
                }
            });
        } else {
            $(".ten_truoc_nxb").val("");
        }
    });

    $('#sua_nxb').click(function (event)
    {
        var v1 = $(".ma_sua_nxb").val();
        var v2 = $(".ten_truoc_nxb").val();
        var v3 = $(".ten_sau_nxb").val();
        if (v1 == "" || v2 == "" || v3 == "")
        {
            alert("Nhập đầy đủ thông tin");
            return;
        } else
        {
            var ob = {
                ma: v1,
                name: v3,
                n: "sua"
            };
            $.ajax({
                type: "POST", // phương thức gởi đi
                url: "../servlet_nhaXuatBan", // nơi mà dữ liệu sẽ chuyển đến khi submit
                data: ob,
                success: function (data) { // if everything goes well
                    if (data == 1)
                    {
                        $('.rf').click();
                    } else
                    {
                        alert("Không được phép");
                    }
                }
            });
        }
    });

    $('#them_tl').click(function (event)
    {
        var v = $.trim($(".ten_them_tl").val());
        if (v == "")
        {
            alert("Nhập tên thể loại");
            return;
        } else
        {
            var ob = {
                name: v,
                n: "them"
            };
            $.ajax({
                type: "POST", // phương thức gởi đi
                url: "../servlet_theLoai", // nơi mà dữ liệu sẽ chuyển đến khi submit
                data: ob,
                success: function (data) { // if everything goes well
                    if (data == 1)
                    {
                        $('.rf').click();
                    } else
                    {
                        alert("Thất bại");
                    }
                }
            });
        }
    });

    $('#sua_tl').click(function (event)
    {
        var v1 = $(".ma_sua_tl").val();
        var v2 = $(".ten_truoc_tl").val();
        var v3 = $(".ten_sau_tl").val();
        if (v1 == "" || v2 == "" || v3 == "")
        {
            alert("Nhập đầy đủ thông tin");
            return;
        } else
        {
            var ob = {
                ma: v1,
                name: v3,
                n: "sua"
            };
            $.ajax({
                type: "POST", // phương thức gởi đi
                url: "../servlet_theLoai", // nơi mà dữ liệu sẽ chuyển đến khi submit
                data: ob,
                success: function (data) { // if everything goes well
                    if (data == 1)
                    {
                        $('.rf').click();
                    } else
                    {
                        alert("Không được phép");
                    }
                }
            });
        }
    });


    $('.ten_them_tl').keyup(function (event) {
        var v = $(this).val();
        if (v != "")
        {
            var ob = {
                ten: v,
                n: "timMa"
            };
            $.ajax({
                type: "POST", // phương thức gởi đi
                url: "../servlet_theLoai", // nơi mà dữ liệu sẽ chuyển đến khi submit
                data: ob,
                success: function (data) { // if everything goes well
                    if (data != -1)
                    {
                        $(".mes_them_tl").html("Đã tồn tại").css("color", "red");
                        $("#them_tl").attr('disabled', true);
                    } else
                    {
                        $(".mes_them_tl").html("");
                        $("#them_tl").attr('disabled', false);
                    }
                }
            });
        } else {
            $("#them_tl").attr('disabled', false);
            $(".mes_them_tl").html("");
        }
    });

    $('.ma_sua_tl').keyup(function (event) {
        var v = $(this).val();
        if (v != "")
        {
            var ob = {
                ma: v,
                n: "timTen"
            };
            $.ajax({
                type: "POST", // phương thức gởi đi
                url: "../servlet_theLoai", // nơi mà dữ liệu sẽ chuyển đến khi submit
                data: ob,
                success: function (data) { // if everything goes well
                    $(".ten_truoc_tl").val(data);
                }
            });
        } else {
            $(".ten_truoc_tl").val("");
        }
    });
    $('.ten_truoc_tl').keyup(function (event) {
        var v = $(this).val();
        if (v != "")
        {
            var ob = {
                ten: v,
                n: "timMa"
            };
            $.ajax({
                type: "POST", // phương thức gởi đi
                url: "../servlet_theLoai", // nơi mà dữ liệu sẽ chuyển đến khi submit
                data: ob,
                success: function (data) { // if everything goes well
                    if (data != -1)
                    {
                        $(".ma_sua_tl").val(data);
                    } else
                    {
                        $(".ma_sua_tl").val("");
                    }
                }
            });
        } else {
            $(".ma_sua_tl").val("");
        }
    });


    $('#them_tt').click(function (event)
    {
        var v = $.trim($(".ten_them_tt").val());
        if (v == "")
        {
            alert("Nhập kiểu thanh toán");
            return;
        } else
        {
            var ob = {
                name: v,
                n: "them"
            };
            $.ajax({
                type: "POST", // phương thức gởi đi
                url: "../servlet_thanhToan", // nơi mà dữ liệu sẽ chuyển đến khi submit
                data: ob,
                success: function (data) { // if everything goes well
                    if (data == 1)
                    {
                        $('.rf').click();
                    } else
                    {
                        alert("Thất bại");
                    }
                }
            });
        }
    });


    $('#sua_tt').click(function (event)
    {
        var v1 = $(".ma_sua_tt").val();
        var v2 = $(".ten_truoc_tt").val();
        var v3 = $(".ten_sau_tt").val();
        if (v1 == "" || v2 == "" || v3 == "")
        {
            alert("Nhập đầy đủ thông tin");
            return;
        } else
        {
            var ob = {
                ma: v1,
                name: v3,
                n: "sua"
            };
            $.ajax({
                type: "POST", // phương thức gởi đi
                url: "../servlet_thanhToan", // nơi mà dữ liệu sẽ chuyển đến khi submit
                data: ob,
                success: function (data) { // if everything goes well
                    if (data == 1)
                    {
                        $('.rf').click();
                    } else
                    {
                        alert("Không được phép");
                    }
                }
            });
        }
    });


    $('.ten_them_tt').keyup(function (event) {
        var v = $(this).val();
        if (v != "")
        {
            var ob = {
                ten: v,
                n: "timMa"
            };
            $.ajax({
                type: "POST", // phương thức gởi đi
                url: "../servlet_thanhToan", // nơi mà dữ liệu sẽ chuyển đến khi submit
                data: ob,
                success: function (data) { // if everything goes well
                    if (data != -1)
                    {
                        $(".mes_them_tt").html("Đã tồn tại").css("color", "red");
                        $("#them_tt").attr('disabled', true);
                    } else
                    {
                        $(".mes_them_tt").html("");
                        $("#them_tt").attr('disabled', false);
                    }
                }
            });
        } else {
            $("#them_tt").attr('disabled', false);
            $(".mes_them_tt").html("");
        }
    });

    $('.ma_sua_tt').keyup(function (event) {
        var v = $(this).val();
        if (v != "")
        {
            var ob = {
                ma: v,
                n: "timTen"
            };
            $.ajax({
                type: "POST", // phương thức gởi đi
                url: "../servlet_thanhToan", // nơi mà dữ liệu sẽ chuyển đến khi submit
                data: ob,
                success: function (data) { // if everything goes well
                    $(".ten_truoc_tt").val(data);
                }
            });
        } else {
            $(".ten_truoc_tt").val("");
        }
    });

    $('.ten_truoc_tt').keyup(function (event) {
        var v = $(this).val();
        if (v != "")
        {
            var ob = {
                ten: v,
                n: "timMa"
            };
            $.ajax({
                type: "POST", // phương thức gởi đi
                url: "../servlet_thanhToan", // nơi mà dữ liệu sẽ chuyển đến khi submit
                data: ob,
                success: function (data) { // if everything goes well
                    if (data != -1)
                    {
                        $(".ma_sua_tt").val(data);
                    } else
                    {
                        $(".ma_sua_tt").val("");
                    }
                }
            });
        } else {
            $(".ma_sua_tt").val("");
        }
    });


    $('.x_tt').click(function (event)
    {
        var j = $(this).prop('checked');
        if (j == true)
        {
            var k = confirm("Bạn có chắc chắn muốn xóa không?");
            if (k == true)
            {
                var ob = {
                    ma: $(this).attr('name'),
                    n: "xoa"
                };
                $.ajax({
                    type: "POST", // phương thức gởi đi
                    url: "../servlet_thanhToan", // nơi mà dữ liệu sẽ chuyển đến khi submit
                    data: ob,
                    success: function (data) { // if everything goes well
                        if (data == 1)
                        {
                            $('.rf').click();
                        } else
                        {
                            $(this).attr("checked", false);
                            $(".tt_tb").html("Không được phép xóa !").css("color", "rgb(123, 27, 10)");
                        }
                    }
                });
            } else
            {
                $(this).attr("checked", false);
            }
        }
    });

    $('.x_tl').click(function (event)
    {
        var j = $(this).prop('checked');
        if (j == true)
        {
            var k = confirm("Bạn có chắc chắn muốn xóa không?");
            if (k == true)
            {
                var ob = {
                    ma: $(this).attr('name'),
                    n: "xoa"
                };
                $.ajax({
                    type: "POST", // phương thức gởi đi
                    url: "../servlet_theLoai", // nơi mà dữ liệu sẽ chuyển đến khi submit
                    data: ob,
                    success: function (data) { // if everything goes well
                        if (data == 1)
                        {
                            $('.rf').click();
                        } else
                        {
                            $(this).attr("checked", false);
                            $(".tl_tb").html("Không được phép xóa !").css("color", "#FE980F");
                        }
                    }
                });
            }
            else
            {
                $(this).attr("checked", false);
            }
        }

    });

});