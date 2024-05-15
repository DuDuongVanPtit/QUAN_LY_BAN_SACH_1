
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
                            TÁC GIẢ
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a>Bảng</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-edit"></i> Tác giả
                            </li>
                            <a href="#" class="rf pull-right"></a>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row tgg" style=" border-bottom: 1px dotted #D0CCCC;margin-bottom: 40px">
                    <div class="col-lg-6" style=" border-right: 1px dotted #D0CCCC;">

                        <b><div class="tenbang">TÁC GIẢ</div></b>
                        <p class="tg_tb pull-right"></p>
                        <div class="table-responsive">
                            <table class="table table-hover" style="margin-top: 10px;">
                                <thead>
                                    <tr>
                                        <th><center>Xóa</center></th>
                                        <th>Mã tác giả</th>
                                        <th>Tên tác giả</th>                                       

                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        List<m_TACGIA> list = c_TACGIA.getlist();
                                        for (m_TACGIA n : list) {
                                    %>
                                    <tr>
                                        <td><center><input type="checkbox" class="x_tg" name="<%=n.getMaTacGia()%>"></center></td>
                                <td><%=n.getMaTacGia()%></td>
                                <td><%=n.getTenTacGia()%></td>
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
                                    <p>Tên tác giả : </p>
                                </div>
                                <div class="col-lg-7">
                                    <input class="form-control ten_them_tg pull-right"><span class="mes_them_tg"></span>
                                </div>
                                <div class="col-lg-2">
                                    <button type="submit" class="btn btn-default pull-right" id ="them_tg">thêm</button>
                                </div>                               
                            </div>                       

                        </div>
                        <div role="form">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-3">
                                        <p>Mã tác giả : </p>
                                    </div>
                                    <div class="col-lg-7">
                                        <input class="form-control ma_sua_tg">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3">
                                        <p>Tên tác giả : </p>
                                    </div>
                                    <div class="col-lg-7">
                                        <input class="form-control ten_truoc_tg ">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3">
                                        <p>Tên mới: </p>
                                    </div>
                                    <div class="col-lg-7">
                                        <input class="form-control ten_sau_tg ">
                                    </div>
                                    <div class="col-lg-2">
                                        <button type="submit" class="btn btn-default pull-right" id ="sua_tg">sửa</button>
                                    </div>
                                </div>
                            </div>                       

                        </div>
                    </div>
                </div>
                <!-- /.row -->


            </div>
            <!-- /#wrapper -->
        </div>
        <script>
            $('.rf').click(function () {
                $('#page-wrapper').load('tacGia.jsp');
            });
        </script>
    </body>
</html>
