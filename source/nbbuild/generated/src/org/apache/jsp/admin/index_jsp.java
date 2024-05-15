package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.m_KHACHHANG;

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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <link rel=\"shortcut icon\" href=\"../images/home/ic.png\">\n");
      out.write("        <title>Admin | Bookstore</title>\n");
      out.write("        <link href=\"/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"/css/sb-admin.css\" rel=\"stylesheet\">\n");
      out.write("        <script src=\"/js/jquery.js\"></script>\n");
      out.write("        <script src=\"js/main.js\"></script>\n");
      out.write("        <script src=\"/js/bootstrap.min_1.js\"></script>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            m_KHACHHANG km = (m_KHACHHANG) session.getAttribute("khachHang");
            if (km != null) {
                if (km.getEmail().equals("admin")) {
        
      out.write("\n");
      out.write("        <div id=\"wrapper\">\n");
      out.write("\n");
      out.write("            <nav class=\"navbar navbar-inverse navbar-fixed-top\" role=\"navigation\">\n");
      out.write("                <div class=\"navbar-header\">\n");
      out.write("                    <a class= \"navbar-brand a\" href=\"http://localhost:8084/index.jsp\" style=\"padding-left: 20px; color: white\">I-ndiGo</a>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"collapse navbar-collapse navbar-ex1-collapse\" >\n");
      out.write("                    <ul class=\"nav navbar-nav side-nav\" style=\"padding-left: 15px\">\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"#\" class=\"b2\" >Sách</a>\n");
      out.write("                        </li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"#\" class=\"b1\" >Khách hàng</a>\n");
      out.write("                        </li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"#\" class=\"b3\" >Tác giả</a>\n");
      out.write("                        </li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"#\" class=\"b4\" >Nhà xuất bản</a>\n");
      out.write("                        </li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"#\" class=\"b5\" >Thể loại</a>\n");
      out.write("                        </li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"#\" class=\"b6\" >Thanh toán</a>\n");
      out.write("                        </li>\n");
      out.write("                        \n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"#\" class=\"b7\">Nhận xét</a>\n");
      out.write("                        </li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"#\" class=\"b8\">Đơn hàng</a>\n");
      out.write("                        </li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"#\" class=\"b99\">Thống kê</a>\n");
      out.write("                        </li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("            </nav>\n");
      out.write("\n");
      out.write("            <div id=\"page-wrapper\">\n");
      out.write("                ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "sach.jsp", out, false);
      out.write("\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        ");
 } else { 
      out.write("\n");
      out.write("        <a class= \"navbar-brand a\" href=\"http://localhost:8084/index.jsp\" style=\"padding-left: 20px; color: white\">Trang chủ</a>\n");
      out.write("        ");
} 
      out.write("\n");
      out.write("\n");
      out.write("        ");
} else {
      out.write("\n");
      out.write("\n");
      out.write("        <a class= \"navbar-brand a\" href=\"http://localhost:8084/index.jsp\" style=\"padding-left: 20px; color: white\">Trang chủ</a>\n");
      out.write("\n");
      out.write("        ");
 }
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
