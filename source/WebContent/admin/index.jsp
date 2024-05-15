<%@page import="model.m_KHACHHANG"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="../images/home/iconlogo.png">
        <title>Read & Relax | Admin</title>
        <link href="/css/bootstrap.min.css" rel="stylesheet">
        <link href="/css/sb-admin.css" rel="stylesheet">
        <script src="/js/jquery.js"></script>
        <script src="js/main.js"></script>
        <script src="/js/bootstrap.min_1.js"></script>
        <meta charset="UTF-8">
    </head>
    <body>
        <%
            m_KHACHHANG km = (m_KHACHHANG) session.getAttribute("khachHang");
            if (km != null) {
                if (km.getEmail().equals("admin")) {
        %>
        <div id="wrapper">

            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <div class="navbar-header">
                    <CENTER><a class= "navbar-brand a" href="http://localhost:8080/index.jsp" style="padding-left: 20px; color: white"><b>Read & Relax</b></a></center>
                </div>

                <div class="collapse navbar-collapse navbar-ex1-collapse" >
                    <ul class="nav navbar-nav side-nav" style="padding-left: 15px">
                        <li>
                            <a href="#" class="b2" >Sách</a>
                        </li>
                        <li>
                            <a href="#" class="b1" >Khách hàng</a>
                        </li>
                        <li>
                            <a href="#" class="b3" >Tác giả</a>
                        </li>
                        <li>
                            <a href="#" class="b4" >Nhà xuất bản</a>
                        </li>
                        <li>
                            <a href="#" class="b5" >Thể loại</a>
                        </li>
                        <li>
                            <a href="#" class="b6" >Thanh toán</a>
                        </li>
                        
                        <li>
                            <a href="#" class="b7">Nhận xét</a>
                        </li>
                        <li>
                            <a href="#" class="b8">Đơn hàng</a>
                        </li>               
                    </ul>
                </div>
            </nav>

            <div id="page-wrapper">
                <jsp:include page="sach.jsp"></jsp:include>
                </div>

            </div>
        <% } else { %>
        <a class= "navbar-brand a" href="http://localhost:8080/index.jsp" style="padding-left: 20px; color: black; font-size: 24px">Trang chủ</a>
        <%} %>

        <%} else {%>

        <a class= "navbar-brand a" href="http://localhost:8080/index.jsp" style="padding-left: 20px;color: black; font-size: 24px">Trang chủ</a>

        <% }%>
    </body>
</html>
