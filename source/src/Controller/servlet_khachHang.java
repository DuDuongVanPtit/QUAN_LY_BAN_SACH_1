package Controller;

import model.c_SACHYEUTHICH;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.c_KHACHHANG;
import model.c_SACH;
import model.m_KHACHHANG;
import model.m_SACHYEUTHICH;

public class servlet_khachHang extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String n = request.getParameter("n");
            try {
                if (n.equals("themVaoYeuThich")) {
                    String masach = request.getParameter("maSach");
                    String makh = request.getParameter("maKh");
                    
                    int idsach = Integer.parseInt(masach);
                    int idkh = Integer.parseInt(makh);
                    m_SACHYEUTHICH s = new m_SACHYEUTHICH(idsach, idkh);
                    
                    int i1 = c_SACHYEUTHICH.themSACHYEUTHICH(s);
                    int i2 = c_SACHYEUTHICH.soSachYeuThich(idkh);
                    int i3 = c_SACH.congDiem(5, idsach);
                    out.println(i2);
                } else if (n.equals("suaKhachHang")) {
                    String id = request.getParameter("id");
                    String tenn = request.getParameter("tenn");
                    String dcc = request.getParameter("dcc");
                    String mkk = request.getParameter("mkk");
                    String sdtt = request.getParameter("sdtt");
                    String email = request.getParameter("email");
                    
                    int idd = Integer.parseInt(id);
                    
                    m_KHACHHANG m = new m_KHACHHANG(idd, tenn, dcc, email, sdtt, mkk);
                    int i = c_KHACHHANG.suaKHACHHANG(m);
                    HttpSession session = request.getSession();
                    session.removeAttribute("khachHang");
                    session.setAttribute("khachHang", m);
                    out.print(i);                    
                } else if (n.equals("xoaKhachHang")) {
                    String id = request.getParameter("id");
                    int idd = Integer.parseInt(id);
                    int k = c_KHACHHANG.xoaKHACHHANG(idd);
                    out.print(k);
                }
                
            } catch (Exception e) {
                out.print(e.getMessage());
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
