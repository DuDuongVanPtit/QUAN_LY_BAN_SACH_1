
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
                            THANH TOÁN
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a>Bảng</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-edit"></i> Thanh toán
                            </li>
                            <a href="#" class="rf pull-right"></a>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row tt"  style=" border-bottom: 1px dotted #D0CCCC;margin-bottom: 40px">
                    <div class="col-lg-6" >

                        <b><div class="tenbang">THANH TOÁN</div></b>
                         <p class="tt_tb pull-right"></p>
                        <div class="table-responsive">
                            <table class="table table-hover" style="margin-top: 10px">
                                <thead>
                                    <tr>
                                        <th>Xóa</th>
                                        <th>Mã thanh toán</th>
                                        <th>Kiểu thanh toán</th>                                                                            
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        List<m_THANHTOAN> lists = c_THANHTOAN.getlist();
                                        for (m_THANHTOAN n : lists) {
                                    %>
                                    <tr>
                                        <td><center><input type="checkbox" class="x_tt" name="<%=n.getMaTT()%>"></center></td>
                                <td><%=n.getMaTT()%></td>
                                <td><%=n.getKieuTT()%></td>                                       
                                </tr>   
                                <% }%>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="col-lg-6" style=" border-left: 1px dotted #D0CCCC;">          
                        <div role="form">
                            <div class="form-group row">
                                <div class="col-lg-3">
                                    <p>Kiểu thanh toán : </p>
                                </div>
                                <div class="col-lg-7">
                                    <input class="form-control ten_them_tt"><span class="mes_them_tt"></span>
                                </div>
                                <div class="col-lg-2">
                                    <button type="submit" class="btn btn-default pull-right" id ="them_tt">thêm</button>
                                </div>
                            </div>                       
                        </div>

                        <div role="form">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-3">
                                        <p>Mã thanh toán : </p>
                                    </div>
                                    <div class="col-lg-7">
                                        <input class="form-control ma_sua_tt">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3">
                                        <p>Kiểu thanh toán : </p>
                                    </div>
                                    <div class="col-lg-7">
                                        <input class="form-control ten_truoc_tt">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3">
                                        <p>Tên mới : </p>
                                    </div>
                                    <div class="col-lg-7">
                                        <input class="form-control ten_sau_tt">
                                    </div>
                                    <div class="col-lg-2">
                                        <button type="submit" class="btn btn-default pull-right" id="sua_tt">sửa</button>
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
</html>
