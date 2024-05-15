package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

//import com.mysql.jdbc.PreparedStatement;
import java.sql.PreparedStatement;

public class c_TACGIA {
    
    public static int themTACGIA(m_TACGIA tg) {
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "insert into TACGIA(TenTacGia) values (?)";
                PreparedStatement ps;
                try {
                    ps = (PreparedStatement) con.prepareStatement(sql);
                    ps.setString(1, tg.getTenTacGia());
                    int i = ps.executeUpdate();
                    return i;
                } catch (Exception o) {
                }
            }        } catch (Exception e) {
            e.printStackTrace();
          
        }
        return 0;
    }

    public static List<m_TACGIA> getlist(){
        List<m_TACGIA> list = new ArrayList<m_TACGIA>();
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "select * from TACGIA";
                PreparedStatement ps;
                ps = (PreparedStatement) con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                
                while (rs.next()) {
                    int MaTacGia = rs.getInt("MaTacGia");
                    String TenTacGia = rs.getString("TenTacGia");
                    list.add(new m_TACGIA(MaTacGia, TenTacGia));
                }
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static String getTenTacGia(int maTacGia) {
        String tenTacGia = "";
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "select * from TACGIA where MaTacGia = '" + maTacGia + "'";
                PreparedStatement ps = (PreparedStatement) con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    tenTacGia = rs.getString("TenTacGia");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tenTacGia;
    }

    public static int timMaTACGIA(String ten) throws Exception {
        List<m_TACGIA> list = new ArrayList<m_TACGIA>();
        int maTHELOAI = -1;
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "select * from TACGIA where TenTacGia ='" + ten + "'";
                PreparedStatement ps;
                ps = (PreparedStatement) con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    maTHELOAI = rs.getInt("MaTacGia");
                }
                return maTHELOAI;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return maTHELOAI;
    }

    public static int xoaTACGIA(int ma) {
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "delete from TACGIA where MaTacGia='" + ma + "'";
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

    public static int suaTACGIA(int ma, String ten) {
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "UPDATE TACGIA set TenTacGia='" + ten + "' where MaTacGia='" + ma + "'";
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
    
    public static int getSoLuongSachCuaTG(int maTacGia) {
        int soLuong = 0;
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "select * from SACH where MaTacGia = '" + maTacGia + "'";
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
