package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.c_SACHYEUTHICH;
import model.m_GIOHANG;
import model.c_THELOAI;
import model.c_TACGIA;
import model.c_DONHANG;
import model.m_DONHANG;
import model.m_KHACHHANG;
import model.m_NXB;
import model.c_NXB;
import model.m_TACGIA;
import model.c_TACGIA;
import model.m_THELOAI;
import java.util.ArrayList;
import java.util.List;
import model.c_THELOAI;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <link rel=\"shortcut icon\" href=\"../images/home/ic.png\">\r\n");
      out.write("        <title>Home | BookStore</title>\r\n");
      out.write("        <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("        <link href=\"css/font-awesome.min.css\" rel=\"stylesheet\">\r\n");
      out.write("        <link href=\"css/main.css\" rel=\"stylesheet\">   \r\n");
      out.write("          \r\n");
      out.write("        <script src=\"js/jquery.min.js\"></script>\r\n");
      out.write("        <script src=\"js/bootstrap.min_1.js\"></script>\r\n");
      out.write("        <script type=\"text/javascript\" src=\"js/jquery.autocomplete.min.js\"></script>\r\n");
      out.write("        <script src=\"js/main.js\"></script>\r\n");
      out.write("       <script src=\"js/c.js\"></script>\r\n");
      out.write("        <link href=\"css/animate.css\" rel=\"stylesheet\"> \r\n");
      out.write("       \r\n");
      out.write("    </head>\r\n");
      out.write("    ");

        int j = 0;
        int tt = 0;
        ArrayList<m_GIOHANG> cart = (ArrayList<m_GIOHANG>) session.getAttribute("cart");
        if (cart != null) {
            j = cart.size();
        }
    
      out.write("\r\n");
      out.write("    <script>\r\n");
      out.write("        $(document).ready(function () {\r\n");
      out.write("            var o = ");
      out.print( j);
      out.write(";\r\n");
      out.write("            if (o > 0)\r\n");
      out.write("            {\r\n");
      out.write("                $(\".c1\").html(o).show();\r\n");
      out.write("            } else\r\n");
      out.write("            {\r\n");
      out.write("                $(\".c1\").hide();\r\n");
      out.write("            }\r\n");
      out.write("        });\r\n");
      out.write("    </script>  \r\n");
      out.write("    <body>\r\n");
      out.write("        ");

            m_KHACHHANG km = (m_KHACHHANG) session.getAttribute("khachHang");
            if (km != null) {
                if (km.getEmail().equals("admin")) {
        
      out.write("\r\n");
      out.write("        <script>\r\n");
      out.write("            $(document).ready(function () {\r\n");
      out.write("                $(\".ad\").show();\r\n");
      out.write("            });\r\n");
      out.write("        </script>\r\n");
      out.write("        ");
} else {
      out.write("\r\n");
      out.write("        <script>\r\n");
      out.write("            $(document).ready(function () {\r\n");
      out.write("                $(\".ad\").hide();\r\n");
      out.write("            });\r\n");
      out.write("        </script>\r\n");
      out.write("        ");
 }
            }
      out.write("\r\n");
      out.write("        <div class=\"mn\">\r\n");
      out.write("            <div class=\"container\">\r\n");
      out.write("                <div class=\"col-sm-6\" style=\"margin-top: 10px\">\r\n");
      out.write("                    <div class=\"contactinfo\">\r\n");
      out.write("                        <ul class=\"nav nav-pills\">\r\n");
      out.write("                            <li><a style=\"padding-left: 15px;\" ><i class=\"fa fa-phone\"></i> +2 95 01 88 821</a></li>\r\n");
      out.write("                            <li><a style=\"padding-left: 15px;\"><i class=\"fa fa-envelope\"></i> nhasachIndigo9111@gmail.com</a></li>\r\n");
      out.write("                        </ul>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"shop-menu pull-right\">\r\n");
      out.write("                    <ul class=\"nav navbar-nav\">  \r\n");
      out.write("                        <li class=\"dropdown\">\r\n");
      out.write("                            ");

                                m_KHACHHANG kh = (m_KHACHHANG) session.getAttribute("khachHang");
                                if (kh != null) {
                                    int syt = c_SACHYEUTHICH.soSachYeuThich(kh.getMaKH());
                            
      out.write("\r\n");
      out.write("                            <script>\r\n");
      out.write("                                $(document).ready(function () {\r\n");
      out.write("                                    var oo = ");
      out.print( syt);
      out.write(";\r\n");
      out.write("                                    if (oo > 0)\r\n");
      out.write("                                    {\r\n");
      out.write("                                        $(\".c2\").html(oo).show();\r\n");
      out.write("                                    } else\r\n");
      out.write("                                    {\r\n");
      out.write("                                        $(\".c2\").hide();\r\n");
      out.write("                                    }\r\n");
      out.write("                                    $('.ml').hide();\r\n");
      out.write("                                });\r\n");
      out.write("                            </script>  \r\n");
      out.write("                            <a data-toggle=\"dropdown\" class=\"lg\" href=\"#\" style=\"color: #696763;\">");
      out.print(kh.getEmail());
      out.write("</a>\r\n");
      out.write("                            <ul class=\"dropdown-menu l\">\r\n");
      out.write("                                <div class=\"signup-form\"><!--sign up form-->\r\n");
      out.write("                                    <div class =\"form_dk\">\r\n");
      out.write("                                        <input type=\"email\" placeholder=\"Email\" class=\"email_dn\" value=\"");
      out.print(kh.getEmail());
      out.write("\"/><span id=\"msg\" style=\"font-size: 12px\"></span>\r\n");
      out.write("                                        <input type=\"password\" placeholder=\"Mật khẩu\" value=\"");
      out.print(kh.getMatKhau());
      out.write("\" class=\"matKhau_dn\"/>\r\n");
      out.write("                                        <button type=\"button\" class=\"btn btn-default pull-right\"  id =\"dangNhap\" >Đăng xuất</button>\r\n");
      out.write("                                        <button type=\"button\" class=\"btn btn-default ml\"  data-toggle=\"modal\" data-target=\"#myModal\" >Đăng ký</button>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                </div><!--/sign up form-->\r\n");
      out.write("                            </ul>\r\n");
      out.write("                            ");
} else {
      out.write("\r\n");
      out.write("                            <a hrer=\"#\" data-toggle=\"dropdown\" class=\"lg\" style=\"color: #696763;\"><i class=\"fa fa-lock\"></i> Đăng nhập</a>\r\n");
      out.write("                            <ul class=\"dropdown-menu l\" >\r\n");
      out.write("                                <div class=\"signup-form\"><!--sign up form-->\r\n");
      out.write("                                    <div class =\"form_dk\">\r\n");
      out.write("                                        <input type=\"email\" placeholder=\"Email\" class=\"email_dn\" /><span id=\"msg\" style=\"font-size: 12px\"></span>\r\n");
      out.write("                                        <input type=\"password\" placeholder=\"Mật khẩu\" class=\"matKhau_dn\"/>\r\n");
      out.write("                                        <button type=\"button\" class=\"btn btn-default\"  id =\"dangNhap\" >Đăng nhập</button>\r\n");
      out.write("                                        <button type=\"button\" class=\"btn btn-default ml\"  data-toggle=\"modal\" data-target=\"#myModal\" >Đăng ký</button>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                </div><!--/sign up form-->\r\n");
      out.write("                            </ul>\r\n");
      out.write("                            ");
}
      out.write("\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"content.jsp?id=1\"><img class=\"img-responsive\" src=\"../images/home/cart.png\"/></a>\r\n");
      out.write("                            <span class=\"c1\" style=\"top: 20%;left: 60%; display: none\"></span>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li class=\"ad\" style=\"display: none\">\r\n");
      out.write("                            <a href=\"http://localhost:8084/admin/index.jsp\" >Trang ADMIN</a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    <header id=\"header_content\"><!--header-->\r\n");
      out.write("        <div class=\"header-middle\"><!--header-middle-->\r\n");
      out.write("            <div class=\"container\">\r\n");
      out.write("                <div class=\"row\">\r\n");
      out.write("                    <div class=\"col-sm-2 col-xs-6\">\r\n");
      out.write("                        <div class=\"logo pull-left\">\r\n");
      out.write("                            <a href=\"index.jsp\" class=\"logoo\"><img class=\"img-responsive\" src=\"images/home/logo.png\"/></a>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"col-sm-7 col-xs-6\">\r\n");
      out.write("                        <img class=\"img-responsive\" src=\"images/home/shipp.gif\"/>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"col-sm-3 col-xs-6 \">\r\n");
      out.write("                        <ul class=\"nav navbar-nav collapse navbar-collapse\">       \r\n");
      out.write("                            <li class=\"search_box\">\r\n");
      out.write("                                <input type=\"text\" class=\"timkiem biginput\" name=\"currency\"  id=\"autocomplete\"  placeholder=\"Tên sách ...\" />\r\n");
      out.write("\r\n");
      out.write("                            </li>\r\n");
      out.write("                            <li class=\"dropdown\">\r\n");
      out.write("                                <a href=\"#\" style=\"color:#B1AFAB\">Lọc <i class=\"fa fa-angle-down\"></i></a>\r\n");
      out.write("                                <ul role=\"menu\" class=\"sub-menu\" style=\"width: 150px\">\r\n");
      out.write("                                    <li><a href=\"#\" class=\"ten_sach\">Tên sách</a></li>                                  \r\n");
      out.write("                                    <li><a href=\"#\" class=\"tac_gia\">Tác giả</a></li> \r\n");
      out.write("                                    <li><a href=\"#\" class=\"nha_xuat_ban\">Nhà xuất bản</a></li> \r\n");
      out.write("                                </ul>\r\n");
      out.write("                            </li>\r\n");
      out.write("                        </ul>          \r\n");
      out.write("                        <!-- Modal -->\r\n");
      out.write("                        <div class=\"modal fade\" id=\"myModal\">\r\n");
      out.write("                            <div class=\"modal-dialog\">\r\n");
      out.write("                                <div class=\"modal-content lm\">\r\n");
      out.write("                                    <div class=\"modal-header\">\r\n");
      out.write("                                        <button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\r\n");
      out.write("                                        <center><h3 class=\"modal-title\" style=\"font-size: 16px; margin-top: 25px; color: #FE980F\">ĐĂNG KÝ TÀI KHOẢN</h3></center>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"modal-body\">\r\n");
      out.write("                                        <div class=\"signup-form\">\r\n");
      out.write("                                            <table class=\"table\">\r\n");
      out.write("                                                <tr>\r\n");
      out.write("                                                    <td><input type=\"text\" placeholder=\"Mã tài khoản\" class=\"ma_dk\" disabled/></td>\r\n");
      out.write("                                                    <td><input type=\"text\" placeholder=\"Tên tài khoản\" class=\"ten_dk\"/></td>\r\n");
      out.write("                                                </tr>\r\n");
      out.write("                                                <tr>\r\n");
      out.write("                                                    <td><input type=\"text\" placeholder=\"Địa chỉ\" class=\"dc_dk\"/></td>\r\n");
      out.write("                                                    <td><input type=\"email\" placeholder=\"Email\" class=\"email_dk\" /><span class=\"msg\" style=\"font-size: 12px\"></span></td>\r\n");
      out.write("                                                </tr>\r\n");
      out.write("                                                <tr>\r\n");
      out.write("                                                    <td><input type=\"text\" placeholder=\"Số điện thoại\" class=\"sdt_dk\"/></td>\r\n");
      out.write("                                                    <td><input type=\"password\" placeholder=\"Mật khẩu\" class=\"mk_dk\"/></td>\r\n");
      out.write("                                                </tr>\r\n");
      out.write("                                            </table>\r\n");
      out.write("                                        </div><!--/sign up form-->\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"modal-footer\">\r\n");
      out.write("                                        <p class=\"tb pull-left\" style=\"font-size: 12px;margin-left: 5px\"></p>\r\n");
      out.write("                                        <button class=\"btn btn-default dangKy\">Gửi</button>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div><!--/header-middle-->\r\n");
      out.write("\r\n");
      out.write("        <div class=\"header-bottom\"><!--header-bottom-->\r\n");
      out.write("            <div class=\"container\">\r\n");
      out.write("                <div class=\"row\" style=\"margin-top: 10px\">\r\n");
      out.write("                    <div class=\"navbar-header\">\r\n");
      out.write("                        <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\".navbar-collapse\">\r\n");
      out.write("                            <span class=\"sr-only\">Toggle navigation</span>\r\n");
      out.write("                            <span class=\"icon-bar\"></span>\r\n");
      out.write("                            <span class=\"icon-bar\"></span>\r\n");
      out.write("                            <span class=\"icon-bar\"></span>\r\n");
      out.write("                        </button>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"mainmenu pull-left\">\r\n");
      out.write("                        <ul class=\"nav navbar-nav collapse navbar-collapse\">\r\n");
      out.write("                            <li><a href=\"index.jsp\" class=\"logoo\" >Trang chủ</a></li>                   \r\n");
      out.write("                            <li><a href=\"content.jsp?id=4\" >Liên hệ</a></li>\r\n");
      out.write("                            <li><a href=\"content.jsp?id=2\" >Tài khoản</a></li>\r\n");
      out.write("                            <li><a href=\"content.jsp?id=1\" >Thanh toán</a></li>                        \r\n");
      out.write("                            <li>\r\n");
      out.write("                                <a href=\"content.jsp?id=2\" >Yêu thích</a>\r\n");
      out.write("                                <span class=\"c2\" style=\"top: -17%;left: 80%; display: none\"></span>\r\n");
      out.write("                            </li>\r\n");
      out.write("\r\n");
      out.write("                        </ul>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>   \r\n");
      out.write("            </div>\r\n");
      out.write("        </div><!--/header-bottom-->\r\n");
      out.write("\r\n");
      out.write("    </header>\r\n");
      out.write("    <!--/header-->\r\n");
      out.write("    <div id=\"slider\">");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "slider.jsp", out, false);
      out.write("</div>\r\n");
      out.write("        <div class=\"img\"></div>\r\n");
      out.write("        <script>\r\n");
      out.write("            $(document).ready(function () {\r\n");
      out.write("                $(\".img\").hide();\r\n");
      out.write("            });\r\n");
      out.write("        </script>\r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("            <div class=\"row\">\r\n");
      out.write("                <div class=\"col-sm-3\">\r\n");
      out.write("\r\n");
      out.write("                    <div id=\"bar\">                      \r\n");
      out.write("                        <div class=\"theLoai panel-group \">\r\n");
      out.write("                        ");

                            c_THELOAI tl = new c_THELOAI();
                            List<m_THELOAI> list1 = new ArrayList<m_THELOAI>();
                            list1 = tl.getlist();
                        
      out.write("\r\n");
      out.write("                        <h2 class=\"title text-center ma\" style=\"margin-top: 0px; margin-right: 0; margin-left: 0;\">Thể loại</h2>\r\n");
      out.write("\r\n");
      out.write("                        <ul class=\"nav nav-pills nav-stacked g category-products \">\r\n");
      out.write("                            ");

                                for (m_THELOAI tll : list1) {
                                    int idTheLoai = tll.getMaTheLoai();
                            
      out.write("\r\n");
      out.write("                            <li class=\"TheLoai\" name=\"");
      out.print(idTheLoai);
      out.write("\"><a href=\"#\">\r\n");
      out.write("                                    <span class=\"pull-right\">(");
      out.print( c_THELOAI.getSoLuongSachCuaTheLoai(idTheLoai));
      out.write(")\r\n");
      out.write("                                    </span>");
      out.print( tll.getTenTheLoai());
      out.write("</a></li>                                  \r\n");
      out.write("                                    ");
}
      out.write("\r\n");
      out.write("                        </ul>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"tacGia panel-group \">\r\n");
      out.write("                        ");

                            c_TACGIA t = new c_TACGIA();
                            List<m_TACGIA> list2 = new ArrayList<m_TACGIA>();
                            list2 = t.getlist();
                        
      out.write("\r\n");
      out.write("                        <h2 class=\"title text-center ma\" style=\"margin-top: 0px; margin-left: 0; margin-right: 0\">Tác giả</h2>\r\n");
      out.write("\r\n");
      out.write("                        <ul class=\"nav nav-pills nav-stacked g category-products\">\r\n");
      out.write("                            ");

                                for (m_TACGIA tg : list2) {
                                    int idTacGia = tg.getMaTacGia();
                            
      out.write("\r\n");
      out.write("                            <li class=\"TacGia\" name=\"");
      out.print(idTacGia);
      out.write("\" ><a href=\"#\"> <span class=\"pull-right\">(");
      out.print( c_TACGIA.getSoLuongSachCuaTG(tg.getMaTacGia()));
      out.write(")\r\n");
      out.write("                                    </span>");
      out.print( tg.getTenTacGia());
      out.write("</a></li>\r\n");
      out.write("\r\n");
      out.write("                            ");
}
      out.write("\r\n");
      out.write("                        </ul>\r\n");
      out.write("\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"Nhaxuatban panel-group \">\r\n");
      out.write("                        ");

                            c_NXB n = new c_NXB();
                            List<m_NXB> list3 = new ArrayList<m_NXB>();
                            list3 = n.getlist();
                        
      out.write("\r\n");
      out.write("                        <h2 class=\"title text-center ma\" style=\"margin-top: 0px; margin-left: 0; margin-right: 0;\">Nhà xuất bản</h2>\r\n");
      out.write("\r\n");
      out.write("                        <ul class=\"nav nav-pills nav-stacked g category-products\">\r\n");
      out.write("                            ");

                                for (m_NXB nx : list3) {
                                    int idNXB = nx.getMaNXB();
                            
      out.write("\r\n");
      out.write("                            <li class=\"nxb\" name=\"");
      out.print(idNXB);
      out.write("\" ><a href=\"#\"> <span class=\"pull-right\">(");
      out.print( c_NXB.getSoLuongSachCuaNXB(nx.getMaNXB()));
      out.write(")\r\n");
      out.write("                                    </span>");
      out.print( nx.getTenNXB());
      out.write("</a></li>\r\n");
      out.write("\r\n");
      out.write("                            ");
}
      out.write("\r\n");
      out.write("                        </ul>\r\n");
      out.write("\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("                    \r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("            <div class=\"col-sm-9 padding-right\">\r\n");
      out.write("                <div id=\"main_bar\"><center><img style=\"width: 5%; margin-top: 30px\" class=\"img-responsive\" src=\"images/home/load.gif\"/></center></div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <div >");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write(" <script>\r\n");
      out.write("        $(document).ready(function () {\r\n");
      out.write("            $(\".n\").click(function () {\r\n");
      out.write("                var url, data;\r\n");
      out.write("                url = \"product_details.jsp\";\r\n");
      out.write("                data = {\"id\": 1};\r\n");
      out.write("                $(\"#main_bar\").html('<center><img style=\"width: 4%; margin-top: 30px; margin-bottom:600px\" class=\"img-responsive\" src=\"images/home/load.gif\"/></center>');\r\n");
      out.write("                $(\"#main_bar\").load(url, data);\r\n");
      out.write("            });\r\n");
      out.write("        });\r\n");
      out.write("    </script>  ");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
