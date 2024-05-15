package Controller;

import model.c_NHANXET;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.c_SACH;
import model.m_NHANXET;

public class servlet_NhanXet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String n = request.getParameter("n");
            try {

                switch (n) {
                    case "themNhanXet":
                        String email = request.getParameter("email");
                        String ten = request.getParameter("ten");
                        String nd = request.getParameter("nd");
                        String diem = request.getParameter("diem");
                        String idkh = request.getParameter("idkh");
                        String idSach = request.getParameter("idSach");
                        int d = Integer.parseInt(diem);
                        int kh = Integer.parseInt(idkh);
                        int s = Integer.parseInt(idSach);
                        c_SACH.congDiem(d, s);
                        m_NHANXET x = new m_NHANXET(s, kh, d, nd, email, ten);
                        int i = c_NHANXET.themNHANXET(x);
                        out.print(i);
                        break;
                    case "xoa": {
                        String id = request.getParameter("ma");
                        int idd = Integer.parseInt(id);
                        int im = c_NHANXET.xoaNhanXet(idd);
                        out.print(im);          
                        break;
                    }
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
