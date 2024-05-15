
<%@page import="model.c_THANHTOAN"%>
<%@page import="model.m_THANHTOAN"%>
<%@page import="model.m_THELOAI"%>
<%@page import="model.c_THELOAI"%>
<%@page import="model.c_NXB"%>
<%@page import="model.m_NXB"%>
<%@page import="model.c_TACGIA"%>
<%@page import="java.util.List"%>
<%@page import="model.m_TACGIA"%>
<%@page import="model.c_SACH"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/jquery.js"></script>
        <script src="js/bangchung.js"></script>
         <meta charset="UTF-8">
    </head>
    <body>
        <div>
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            NHÀ XUẤT BẢN
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a>Bảng</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-edit"></i> Nhà xuất bản
                            </li>
                            <a href="#" class="rf pull-right"></a>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row nxbb" style="border-bottom: 1px dotted #D0CCCC;margin-bottom: 40px">
                    <div class="col-lg-6" style=" border-right: 1px dotted #D0CCCC;">

                        <b><div class="tenbang">NHÀ XUẤT BẢN</div></b>
                        <p class="tg_nxb pull-right"></p>
                        <div class="table-responsive">
                            <table class="table table-hover" style="margin-top: 10px;">
                                <thead>
                                    <tr>
                                        <th>Xóa</th>
                                        <th>Mã nhà xuất bản</th>
                                        <th>Tên nhà xuất bản</th>                                       
                                    </tr>
                                </thead>
                                <tbody>   
                                    <%
                                        List<m_NXB> listt = c_NXB.getlist();
                                        for (m_NXB n : listt) {
                                    %>
                                    <tr>
                                        <td><center><input type="checkbox" class="x_nxb" name="<%=n.getMaNXB()%>"></center></td>
                                <td><%=n.getMaNXB()%></td>
                                <td><%=n.getTenNXB()%></td>

                                </tr>     
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-lg-6" >

                        <div role="form">
                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <p>Tên NXB : </p>
                                </div>
                                <div class="col-lg-7">
                                    <input class="form-control ten_them_nxb"><span class="mes_them_nxb"></span>
                                </div>
                                <div class="col-lg-2">
                                    <button type="submit" class="btn btn-default pull-right" id="them_nxb">Thêm</button>
                                </div>
                            </div>                       
                        </div>

                        <div role="form">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-3">
                                        <p>Mã NXB : </p>
                                    </div>
                                    <div class="col-lg-7">
                                        <input class="form-control ma_sua_nxb">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3">
                                        <p>Tên NXB : </p>
                                    </div>
                                    <div class="col-lg-7">
                                        <input class="form-control ten_truoc_nxb">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3">
                                        <p>Tên mới : </p>
                                    </div>
                                    <div class="col-lg-7">
                                        <input class="form-control ten_sau_nxb">
                                    </div>
                                    <div class="col-lg-2">
                                        <button type="submit" class="btn btn-default pull-right" id="sua_nxb">Sửa</button>
                                    </div>
                                </div>
                            </div>                       

                        </div>
                    </div>
                </div>

                <!-- /.row-->


            </div>
            <!-- /#wrapper -->
        </div>
        <script>
            $('.rf').click(function () {
                $('#page-wrapper').load('nhaXuatBan.jsp');
            });
        </script>
    </body>
</html>
