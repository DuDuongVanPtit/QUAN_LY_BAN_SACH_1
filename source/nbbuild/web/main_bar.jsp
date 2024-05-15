<%@page import="java.util.ArrayList"%>
<%@page import="model.c_SACH"%>
<%@page import="model.c_TACGIA"%>
<%@page import="model.m_SACH"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
  <meta charset="UTF-8">

<div id="main_bar">
    <div class="recommended_items  "><!--recommended_items-->
       <h2 class="title text-center ma" style="margin-top: 0px;">Sách mới nhất</h2>
        <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel" data-interval="false">
            <div class="carousel-inner">
                <div class="item active  ">	
                    <%
                        List<m_SACH> list1 = c_SACH.getlistSachMoiNhat(0);
                        for (m_SACH s : list1) {
                    %>
                    <div class="col-xs-6 col-sm-4">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <a href="#" class="xemChiTiet" name="<%= s.getMaSach()%>">
                                    <div class="productinfo text-center">

                                        <center><img src="<%= s.getLinkAnh()%>" class="avtBook"/></center>
                                        <span class="savings-tab s3"> - <%= s.getKhuyenMai()%> %</span> 
                                        <h4><%= s.getTenSach()%></h4>
                                            <p class="author"><% String tenTacGia;
                                                tenTacGia = c_TACGIA.getTenTacGia(s.getMaTacGia());%> <%= tenTacGia%></p>
                                             <span class="price"><%= s.getGiaBan()%> đ</span> 
                                        <span class="regular-price"><%= s.getGiaBia()%>đ</span>
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
                    <%}%>
                </div>
                <div class="item">	
                    <%
                        List<m_SACH> list2 = c_SACH.getlistSachMoiNhat(1);
                        for (m_SACH s : list2) {
                    %>
                    <div class="col-xs-6 col-sm-4">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <a href="#" class="xemChiTiet" name="<%= s.getMaSach()%>">
                                    <div class="productinfo text-center">

                                        <center><img src="<%= s.getLinkAnh()%>" class="avtBook"/></center>
                                        <span class="savings-tab s3"> - <%= s.getKhuyenMai()%> %</span> 
                                        <h4><%= s.getTenSach()%></h4>
                                            <p class="author"><% String tenTacGia;
                                                tenTacGia = c_TACGIA.getTenTacGia(s.getMaTacGia());%> <%= tenTacGia%></p>
                                            <span class="price"><%= s.getGiaBan()%> đ</span> 
                                        <span class="regular-price"><%= s.getGiaBia()%>đ</span>
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
                    <%}%>
                </div>
            </div>

            <a class="left control-carousel" href="#recommended-item-carousel" data-slide="prev">
                <i class="fa fa-angle-left"></i>
            </a>
            <a class="right control-carousel" href="#recommended-item-carousel" data-slide="next">
                <i class="fa fa-angle-right"></i>
            </a>			
        </div>
    </div><!--/recommended_items-->

    <br/>
   <br/>
   
 <div class="recommended_items  "><!--recommended_items-->
        <h2 class="title text-center ma" style="margin-top: 0px;">Được yêu thích</h2>
        <div id="new-book-carousel" class="carousel slide" data-ride="carousel" data-interval="false">
            <div class="carousel-inner">
                <div class="item active row" style="padding-left: 15px; padding-right: 15px">	
                    <%
                        List<m_SACH> list5 = c_SACH.getlistYeuThich(0);
                        for (m_SACH sk : list5) {
                    %>
                    <div class="col-xs-6 col-sm-4">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <a href="#" class="xemChiTiet" name="<%= sk.getMaSach()%>">
                                    <div class="productinfo text-center">

                                        <center> <img src="<%= sk.getLinkAnh()%>" class="avtBook"/></center>
                                        <span class="savings-tab s3"> - <%= sk.getKhuyenMai()%> %</span>

                                        <h4><%= sk.getTenSach()%></h4>
                                            <p class="author"><% String tenTacGia;
                                            tenTacGia = c_TACGIA.getTenTacGia(sk.getMaTacGia());%> <%= tenTacGia%></p>
                                            <span class="price"><%= sk.getGiaBan()%> đ</span> 
                                        <span class="regular-price"><%= sk.getGiaBia()%>đ</span>

                                    </div>
                                    <div class="product-overlay">
                                        <div class="overlay-content">
                                            <p class="m"><%= sk.getTenSach()%></p>
                                            <p class="author"><% String tenTacGia1;
                                                    tenTacGia1 = c_TACGIA.getTenTacGia(sk.getMaTacGia());%> <%= tenTacGia1%></p>
                                            <h3><%= sk.getGiaBan()%> đ</h3>
                                            <div class="btn btn-default add-to-cart"><i class="glyphicon glyphicon-hand-up"></i>Chi tiết</div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>  
                    <%}%>
                </div>
                <div class="item" style="padding-left: 15px; padding-right: 15px">	
                    <%
                        List<m_SACH> list7 = c_SACH.getlistYeuThich(1);
                        for (m_SACH sm : list7) {
                    %>
                    <div class="col-xs-6 col-sm-4">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <a href="#" class="xemChiTiet" name="<%= sm.getMaSach()%>">
                                    <div class="productinfo text-center">

                                        <center><img src="<%= sm.getLinkAnh()%>" class="avtBook"/></center>
                                        <span class="savings-tab s3"> - <%= sm.getKhuyenMai()%> %</span>
                                        <h4><%= sm.getTenSach()%></h4>
                                            <p class="author"><% String tenTacGia;
                                            tenTacGia = c_TACGIA.getTenTacGia(sm.getMaTacGia());%> <%= tenTacGia%></p>
                                            <span class="price"><%= sm.getGiaBan()%> đ</span> 
                                        <span class="regular-price"><%= sm.getGiaBia()%>đ</span>

                                    </div>
                                    <div class="product-overlay">
                                        <div class="overlay-content">
                                            <p class="m"><%= sm.getTenSach()%></p>
                                            <p class="author"><% String tenTacGia1;
                                                tenTacGia1 = c_TACGIA.getTenTacGia(sm.getMaTacGia());%> <%= tenTacGia1%></p>
                                            <h3><%= sm.getGiaBan()%> đ</h3>
                                            <div class="btn btn-default add-to-cart"><i class="glyphicon glyphicon-hand-up"></i>Chi tiết</div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>  
                    <%}%>
                </div>
            </div>
            <a class="left control-carousel" href="#new-book-carousel" data-slide="prev">
                <i class="fa fa-angle-left"></i>
            </a>
            <a class="right control-carousel" href="#new-book-carousel" data-slide="next">
                <i class="fa fa-angle-right"></i>
            </a>	

        </div>
    </div><!--/recommended_items-->
    <br/>
   <br/>
   
    
    
     <div class="recommended_items  "><!--recommended_items-->
        <h2 class="title text-center ma" style="margin-top: 0px;">Khuyến mãi khủng</h2>
        <div id="new-book-carousell" class="carousel slide" data-ride="carousel" data-interval="false">
            <div class="carousel-inner">
                <div class="item active row" style="padding-left: 15px; padding-right: 15px">	
                    <%
                        List<m_SACH> list3 = c_SACH.getlistSachGiamGia(0);
                        for (m_SACH sk : list3) {
                    %>
                    <div class="col-xs-6 col-sm-4">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <a href="#" class="xemChiTiet" name="<%= sk.getMaSach()%>">
                                    <div class="productinfo text-center">

                                        <center> <img src="<%= sk.getLinkAnh()%>" class="avtBook"/></center>
                                        <span class="savings-tab s3"> - <%= sk.getKhuyenMai()%> %</span>

                                        <h4><%= sk.getTenSach()%></h4>
                                            <p class="author"><% String tenTacGia;
                                            tenTacGia = c_TACGIA.getTenTacGia(sk.getMaTacGia());%> <%= tenTacGia%></p>
                                            <span class="price"><%= sk.getGiaBan()%> đ</span> 
                                        <span class="regular-price"><%= sk.getGiaBia()%>đ</span>

                                    </div>
                                    <div class="product-overlay">
                                        <div class="overlay-content">
                                            <p class="m"><%= sk.getTenSach()%></p>
                                            <p class="author"><% String tenTacGia1;
                                                    tenTacGia1 = c_TACGIA.getTenTacGia(sk.getMaTacGia());%> <%= tenTacGia1%></p>
                                            <h3><%= sk.getGiaBan()%> đ</h3>
                                            <div class="btn btn-default add-to-cart"><i class="glyphicon glyphicon-hand-up"></i>Chi tiết</div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>  
                    <%}%>
                </div>
                <div class="item" style="padding-left: 15px; padding-right: 15px">	
                    <%
                        List<m_SACH> list4 = c_SACH.getlistSachGiamGia(1);
                        for (m_SACH sm : list4) {
                    %>
                    <div class="col-xs-6 col-sm-4">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <a href="#" class="xemChiTiet" name="<%= sm.getMaSach()%>">
                                    <div class="productinfo text-center">

                                        <center><img src="<%= sm.getLinkAnh()%>" class="avtBook"/></center>
                                        <span class="savings-tab s3"> - <%= sm.getKhuyenMai()%> %</span>
                                        <h4><%= sm.getTenSach()%></h4>
                                            <p class="author"><% String tenTacGia;
                                            tenTacGia = c_TACGIA.getTenTacGia(sm.getMaTacGia());%> <%= tenTacGia%></p>
                                            <span class="price"><%= sm.getGiaBan()%> đ</span> 
                                        <span class="regular-price"><%= sm.getGiaBia()%>đ</span>

                                    </div>
                                    <div class="product-overlay">
                                        <div class="overlay-content">
                                            <p class="m"><%= sm.getTenSach()%></p>
                                            <p class="author"><% String tenTacGia1;
                                                tenTacGia1 = c_TACGIA.getTenTacGia(sm.getMaTacGia());%> <%= tenTacGia1%></p>
                                            <h3><%= sm.getGiaBan()%> đ</h3>
                                            <div class="btn btn-default add-to-cart"><i class="glyphicon glyphicon-hand-up"></i>Chi tiết</div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>  
                    <%}%>
                </div>
            </div>
            <a class="left control-carousel" href="#new-book-carousell" data-slide="prev">
                <i class="fa fa-angle-left"></i>
            </a>
            <a class="right control-carousel" href="#new-book-carousell" data-slide="next">
                <i class="fa fa-angle-right"></i>
            </a>	

        </div>
    </div><!--/recommended_items-->
   <br/>
    <br/>
      <div class="recommended_items  "><!--recommended_items-->
        <h2 class="title text-center ma" style="margin-top: 0px;">Sách bán chạy</h2>
        <div id="new-book-carouseel" class="carousel slide" data-ride="carousel" data-interval="false">
            <div class="carousel-inner">
                <div class="item active row" style="padding-left: 15px; padding-right: 15px">	
                    <%
                        List<m_SACH> lists = c_SACH.getlistSachMoiNhat(5);
                        for (m_SACH sk : lists) {
                    %>
                    <div class="col-xs-6 col-sm-4">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <a href="#" class="xemChiTiet" name="<%= sk.getMaSach()%>">
                                    <div class="productinfo text-center">

                                        <center> <img src="<%= sk.getLinkAnh()%>" class="avtBook"/></center>
                                        <span class="savings-tab s3"> - <%= sk.getKhuyenMai()%> %</span>

                                        <h4><%= sk.getTenSach()%></h4>
                                            <p class="author"><% String tenTacGia;
                                            tenTacGia = c_TACGIA.getTenTacGia(sk.getMaTacGia());%> <%= tenTacGia%></p>
                                            <span class="price"><%= sk.getGiaBan()%> đ</span> 
                                        <span class="regular-price"><%= sk.getGiaBia()%>đ</span>

                                    </div>
                                    <div class="product-overlay">
                                        <div class="overlay-content">
                                            <p class="m"><%= sk.getTenSach()%></p>
                                            <p class="author"><% String tenTacGia1;
                                                    tenTacGia1 = c_TACGIA.getTenTacGia(sk.getMaTacGia());%> <%= tenTacGia1%></p>
                                            <h3><%= sk.getGiaBan()%> đ</h3>
                                            <div class="btn btn-default add-to-cart"><i class="glyphicon glyphicon-hand-up"></i>Chi tiết</div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>  
                    <%}%>
                </div>
                
                <div class="item" style="padding-left: 15px; padding-right: 15px">	
                    <%
                        List<m_SACH> listm = c_SACH.getlistYeuThich(6);
                        for (m_SACH sm : list7) {
                    %>
                    <div class="col-xs-6 col-sm-4">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <a href="#" class="xemChiTiet" name="<%= sm.getMaSach()%>">
                                    <div class="productinfo text-center">

                                        <center><img src="<%= sm.getLinkAnh()%>" class="avtBook"/></center>
                                        <span class="savings-tab s3"> - <%= sm.getKhuyenMai()%> %</span>
                                        <h4><%= sm.getTenSach()%></h4>
                                            <p class="author"><% String tenTacGia;
                                            tenTacGia = c_TACGIA.getTenTacGia(sm.getMaTacGia());%> <%= tenTacGia%></p>
                                            <span class="price"><%= sm.getGiaBan()%> đ</span> 
                                        <span class="regular-price"><%= sm.getGiaBia()%>đ</span>

                                    </div>
                                    <div class="product-overlay">
                                        <div class="overlay-content">
                                            <p class="m"><%= sm.getTenSach()%></p>
                                            <p class="author"><% String tenTacGia1;
                                                tenTacGia1 = c_TACGIA.getTenTacGia(sm.getMaTacGia());%> <%= tenTacGia1%></p>
                                            <h3><%= sm.getGiaBan()%> đ</h3>
                                            <div class="btn btn-default add-to-cart"><i class="glyphicon glyphicon-hand-up"></i>Chi tiết</div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>  
                    <%}%>
                </div>
            </div>
            <a class="left control-carousel" href="#new-book-carouseel" data-slide="prev">
                <i class="fa fa-angle-left"></i>
            </a>
            <a class="right control-carousel" href="#new-book-carouseel" data-slide="next">
                <i class="fa fa-angle-right"></i>
            </a>	

        </div>
    </div><!--/recommended_items-->
    
    <script>
        $(document).ready(function () {
                  $(".img1, .img2").show();
         
            $(".xemChiTiet").click(function () {
                var url, data;
                url = "product_details.jsp";
                data = {"id": $(this).attr("name")};
                $("#main_bar").html('<center><img style="width: 5%; margin-top: 30px" class="img-responsive" src="images/home/load.gif"/></center>');
                $("#main_bar").load(url, data);
                $(".img").show();
                $("#slider").hide();
            });
        });
    </script>  
</div>
