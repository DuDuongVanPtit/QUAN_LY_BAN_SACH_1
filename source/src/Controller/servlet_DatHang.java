package Controller;

import model.c_THANHTOAN;
import model.c_KHACHHANG;
import model.c_DONHANG;
import model.c_CT_DONHANG;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.m_CT_DONHANG;
import model.m_DONHANG;
import model.m_GIOHANG;
import model.m_KHACHHANG;

public class servlet_DatHang extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String n = request.getParameter("n");
            switch (n) {
                case "datHang": {
                    String kh = request.getParameter("kh");
                    String ten = request.getParameter("ten");
                    String sdt = request.getParameter("sdt");
                    String dc = request.getParameter("dc");
                    String gc = request.getParameter("gc");
                    String httt = request.getParameter("httt");
                    String tt = request.getParameter("tt");
                    double tongtien = Double.parseDouble(tt);
                    int maTT = Integer.parseInt(httt);
                    m_KHACHHANG a = c_KHACHHANG.kh_email(kh);
                    Date date = new Date();
                    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
                    String ngay = dateFormat.format(date);
                    HttpSession ss = request.getSession();
                    ArrayList<m_GIOHANG> cart = (ArrayList<m_GIOHANG>) ss.getAttribute("cart");
                    m_DONHANG d = new m_DONHANG(ngay, a.getMaKH(), ten, sdt, dc, gc, tongtien, maTT, 0, 0);
                    int m = c_DONHANG.themDONHANG(d);
                    int SoDH = c_DONHANG.maCuoi();
                    int MaSach;
                    int SoLuong;
                    double DonGiaBan;
                    double ThanhTien;
                    for (m_GIOHANG c : cart) {
                        MaSach = c.getm_SACH().getMaSach();
                        SoLuong = c.getsl();
                        DonGiaBan = c.getm_SACH().getGiaBan();
                        ThanhTien = DonGiaBan * SoLuong;

                        m_CT_DONHANG k = new m_CT_DONHANG(SoDH, MaSach, SoLuong, DonGiaBan, ThanhTien);
                        c_CT_DONHANG.themCT_DONHANG(k);
                    }
                    ss.removeAttribute("cart");
                    servlet_Giohang.clear();
                    int i = c_DONHANG.maCuoi();
                    out.println(i);
                    break;
                }
                case "chiTietHoaDon": {
                    String id = request.getParameter("id");
                    int p = Integer.parseInt(id);
                    List<m_CT_DONHANG> list = new ArrayList<m_CT_DONHANG>();
                    list = c_CT_DONHANG.dsCT_HoaDon(p);
                    Gson gson = new Gson();
                    String ct_donHang = gson.toJson(list);
                    out.print(ct_donHang);
                    break;
                }
                case "timhoadon": {
                    String id = request.getParameter("id");
                    int p = Integer.parseInt(id);
                    m_DONHANG m = c_DONHANG.hoadon_ma(p);
                    Gson gson = new Gson();
                    String donHang = gson.toJson(m);
                    out.print(donHang);
                    break;
                }
                case "sua_hoadon": {
                    String i1 = request.getParameter("i1");
                    String i3 = request.getParameter("i3");
                    String i4 = request.getParameter("i4");
                    String i5 = request.getParameter("i5");
                    String i6 = request.getParameter("i6");
                    String i8 = request.getParameter("i8");
                    String i9 = request.getParameter("i9");
                    String i10 = request.getParameter("i10");
                   
                    m_DONHANG m = new m_DONHANG(Integer.parseInt(i1), "", 0, i3, i4, i5, i6, 0, Integer.parseInt(i8), Integer.parseInt(i9), Integer.parseInt(i10));
                    int i = c_DONHANG.suaDONHANG(m);
                    out.print(i);
                    break;
                }
                case "xoaHoaDon": {
                     String i1 = request.getParameter("i1");
                     int i = c_DONHANG.xoaDONHANG(Integer.parseInt(i1));
                    out.print(i);
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
