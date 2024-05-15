package Controller;

import model.c_SACH;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.m_GIOHANG;
import model.m_SACH;

public class servlet_Giohang extends HttpServlet {

    private static List<m_GIOHANG> cart;

    public servlet_Giohang() {
        servlet_Giohang.cart = new ArrayList<m_GIOHANG>();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String n = request.getParameter("n");
            String ma = request.getParameter("ma");
            switch (n) {
                case "themVaoGioHang": {
                    String sl = request.getParameter("sl");
                    m_SACH k = c_SACH.timSachTheoMa(Integer.parseInt(ma));
                    themVaoGioHang(k, Integer.parseInt(sl));
                    HttpSession ss = request.getSession();
                    ss.setAttribute("cart", cart);
                    int i = cart.size();
                    out.print(i);
                    break;
                }
                case "xoaSachTrongGioHang": {
                    HttpSession ss = request.getSession();
                    int i = cart.size();
                    m_SACH k = c_SACH.timSachTheoMa(Integer.parseInt(ma));
                    xoaSachTrongGioHang(k);
                    ss.setAttribute("cart", cart);
                    i = cart.size();
                    out.print(i);
                    break;
                }
                case "suaSoLuong": {
                    HttpSession ss = request.getSession();
                    String sl = request.getParameter("sl");
                    m_SACH k = c_SACH.timSachTheoMa(Integer.parseInt(ma));
                    thayDoiSoLuong(k, Integer.parseInt(sl));
                    ss.setAttribute("cart", cart);
                    int i = cart.size();
                    out.print(i);
                    break;
                }
                default:
                    break;
            }
        }
    }

    public String themVaoGioHang(m_SACH s, int sl) {
        for (m_GIOHANG item : cart) {
            if (item.getm_SACH().getMaSach() == s.getMaSach()) {
                item.setsl(sl);
                return "cart";
            }
        }
        m_GIOHANG c = new m_GIOHANG();
        c.sets(s);
        c.setsl(sl);
        cart.add(c);
        return "cart";
    }

    public String thayDoiSoLuong(m_SACH s, int sl) {
        for (m_GIOHANG item : cart) {
            if (item.getm_SACH().getMaSach() == s.getMaSach()) {
                item.setsl(sl);
                return "cart";
            }
        }
        return "cart";
    }

    public String xoaSachTrongGioHang(m_SACH s) {
        for (m_GIOHANG item : cart) {
            if (item.getm_SACH().getMaSach() == s.getMaSach()) {
                cart.remove(item);
            }
        }
        return "cart";
    }

    public static void clear() {
        cart.clear();
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
