<%@page import="model.m_THELOAI"%>
<%@page import="model.c_THELOAI"%>
<%@page import="model.c_NXB"%>
<%@page import="model.m_NXB"%>
<%@page import="java.util.List"%>
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
                            THỂ LOẠI
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a>Bảng</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-edit"></i> Thể loại
                            </li>
                            <a href="#" class="rf pull-right"></a>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row tgg" style=" border-bottom: 1px dotted #D0CCCC;margin-bottom: 40px">
                    <div class="col-lg-6" style=" border-right: 1px dotted #D0CCCC;">

                        <b><div class="tenbang">THỂ LOẠI</div></b>
                        <p class="tg_tb pull-right"></p>
                        <div class="table-responsive">
                            <table class="table table-hover" style="margin-top: 10px;">
                                <thead>
                                    <tr>
                                        <th>Xóa</th>
                                        <th>Mã thể loại</th>
                                        <th>Tên thể loại</th>                                       

                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        List<m_THELOAI> list = c_THELOAI.getlist();
                                        for (m_THELOAI n : list) {
                                    %>
                                    <tr>
                                        <td><center><input type="checkbox" class="x_tl" name="<%=n.getMaTheLoai()%>"></center></td>
                                <td><%=n.getMaTheLoai()%></td>
                                <td><%=n.getTenTheLoai()%></td>
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
                                    <p>Tên thể loại : </p>
                                </div>
                                <div class="col-lg-7">
                                    <input class="form-control ten_them_tl pull-right"><span class="mes_them_tl"></span>
                                </div>
                                <div class="col-lg-2">
                                    <button type="submit" class="btn btn-default pull-right" id ="them_tl">thêm</button>
                                </div>                               
                            </div>                       

                        </div>
                        <div role="form">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-3">
                                        <p>Mã thể loại : </p>
                                    </div>
                                    <div class="col-lg-7">
                                        <input class="form-control ma_sua_tl">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3">
                                        <p>Tên thể loại : </p>
                                    </div>
                                    <div class="col-lg-7">
                                        <input class="form-control ten_truoc_tl ">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3">
                                        <p>Tên mới: </p>
                                    </div>
                                    <div class="col-lg-7">
                                        <input class="form-control ten_sau_tl ">
                                    </div>
                                    <div class="col-lg-2">
                                        <button type="submit" class="btn btn-default pull-right" id ="sua_tl">sửa</button>
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
    </body>
    <script>
        $('.rf').click(function () {
            $('#page-wrapper').load('theLoai.jsp');
        });
    </script>
</html>
