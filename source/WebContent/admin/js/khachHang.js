$(document).ready(function () {
    var pageg = 1;

    $('.rf').click(function () {
        $('#page-wrapper').load('khachHang.jsp');
    });

    $('.xem_them').click(function () {
        var ob = {
            page: pageg,
            n: "xemThemKhachHang"
        };
        $.ajax({
            type: "GET",
            url: "http://localhost:8080/servlet_XemThem",
            data: ob,
            dataType: "json",
            success: function (data) {
                $.each(data, function (i, data) {

                    var html = '<tr><td><center><input type="checkbox" name="' + data["MaKH"] + '"></center></td>';
                    html += "<td>" + data["MaKH"] + "</td>";
                    html += "<td>" + data["TenKH"] + "</td>";
                    html += "<td>" + data["DiaChi"] + "</td>";
                    html += "<td>" + data["SDT"] + "</td>";
                    html += "<td>" + data["Email"] + "</td>";
                    html += "<td>" + data["MatKhau"] + "</td></tr>";
                    $('.xem').append(html);
                });
            }
        });
        pageg++;
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
                    id: i,
                    n: "xoaKhachHang"
                };
                $.ajax({
                    type: "GET",
                    url: "http://localhost:8080/servlet_khachHang",
                    data: ob,
                    success: function (data) {
                        if (data == 1)
                        {
                            $('.rf').click();
                        } else
                        {
                            alert("Không được phép xóa !");
                        }
                    }
                });
            } else
            {
                $(this).attr('checked', false);
            }
        }
    });
});