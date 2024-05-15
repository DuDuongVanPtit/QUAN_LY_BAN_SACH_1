package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.c_Mail;
import model.m_mail;

public class servlet_mail extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String n = request.getParameter("n");
            try {
                switch (n) {
                    case "guiMail":
                        String emaill = request.getParameter("emaill");
                        String mkk = request.getParameter("mkk");
                        String to = "nhasachkhaitamtphcm@gmail.com";
                        String ojj = request.getParameter("ojj");
                        String textt = request.getParameter("textt");
                        String mi = emaill  + "  _  " + mkk + "   _  "  + ojj;
                        m_mail m = new m_mail("khaitamcontact@gmail.com","wfzpojowcpmyodza",to,mi,textt); 
                        int i = c_Mail.senMail(m);
                        out.println(i);
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
