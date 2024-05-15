
package Controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.c_SACH;
import model.m_SACH;

public class servlet_ChuyenTrang extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String a = request.getParameter("a");
            switch (a) {
                case "TheLoai": {
                    String i = request.getParameter("ii"); //trang
                    String id = request.getParameter("id"); // bandau
                    int ii = Integer.parseInt(i) - 1;
                    int iid = Integer.parseInt(id);
                    
                    List<m_SACH> list = new ArrayList<m_SACH>();
                    list = c_SACH.getlistbyTheLoai(ii, iid);
                    Gson gson = new Gson();
                    String sach = gson.toJson(list);
                    out.print(sach);
                    
                    break;
                }
                case "TacGia": {
                    String i = request.getParameter("ii");
                    String id = request.getParameter("id");
                    int ii = Integer.parseInt(i);
                    int iid = Integer.parseInt(id);
                    List<m_SACH> list = new ArrayList<m_SACH>();
                    list = c_SACH.getlistbyTacGia(ii, iid);
                    Gson gson = new Gson();
                    String sach = gson.toJson(list);
                    out.print(sach);
                    break;
                }
                default:{
                    String i = request.getParameter("ii");
                    String id = request.getParameter("id");
                    int ii = Integer.parseInt(i);
                    int iid = Integer.parseInt(id);
                    List<m_SACH> list = new ArrayList<m_SACH>();
                    list = c_SACH.getlistbyNXB(ii, iid);
                    Gson gson = new Gson();
                    String sach = gson.toJson(list);
                    out.print(sach);
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
