package Controller;

import com.google.gson.Gson;
import model.c_TACGIA;
import model.c_SACH;
import model.c_NXB;
import model.c_THELOAI;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.m_SACH;

public class servlet_sach extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        try (PrintWriter out = response.getWriter()) {
            String n = request.getParameter("n");
            try {
                switch (n) {
                    case "them": {
                        String v1 = request.getParameter("tl_them");
                        String v2 = request.getParameter("tg_them");
                        String v3 = request.getParameter("nxb_them");
                        String v4 = request.getParameter("ten_them");
                        String v5 = request.getParameter("namxb_them");
                        String v6 = request.getParameter("sl_them");
                        String v7 = request.getParameter("st_them");
                        String v8 = request.getParameter("nn_them");
                        String v9 = request.getParameter("tt_them");
                        String v10 = request.getParameter("gbia_them");
                        String v11 = request.getParameter("km_them");
                        String v14 = request.getParameter("la_them");
                        String v15 = request.getParameter("kl_them");
                        int maTheLoai = c_THELOAI.timMaTHELOAI(v1);
                        int maNXB = c_NXB.timMaNXB(v3);
                        int maTacGia = c_TACGIA.timMaTACGIA(v2);
                        int giaBia = Integer.parseInt(v10);
                        int khuyenMai = Integer.parseInt(v11);
                        int giaBan = giaBia * (100 - khuyenMai) / 100;
                        m_SACH s = new m_SACH(maTheLoai, v4, maNXB, maTacGia, Integer.parseInt(v5), Integer.parseInt(v6), Integer.parseInt(v7), v15, v8, v9, giaBia, khuyenMai, giaBan, 0, v14);
                        int i = c_SACH.themSACH(s);
                        out.println(i);
                        break;
                    }
                    case "sua": {
                        String vo = request.getParameter("ma");
                        String v4 = request.getParameter("ten_them");
                        String v6 = request.getParameter("sl_them");
                        String v7 = request.getParameter("st_them");
                        String v8 = request.getParameter("nn_them");
                        String v9 = request.getParameter("tt_them");
                        String v10 = request.getParameter("gbia_them");
                        String v11 = request.getParameter("km_them");
                        String v14 = request.getParameter("la_them");
                        String v15 = request.getParameter("kl_them");
                        String v16 = request.getParameter("namxb_them");

                        int maSach = Integer.parseInt(vo);

                        int giaBia = Integer.parseInt(v10);
                        int khuyenMai = Integer.parseInt(v11);
                        int giaBan = giaBia * (100 - khuyenMai) / 100;

                        m_SACH s = new m_SACH(maSach, 0, v4, 0, 0, Integer.parseInt(v16), Integer.parseInt(v6), Integer.parseInt(v7), v15, v8, v9, giaBia, khuyenMai, giaBan, 0, v14);
                        int i = c_SACH.suaSach(s);
                        out.println(i);
                        break;
                    }
                    case "timTheoMa": {
                        String ma = request.getParameter("ma");
                        int maSach = Integer.parseInt(ma);
                        m_SACH s = c_SACH.timSachTheoMa(maSach);
                        Gson gson = new Gson();
                        String sach = gson.toJson(s);
                        out.print(sach);
                        break;
                    }
                    case "timKiemSach": {
                        List<m_SACH> list = new ArrayList<m_SACH>();
                        list = c_SACH.timKiem("");
                        Gson gson = new Gson();
                        String ls = gson.toJson(list);
                        out.print(ls);
                        break;
                    }
                    case "xoaSach": {
                        String ma = request.getParameter("ma");
                        int i = c_SACH.xoaSach(Integer.parseInt(ma));
                        out.print(i);
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
