
$(document).ready(function () {
    var pageg = 1;
    $('.huy_dh').hide();
    $('.xem_them').click(function () {
        var ob = {
            page: pageg,
            n: "xemThemHoaDon"
        };
        $.ajax({
            type: "GET",
            url: "http://localhost:8080/servlet_XemThem",
            data: ob,
            dataType: "json",
            success: function (data) {
                $.each(data, function (i, data) {
                    var html = "<tr><td>" + data["SoDH"] + "</td>";
                    html += "<td>" + data["NgHD"] + "</td>";
                    html += "<td>" + data["SDTNN"] + "</td>";
                    html += "<td>" + data["DiaChiNN"] + "</td>";
                    html += "<td>" + data["GhiChu"] + "</td>";
                    html += "<td>" + data["TongTien"] + "</td>";
                    html += "<td>" + data["MaTT"] + "</td>";
                    var k = data["TrangThaiTT"];
                    if (k == "1") {
                        html += '<td><center><input type="checkbox" class="thanhToan" checked disabled></center></td>';
                    } else
                    {
                        html += '<td><center><input type="checkbox" class="thanhToan" disabled></center></td>';
                    }
                    var l = data["TrangThaiGiaoHang"];
                    if (l == "1") {
                        html += '<td><center><input type="checkbox" class="giaoHang" checked disabled ></center></td>';
                    } else {
                        html += '<td><center><input type="checkbox" class="giaoHang" disabled ></center></td>';
                    }
                    html += '<td ><a href="#" class="ct" name="' + data["SoDH"] + '" style="color: #3b5998;" data-toggle="modal" data-target="#chitiethoadon">chi tiết</a></td></tr>';
                    $('.xem').append(html);
                });
            }
        });
        pageg++;
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
            var i9 = $("#9>input").prop('cprohecked');
            if (i9 == false) {
                i9 = '0'
            } else
                i9 = '1';
            var i10 = $("#10>input").prop('checked');
            if (i10 == false) {
                i10 = '0'
            } else
                i10 = '1';
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

    $('.xoa').click(function () {
        var i10 = $(this).prop('checked');
        if (i10 == false) {
            return;
        } else
        {
            var k = confirm("Bạn có chắc chắn muốn xóa không?");
            if (k == true)
            {
                var i = $(this).attr("name");
                var ob = {
                    i1: i,
                    n: "xoaHoaDon"
                };
                $.ajax({
                    type: "GET",
                    url: "http://localhost:8080/servlet_DatHang",
                    data: ob,
                    success: function (data) {
                        $('.rf').click();
                    }
                });
            } else
            {
                $(this).attr('checked', false);
            }
        }
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
    $('.rf').click(function () {
        $('#page-wrapper').load('donHang.jsp');
    });
    $('.ct').click(function () {
        var idd = $(this).attr('name');
        var ob = {
            id: idd,
            n: "chiTietHoaDon"
        };
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
                    $("#9").html('<input disabled type="checkbox" class="thanhToan" checked>');
                } else
                {
                    $("#9").html('<input disabled type="checkbox" class="thanhToan">');
                }
                var lm = data["TrangThaiGiaoHang"];
                if (lm == "1") {
                    $("#10").html('<input disabled type="checkbox" class="thanhToan" checked>');
                } else {
                    $("#10").html('<input disabled type="checkbox" class="thanhToan">');
                }
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
                    html += "<td>" + data["SoLuong"] + "</td>";
                    html += "<td>" + data["DonGiaBan"] + "</td>";
                    html += "<td>" + data["ThanhTien"] + "</td>";
                    html += '<td><center><input type="checkbox" class="xoa_ct"></center></td> </tr>';
                    $('.xem_ct').append(html);
                });
            }
        });
    });
});
