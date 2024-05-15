package Controller;

import model.c_TACGIA;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.m_TACGIA;

public class servlet_tacGia extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String n = request.getParameter("n");
            try {
                switch (n) {
                    case "them":
                        String name = request.getParameter("name");
                        int i1 = c_TACGIA.themTACGIA(new m_TACGIA(name));
                        out.println(i1);
                        break;
                    case "timTen":
                        String ma1 = request.getParameter("ma");
                        String ten1 = c_TACGIA.getTenTacGia(Integer.parseInt(ma1));
                        out.println(ten1);
                        break;
                    case "timMa":
                        String m = request.getParameter("ten");
                        int ma = c_TACGIA.timMaTACGIA(m);
                        out.println(ma);
                        break;
                    case "xoa":
                        int mm = Integer.parseInt(request.getParameter("ma"));
                        int i = c_TACGIA.xoaTACGIA(mm);
                        out.println(i);
                        break;
                    case "sua":
                        int mo = Integer.parseInt(request.getParameter("ma"));
                        String moo = request.getParameter("name");
                        int l = c_TACGIA.suaTACGIA(mo, moo);
                        out.println(l);
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(servlet_tacGia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(servlet_tacGia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
