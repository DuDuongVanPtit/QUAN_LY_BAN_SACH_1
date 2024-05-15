package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

//import com.mysql.jdbc.PreparedStatement;
import java.sql.PreparedStatement;

public class c_NXB {

    public static int themNXB(m_NXB tg) {
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "insert into NHAXUATBAN(TenNXB) values (?)";
                PreparedStatement ps;
                try {
                    ps = (PreparedStatement) con.prepareStatement(sql);
                    ps.setString(1, tg.getTenNXB());
                    return ps.executeUpdate();

                } catch (Exception o) {
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static String timTenNXB(int ma) throws Exception {
        List<m_NXB> list = new ArrayList<m_NXB>();
        String tenNXB = "";
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "select * from NHAXUATBAN where MaNXB =' " + ma + "'";
                PreparedStatement ps;
                ps = (PreparedStatement) con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    tenNXB = rs.getString("TenNXB");
                }
                return tenNXB;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tenNXB;
    }

    public static int timMaNXB(String ten) throws Exception {
        List<m_NXB> list = new ArrayList<m_NXB>();
        int maNXB = -1;
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "select * from NHAXUATBAN where tenNXB ='" + ten +"'";
                PreparedStatement ps;
                ps = (PreparedStatement) con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    maNXB = rs.getInt("MaNXB");
                }
                return maNXB;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return maNXB;
    }

    public static int xoaNXB(int ma) {
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "delete from NHAXUATBAN where MaNXB='" + ma + "'";
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

    public static int suaNXB(int ma, String ten) {
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "UPDATE NHAXUATBAN set TenNXB='" + ten + "' where MaNXB='" + ma + "'";
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

    public static List<m_NXB> getlist(int n1, int n2) throws Exception {
        List<m_NXB> list = new ArrayList<m_NXB>();
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "select * from NHAXUATBAN limit " + n1 + "," + n2;
                PreparedStatement ps;
                ps = (PreparedStatement) con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    int MaNXB = rs.getInt("MaNXB");
                    String TenNXB = rs.getString("TenNXB");
                    list.add(new m_NXB(MaNXB, TenNXB));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<m_NXB> getlist() {
        List<m_NXB> list = new ArrayList<m_NXB>();
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "select * from NHAXUATBAN ";
                PreparedStatement ps;
                ps = (PreparedStatement) con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    int MaNXB = rs.getInt("MaNXB");
                    String TenNXB = rs.getString("TenNXB");
                    list.add(new m_NXB(MaNXB, TenNXB));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static int getSoLuongSachCuaNXB(int maNXB) {
        int soLuong = 0;
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "select * from SACH where MaNXB = '" + maNXB + "'";
                PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    soLuong++;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return soLuong;
    }
}
