package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

//import com.mysql.jdbc.PreparedStatement;
import java.sql.PreparedStatement;
public class c_SACHYEUTHICH {

    public static int themSACHYEUTHICH(m_SACHYEUTHICH bc) {
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "insert into SACHYEUTHICH (MaSach,MaKH) values (?,?)";
                PreparedStatement ps;
                try {
                    ps = (PreparedStatement) con.prepareStatement(sql);
                    ps.setInt(1, bc.getMaSach());
                    ps.setInt(2, bc.getMaKH());
                    return ps.executeUpdate();
                } catch (Exception o) {
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static List<m_SACHYEUTHICH> getlistIDSACH(int maSach){
        List<m_SACHYEUTHICH> list = new ArrayList<m_SACHYEUTHICH>();
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "select * from SACHYEUTHICH where maSach="+maSach;
                PreparedStatement ps;
                ps = (PreparedStatement) con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    int MaSach = rs.getInt("MaSach");
                    int MaKH = rs.getInt("MaKH");
                    list.add(new m_SACHYEUTHICH(MaSach, MaKH));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public static List<m_SACHYEUTHICH> getlistIDKH(int makh){
        List<m_SACHYEUTHICH> list = new ArrayList<m_SACHYEUTHICH>();
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "select * from SACHYEUTHICH where maKH="+makh;
                PreparedStatement ps;
                ps = (PreparedStatement) con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    int MaSach = rs.getInt("MaSach");
                    int MaKH = rs.getInt("MaKH");
                    list.add(new m_SACHYEUTHICH(MaSach, MaKH));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

      public static int soSachYeuThich(int maKH) {
       int i = 0;
        List<m_KHACHHANG> list = new ArrayList<m_KHACHHANG>();
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "select COUNT(MaSach) as co from SACHYEUTHICH where MaKH='"+ maKH + "' group by MaKH ";
                PreparedStatement ps;
                ps = (PreparedStatement) con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    i = rs.getInt("co");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }
}
