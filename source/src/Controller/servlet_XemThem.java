package Controller;

import model.c_DONHANG;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.c_KHACHHANG;
import model.c_NHANXET;
import model.c_SACH;
import model.m_DONHANG;
import model.m_KHACHHANG;
import model.m_NHANXET;
import model.m_SACH;

public class servlet_XemThem extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String n = request.getParameter("n");
            switch (n) {
                case "xemThemHoaDon": {
                    String page = request.getParameter("page");
                    int p = Integer.parseInt(page);
                    List<m_DONHANG> list = new ArrayList<m_DONHANG>();
                    list = c_DONHANG.getlist(p);
                    Gson gson = new Gson();
                    String donHang = gson.toJson(list);
                    out.print(donHang);
                    break;
                }
                case "xemThemKhachHang": {
                    String page = request.getParameter("page");
                    int p = Integer.parseInt(page);
                    List<m_KHACHHANG> list = new ArrayList<m_KHACHHANG>();
                    list = c_KHACHHANG.getlist(p);
                    Gson gson = new Gson();
                    String donHang = gson.toJson(list);
                    out.print(donHang);
                    break;
                }
                case "xemThemSach": {
                    String page = request.getParameter("page");
                    int p = Integer.parseInt(page);
                    List<m_SACH> list = new ArrayList<m_SACH>();
                    list = c_SACH.getlistSachMoiNhat(p, 5);
                    Gson gson = new Gson();
                    String donHang = gson.toJson(list);
                    out.print(donHang);
                    break;
                }
                case "xemThemNhanXet": {
                    String page = request.getParameter("page");
                    int p = Integer.parseInt(page);
                    List<m_NHANXET> list = new ArrayList<m_NHANXET>();
                    list = c_NHANXET.getlistmoinhat(p);
                    Gson gson = new Gson();
                    String donHang = gson.toJson(list);
                    out.print(donHang);
                    break;
                }
                default:
                    break;
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
