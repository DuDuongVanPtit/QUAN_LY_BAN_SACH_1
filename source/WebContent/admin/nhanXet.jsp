
<%@page import="model.c_NHANXET"%>
<%@page import="model.m_NHANXET"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta charset="UTF-8">
        <title>nhanXet</title>
    </head>
    <body>
        <div id="nhanXet">
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            NHẬN XÉT
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="#">Bảng</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-edit"></i> Danh sách
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-12">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover xem">
                                <thead>
                                    <tr>
                                        <th>Xóa</th>
                                        <th>Mã</th>
                                        <th>Mã kh</th> 
                                        <th>Mã sách</th> 
                                        <th>Tên kh</th>
                                        <th>Email</th>
                                        <th>Điểm</th>
                                        <th>Nội dung nhận xét</th>                                                                             
                                    </tr>
                                </thead>

                                <tbody>
                                    <% List<m_NHANXET> list1 = new ArrayList<m_NHANXET>();
                                        list1 = c_NHANXET.getlistmoinhat(0);
                                        for (m_NHANXET s : list1) {
                                            int id = s.getMaNS();
                                    %>
                                    <tr>                                      
                                        <td><center><input type="checkbox" name="<%= id%>" class="xoa"></center></td>
                                <td><%= s.getMaNS()%></td>
                                <td><%= s.getMaKH()%></td>
                                <td><%= s.getMaSach()%></td>
                                <td><%= s.getTen()%></td>
                                <td><%= s.getEmail()%></td>
                                <td><%= s.getDiem()%></td>
                                <td><%= s.getNoiDung()%></td>

                                </tr>       
                                <% }%>
                                </tbody>
                            </table>
                        </div>
                        <button type="button" class="btn btn-default pull-right xem_them">Xem thêm</button>
                    </div>
                </div>
                <!-- /.row --> 

               
            </div>
        </div>
        <!-- /#wrapper -->
        <a class="rf"></a>
    </body>
</html>

<script>
    $(document).ready(function () {

        $('.rf').click(function () {
            $('#page-wrapper').load('nhanXet.jsp');
        });

        $('.xoa').click(function () {
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
                        url: "http://localhost:8080/servlet_NhanXet",
                        data: ob,
                        success: function (data) {
                            if (data == 1)
                            {
                                $('.rf').click();
                            } else
                            {
                                $(this).attr("checked", false);
                                alert("Không được phép xóa !");
                            }
                        }
                    });
                } else
                {
                    $(this).attr("checked", false);
                }
            }
        });

        var pageg = 1;

        $('.xem_them').click(function () {
            var ob = {
                page: pageg,
                n: "xemThemNhanXet"
            };
            $.ajax({
                type: "GET",
                url: "http://localhost:8080/servlet_XemThem",
                data: ob,
                dataType: "json",
                success: function (data) {
                    $.each(data, function (i, data) {

                        var html = '<tr><td><center><input type="checkbox" name="' + data["MaNS"] + '" class="xoa"></center></td>"';
                        html += "<td>" + data["MaNS"] + "</td>";
                        html += "<td>" + data["MaKH"] + "</td>";
                        html += "<td>" + data["MaSach"] + "</td>";
                        html += "<td>" + data["Ten"] + "</td>";
                        html += "<td>" + data["Email"] + "</td>";
                        html += "<td>" + data["Diem"] + "</td>";
                        html += "<td>" + data["NoiDung"] + "</td></tr>";

                        $('.xem').append(html);
                    });
                }
            });
            pageg++;
        });
    });
</script>
