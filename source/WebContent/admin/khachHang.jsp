<%@page import="model.c_KHACHHANG"%>
<%@page import="model.m_KHACHHANG"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>khachHang</title>
        <script src="js/jquery.js"></script>
         <script src="js/khachHang.js"></script>
          <meta charset="UTF-8">
    </head>
    <body>
        <div id="khachhang">
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            KHÁCH HÀNG
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i><a href="index.html">Bảng</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-edit"></i> Khách hàng
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
                                        <th>Mã khách hàng</th>
                                        <th>Tên khách hàng</th> 
                                        <th>Địa chỉ khách hàng</th>
                                        <th>Số điện thoại</th>
                                        <th>Email</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% List<m_KHACHHANG> list1 = new ArrayList<m_KHACHHANG>();
                                        list1 = c_KHACHHANG.getlist(0);
                                        for (m_KHACHHANG s : list1) {
                                            int id = s.getMaKH();
                                    %>
                                    <tr>
                                        <td><center><input type="checkbox" name="<%= id%>" class="xoa"></center></td>
                                <td><%= id%></td>
                                <td><%= s.getTenKH()%></td>
                                <td><%= s.getDiaChi()%></td>
                                <td><%= s.getSDT()%></td>
                                <td><%= s.getEmail()%></td>
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
            <a class="rf"></a>
        </div>
        <!-- /#wrapper -->
    </body>
</html>
