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
<script src="js/jquery.min.js"></script>
  <meta charset="UTF-8">


 <div class="col-sm-12" style="background: white;  padding: 15px;margin-top: -43px; padding-top: 40px;">
<div id="main_bar">
   
    <%
        int co = 0;
        String a = request.getParameter("a");
        String id = request.getParameter("id");
        String pagee = request.getParameter("page");
        int idd = Integer.parseInt(id);
        int pageee = Integer.parseInt(pagee) - 1;
        List<m_SACH> list = new ArrayList<m_SACH>();
        if (a.equals("TheLoai")) {
            co = c_THELOAI.getSoLuongSachCuaTheLoai(idd);
        } else if (a.equals("TacGia")) {
            co = c_TACGIA.getSoLuongSachCuaTG(idd);
        } else {
            co = c_NXB.getSoLuongSachCuaNXB(idd);
        }
    %>

    <div class="fbook"></div>

    <div class="pagination-area col-xs-12 col-sm-12">
        <ul class="pagination">
            <%
                int i = 0;
                for (i = 1; co > 0; i++) {
            %> 
            <li><a href="#" class="chuyen_trang" id="<%= i%>"><%= i%></a></li>
                <% co = co - 9;
                    }%>
        </ul>
    </div>
</div>
 </div>
<script>

    $(document).ready(function () {

            var url, data;

            url = "fbook.jsp";
            data = {"id": <%= id%>, "a": "<%= a%>", "page": "1"};
            $(".fbook").load(url, data);
           
            $('li:first-child > a').addClass('active');
           
        $(".chuyen_trang").click(function () {
            $(this).addClass('active');
            $('.chuyen_trang').not(this).removeClass('active');

            var ii = $(this).html();
            var url, data;

            url = "fbook.jsp";
            data = {"id": <%= id%>, "a": "<%= a%>", "page": ii};
              $(".fbook").html('<center><img style="width: 5%; margin-top: 30px" class="img-responsive" src="images/home/load.gif"/></center>');
            $(".fbook").load(url, data);
        });
        
    });
</script>   
