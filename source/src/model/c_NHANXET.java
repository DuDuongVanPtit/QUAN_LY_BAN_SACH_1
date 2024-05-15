package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

//import com.mysql.jdbc.PreparedStatement;
import java.sql.PreparedStatement;

public class c_NHANXET {

    public static int themNHANXET(m_NHANXET bc) {
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "insert into NHANXET (MaSach,MaKH,Diem,NoiDung,Ten,Email) values (?,?,?,?,?,?)";
                PreparedStatement ps;
                try {
                    ps = (PreparedStatement) con.prepareStatement(sql);
                    ps.setInt(1, bc.getMaSach());
                    ps.setInt(2, bc.getMaKH());
                    ps.setInt(3, bc.getDiem());
                    ps.setString(4, bc.getNoiDung());
                    ps.setString(5, bc.getTen());
                    ps.setString(6, bc.getEmail());
                    return ps.executeUpdate();
                } catch (Exception o) {
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static List<m_NHANXET> getlist() {
        List<m_NHANXET> list = new ArrayList<m_NHANXET>();
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "select * from NHANXET";
                PreparedStatement ps;
                ps = (PreparedStatement) con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    int MaNS = rs.getInt("MaNS");
                    int MaSach = rs.getInt("MaSach");
                    int MaKH = rs.getInt("MaKH");
                    int Diem = rs.getInt("Diem");
                    String NoiDung = rs.getString("NoiDung");
                    String Email = rs.getString("Email");
                    String Ten = rs.getString("Ten");
                    list.add(new m_NHANXET(MaNS, MaSach, MaKH, Diem, NoiDung, Email, Ten));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<m_NHANXET> getlistmoinhat(int i) {
        List<m_NHANXET> list = new ArrayList<m_NHANXET>();
        try {
            try (Connection con = Connect.getConnect()) {
//                String sql = "select * from NHANXET ORDER BY MaNS DESC LIMIT 10 offset " + i * 10;
                String sql = "SELECT TOP " + (10 * (i + 1)) + " * FROM NHANXET ORDER BY MaNS DESC";
                PreparedStatement ps;
                ps = (PreparedStatement) con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    int MaNS = rs.getInt("MaNS");
                    int MaSach = rs.getInt("MaSach");
                    int MaKH = rs.getInt("MaKH");
                    int Diem = rs.getInt("Diem");
                    String NoiDung = rs.getString("NoiDung");
                    String Email = rs.getString("Email");
                    String Ten = rs.getString("Ten");
                    list.add(new m_NHANXET(MaNS, MaSach, MaKH, Diem, NoiDung, Email, Ten));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
      
    public static List<m_NHANXET> getlist(int maSach) {
        List<m_NHANXET> list = new ArrayList<m_NHANXET>();
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "select * from NHANXET where MaSach='" + maSach + "'";
                PreparedStatement ps;
                ps = (PreparedStatement) con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    int MaNS = rs.getInt("MaNS");
                    int MaSach = rs.getInt("MaSach");
                    int MaKH = rs.getInt("MaKH");
                    int Diem = rs.getInt("Diem");
                    String NoiDung = rs.getString("NoiDung");
                    String Email = rs.getString("Email");
                    String Ten = rs.getString("Ten");
                    list.add(new m_NHANXET(MaNS, MaSach, MaKH, Diem, NoiDung, Email, Ten));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public static int soNhanXet(int maSach) {
        int i = 0;
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "select * from NHANXET where MaSach='" + maSach + "'";
                PreparedStatement ps;
                ps = (PreparedStatement) con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    i++;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    public static int xoaNhanXet(int maNX) {
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "delete from NHANXET where MaNS='" + maNX + "'";
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
    
    public static int diemTong(int maSach) {
        int diem = 0;
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "SELECT Sum(Diem) as 'diem' FROM NHANXET where MaSach=" + maSach; 
                PreparedStatement ps;
                ps = (PreparedStatement) con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    diem = rs.getInt("diem"); 
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return diem;
    }
    
    
}
