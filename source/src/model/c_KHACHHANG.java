package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

//import com.mysql.jdbc.PreparedStatement;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class c_KHACHHANG {
    public static int themKHACHHANG(m_KHACHHANG bc) {
        try {
            try (Connection con = Connect.getConnect()) {

                String sql = "insert into KHACHHANG (TenKH, DiaChi, Email, SDT, MatKhau) "
                        + "values ('" + 
                        bc.getTenKH() + "', '" + 
                        bc.getDiaChi() + "', '" + 
                        bc.getEmail() + "', '" + 
                        bc.getSDT() + "', '" + 
                        bc.getMatKhau() + "')";

                Statement stmt = con.createStatement();
                return stmt.executeUpdate(sql);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static void main(String[] args) {
    try {
        try (Connection con = Connect.getConnect()) {
            Statement stmt = con.createStatement();
            
            String sql = "insert into KHACHHANG (TenKH, DiaChi, Email, SDT, MatKhau) values ('777', '9', '7', '3', '8');" +
                         "update khachhang set matkhau = '77777' where makh > 0";
//            String sql = "update khachhang set matkhau = '77777' where makh > 0";
            // Thực thi nhiều câu lệnh SQL trong một lần execute
            stmt.executeLargeUpdate(sql);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
}

    
    public static List<m_KHACHHANG> getlist(int i){
        List<m_KHACHHANG> list = new ArrayList<m_KHACHHANG>();
      
        try {
            try (Connection con = Connect.getConnect()) {
//                String sql = "select * from KHACHHANG ORDER BY MaKH DESC LIMIT 10 offset " + i * 10;
                String sql = "SELECT * FROM KHACHHANG ORDER BY MaKH DESC OFFSET " + (i * 10) + " ROWS FETCH NEXT 10 ROWS ONLY";

                PreparedStatement ps;
                ps = (PreparedStatement) con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    int MaKH = rs.getInt("MaKH");
                    String TenKH = rs.getString("TenKH");
                    String DiaChi = rs.getString("DiaChi");
                    String Email = rs.getString("Email");
                    String SDT = rs.getString("SDT");
                    String MatKhau = rs.getString("MatKhau");
                    list.add(new m_KHACHHANG(MaKH, TenKH, DiaChi, Email, SDT, MatKhau));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public static int DangNhap(String email, String pass) {
        int i = 0;
        try (Connection con = Connect.getConnect()) {
            String sql = "SELECT * FROM KHACHHANG WHERE Email ='" + email + "' AND MatKhau = '" + pass + "'";

            try (Statement statement = con.createStatement();
                 ResultSet rs = statement.executeQuery(sql)) {

                while (rs.next()) {
                    i = 1;
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }
//      --------------PHÒNG THỦ PREPARESTATEMENT------
//    public static int DangNhap(String email, String pass) {
//        int i = 0;
//        try (Connection con = Connect.getConnect()) {
//            String sql = "SELECT * FROM KHACHHANG WHERE Email = ? AND MatKhau = ?";
//
//            try (PreparedStatement ps = con.prepareStatement(sql)) {
//                ps.setString(1, email);
//                ps.setString(2, pass);
//
//                try (ResultSet rs = ps.executeQuery()) {
//                    while (rs.next()) {
//                        i = 1;
//                    }
//                } catch (SQLException e) {
//                    e.printStackTrace();
//                }
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return i;
//    }

    public static int KiemTra(String email) {
        int i = 0;
        List<m_KHACHHANG> list = new ArrayList<m_KHACHHANG>();
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "select * from KHACHHANG where Email ='" + email + "'";
                PreparedStatement ps;
                ps = (PreparedStatement) con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    i = 1;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    public static m_KHACHHANG kh_email(String email) {
        List<m_KHACHHANG> list = new ArrayList<m_KHACHHANG>();
        m_KHACHHANG a = new m_KHACHHANG();
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "select * from KHACHHANG where Email ='" + email + "'";
                PreparedStatement ps;
                ps = (PreparedStatement) con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    a.setDiaChi(rs.getString("DiaChi"));
                    a.setEmail(rs.getString("Email"));
                    a.setMaKH(rs.getInt("MaKH"));
                    a.setMatKhau(rs.getString("MatKhau"));
                    a.setSDT(rs.getString("SDT"));
                    a.setTenKH(rs.getString("TenKH"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return a;
    }
    
      public static int suaKHACHHANG(m_KHACHHANG m) {
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "UPDATE KHACHHANG SET TenKH='"+ m.getTenKH() +"' , DiaChi='"+ m.getDiaChi() +"', SDT='"+ m.getSDT() + "', MatKhau='"+ m.getMatKhau()+"', Email ='" + m.getEmail() +"'where MaKH=" + m.getMaKH();
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
      
       public static int xoaKHACHHANG(int ma) {
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "delete from KHACHHANG where MaKH='" + ma + "'";
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
}

