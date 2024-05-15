package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

//import com.mysql.jdbc.PreparedStatement;
import java.sql.PreparedStatement;

public class c_THANHTOAN {

    public static int themTHANHTOAN(m_THANHTOAN tg) {
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "insert into THANHTOAN(KieuTT) values (?)";
                PreparedStatement ps;
                try {
                    ps = (PreparedStatement) con.prepareStatement(sql);
                    ps.setString(1, tg.getKieuTT());
                    return ps.executeUpdate();
                } catch (Exception o) {
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
   
    public static String timTenTHANHTOAN(int ma){
        List<m_THANHTOAN> list = new ArrayList<m_THANHTOAN>();
        String tenTHANHTOAN = "";
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "select * from THANHTOAN where MaTT =' " + ma + "'";
                PreparedStatement ps;
                ps = (PreparedStatement) con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    tenTHANHTOAN = rs.getString("KieuTT");
                }
                return tenTHANHTOAN;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tenTHANHTOAN;
    }

    public static int timMaTHANHTOAN(String ten){
        List<m_THANHTOAN> list = new ArrayList<m_THANHTOAN>();
        int maTHANHTOAN = -1;
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "select * from THANHTOAN where KieuTT ='" + ten + "'";
                PreparedStatement ps;
                ps = (PreparedStatement) con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    maTHANHTOAN = rs.getInt("MaTT");
                }
                return maTHANHTOAN;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return maTHANHTOAN;
    }

    public static int xoaTHANHTOAN(int ma) {
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "delete from THANHTOAN where MaTT='" + ma + "'";
                PreparedStatement ps;
                try {
                    ps = (PreparedStatement) con.prepareStatement(sql);
                    return ps.executeUpdate();
                } catch (Exception o) {
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static int suaTHANHTOAN(int ma, String ten) {
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "UPDATE THANHTOAN set KieuTT='" + ten + "' where MaTT='" + ma + "'";
                PreparedStatement ps;
                try {
                    ps = (PreparedStatement) con.prepareStatement(sql);
                    return ps.executeUpdate();
                } catch (Exception o) {
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    public static List<m_THANHTOAN> getlist() throws Exception {
        List<m_THANHTOAN> list = new ArrayList<m_THANHTOAN>();
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "select * from THANHTOAN";
                PreparedStatement ps;
                ps = (PreparedStatement) con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                
                while (rs.next()) {
                    int MaTt = rs.getInt("MaTT");
                    String KieuTT = rs.getString("KieuTT");
                    list.add(new m_THANHTOAN(MaTt, KieuTT));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
