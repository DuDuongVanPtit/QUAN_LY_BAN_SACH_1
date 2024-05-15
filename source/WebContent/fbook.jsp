<%@page import="model.c_NXB"%>
<%@page import="java.util.Collections.*"%>
<%@page import="java.util.List"%>
<%@page import="model.c_SACH"%>
<%@page import="model.c_TACGIA"%>
<%@page import="model.m_SACH"%>
<%@page import="model.c_THELOAI"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
  <meta charset="UTF-8">
  <div>
        <%
            String a = request.getParameter("a");
            String id = request.getParameter("id");
            String pagee = request.getParameter("page");
            int idd = Integer.parseInt(id);
            int pageee = Integer.parseInt(pagee) - 1;
            List<m_SACH> list = new ArrayList<m_SACH>();
            if (a.equals("TheLoai")) {
                list = c_SACH.getlistbyTheLoai(pageee, idd);
            } else if (a.equals("TacGia")) {
                list = c_SACH.getlistbyTacGia(pageee, idd);
            } else {
                list = c_SACH.getlistbyNXB(pageee, idd);
            }
        %>
        <%
            for (m_SACH s : list) {
                int i = s.getMaSach();
        %>
        <div class="sm">
            <div class="col-xs-6 col-sm-4">
                <div class="product-image-wrapper">
                    <div class="single-products">
                        <a class="xemChiTiet" name="<%=i%>" href="#">
                            <div class="productinfo text-center">

                                <center><img src="<%= s.getLinkAnh()%>" class="avtBook"/></center>
                                <span class="savings-tab s3"> - <%= s.getKhuyenMai()%> %</span> 

                                <h4><%= s.getTenSach()%></h4>
                                    <p class="author"><% String tenTacGia;
                                tenTacGia = c_TACGIA.getTenTacGia(s.getMaTacGia());%> <%= tenTacGia%></p>

                            </div>
                            <div class="product-overlay">
                                <div class="overlay-content">
                                    <p class="m"><%= s.getTenSach()%></p>
                                        <p class="author"><% String tenTacGia1;
                                    tenTacGia1 = c_TACGIA.getTenTacGia(s.getMaTacGia());%> <%= tenTacGia1%></p>
                                    <h3><%= s.getGiaBan()%> đ</h3>
                                    <div class="btn btn-default add-to-cart"><i class="glyphicon glyphicon-hand-up"></i>Chi tiết</div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>              
        <%}%>
    </div>
    
    
     <script>
        $(document).ready(function () {
             $(".img1, .img2").hide();
            $(".xemChiTiet").click(function () {
                var url, data;
                url = "product_details.jsp";
                data = {"id": $(this).attr("name")};
                $("#main_bar").html('<center><img style="width: 4%; margin-top: 30px; margin-bottom:600px" class="img-responsive" src="images/home/load.gif"/></center>');
                $("#main_bar").load(url, data);
            });
        });
    </script>  
    