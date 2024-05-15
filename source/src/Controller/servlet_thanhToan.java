package Controller;

import model.c_THANHTOAN;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.m_THANHTOAN;

public class servlet_thanhToan extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String n = request.getParameter("n");
            try {
                switch (n) {
                    case "them":
                        String name = request.getParameter("name");
                        int i1 = c_THANHTOAN.themTHANHTOAN(new m_THANHTOAN(name));
                        out.println(i1);
                        break;
                    case "timTen":
                        String ma1 = request.getParameter("ma");
                        String ten1 = c_THANHTOAN.timTenTHANHTOAN(Integer.parseInt(ma1));
                        out.println(ten1);
                        break;
                    case "timMa":
                        String m = request.getParameter("ten");
                        int ma = c_THANHTOAN.timMaTHANHTOAN(m);
                        out.println(ma);
                        break;
                    case "xoa":
                        int mm = Integer.parseInt(request.getParameter("ma"));
                        int i = c_THANHTOAN.xoaTHANHTOAN(mm);
                        out.println(i);
                        break;
                    case "sua":
                        int mo = Integer.parseInt(request.getParameter("ma"));
                        String moo = request.getParameter("name");
                        int k = c_THANHTOAN.suaTHANHTOAN(mo, moo);
                        out.println(k);
                        break;
                    default:
                        break;
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
