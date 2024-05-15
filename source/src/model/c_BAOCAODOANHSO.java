package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

//import com.mysql.jdbc.PreparedStatement;
import java.sql.PreparedStatement;
public class c_BAOCAODOANHSO {

    public void themBAOCAODOANHSO(m_BAOCAODOANHSO bc) {
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "insert into BAOCAODOANHSO (Thang,Nam,TongDoanhThu,SLB) values (?,?,?,?)";
                PreparedStatement ps;
                try {
                    ps = (PreparedStatement) con.prepareStatement(sql);
                    ps.setInt(1, bc.getThang());
                    ps.setInt(2, bc.getNam());
                    ps.setInt(3, bc.getTongDoanhThu());
                    ps.setInt(4, bc.getSLB());
                    int executeUpdate = ps.executeUpdate();
                } catch (Exception o) {
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<m_BAOCAODOANHSO> getlist() throws Exception {
        List<m_BAOCAODOANHSO> list = new ArrayList<m_BAOCAODOANHSO>();
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "select * from BAOCAODOANHSO";
                PreparedStatement ps;
                ps = (PreparedStatement) con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    int thang = rs.getInt("Thang");
                    int nam = rs.getInt("Nam");
                    int tdt = rs.getInt("TongDoanhThu");
                    int sl = rs.getInt("SLB");

                    list.add(new m_BAOCAODOANHSO(thang, nam, tdt, sl));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

   /* public static void main(String[] args) {
        c_BAOCAODOANHSO d = new c_BAOCAODOANHSO();
        List<m_BAOCAODOANHSO> l = new ArrayList<m_BAOCAODOANHSO>();
        try {
            l = d.getlist();
        } catch (Exception e) {
            e.printStackTrace();
        }
        for (m_BAOCAODOANHSO s : l) {
            System.out.println(s.getNam());
        }
    }
    */
}
