package Controller;

import model.c_KHACHHANG;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.m_KHACHHANG;

public class servlet_DangNhap extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String n = request.getParameter("n");
            switch (n) {
                case "kiemTra": {
                    String ten = request.getParameter("email_dn");
                    int m = c_KHACHHANG.KiemTra(ten);
                    out.println(m);
                    break;
                }
                case "DangNhap": {
                    HttpSession session = request.getSession();
                    
                    String email = request.getParameter("email_dn");
                    String matkhau = request.getParameter("matKhau_dn");
                    int m = c_KHACHHANG.DangNhap(email, matkhau);
                    if (m == 1) {
                        m_KHACHHANG l = c_KHACHHANG.kh_email(email);
                        session.setAttribute("khachHang", l);
                        session.setMaxInactiveInterval(3600); 
                    }
                    out.println(m);
                    break;
                }
                case "DangXuat": {
                    HttpSession session = request.getSession();
                    session.removeAttribute("khachHang");
                    out.println(1);
                    break;
                }
                default: {
                    String ten = request.getParameter("ten");
                    String matKhau = request.getParameter("matKhau");
                    String email = request.getParameter("email");
                    String dc = request.getParameter("dc");
                    String sdt = request.getParameter("sdt");
                    m_KHACHHANG k = new m_KHACHHANG(ten, dc, email, sdt, matKhau);
                    int i = c_KHACHHANG.themKHACHHANG(k);
                    out.println(i);
                    break;
                }
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
