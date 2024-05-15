package model;



import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

//import com.mysql.jdbc.PreparedStatement;
import java.sql.PreparedStatement;
public class c_THELOAI {
   
    public static int themTHELOAI(m_THELOAI tg) {
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "insert into THELOAI(TenTheLoai) value (?)";
                PreparedStatement ps;
                try {
                    ps = (PreparedStatement) con.prepareStatement(sql);
                    ps.setString(1, tg.getTenTheLoai());
                    int executeUpdate = ps.executeUpdate();
                    return executeUpdate ;
                } catch (Exception o) {
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static String timTenTHELOAI(int ma) throws Exception {
        List<m_THELOAI> list = new ArrayList<m_THELOAI>();
        String tenTHELOAI = "";
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "select * from THELOAI where MaTheLoai =' " + ma + "'";
                PreparedStatement ps;
                ps = (PreparedStatement) con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    tenTHELOAI = rs.getString("TenTheLoai");
                }
                return tenTHELOAI;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tenTHELOAI;
    }

    public static int timMaTHELOAI(String ten) throws Exception {
        List<m_THELOAI> list = new ArrayList<m_THELOAI>();
        int maTHELOAI = -1;
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "select * from THELOAI where TenTheLoai ='" + ten + "'";
                PreparedStatement ps;
                ps = (PreparedStatement) con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    maTHELOAI = rs.getInt("MaTheLoai");
                }
                return maTHELOAI;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return maTHELOAI;
    }

    public static int xoaTHELOAI(int ma) {
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "delete from THELOAI where MaTheLoai='" + ma + "'";
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

    public static int suaTHELOAI(int ma, String ten) {
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "UPDATE THELOAI set TenTheLoai='" + ten + "' where MaTheLoai='" + ma + "'";
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

    public static List<m_THELOAI> getlist() throws Exception {
        List<m_THELOAI> list = new ArrayList<m_THELOAI>();
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "select * from THELOAI";
                PreparedStatement ps;
                ps = (PreparedStatement) con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    int MaTheLoai = rs.getInt("MaTheLoai");
                    String TenTheLoai = rs.getString("TenTheLoai");
                    list.add(new m_THELOAI(MaTheLoai, TenTheLoai));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static int getSoLuongSachCuaTheLoai(int maTheLoai) {
        int soLuong = 0;
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "select * from SACH where MaTheLoai = '" + maTheLoai + "'";
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
