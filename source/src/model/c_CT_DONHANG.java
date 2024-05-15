package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class c_CT_DONHANG {
    
    public static int themCT_DONHANG(m_CT_DONHANG bc) {
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "insert into CT_DONHANG (SoDH,MaSach,SoLuong,DonGiaBan,ThanhTien) values (?,?,?,?,?)";
                PreparedStatement ps;
                try {
                    ps = (PreparedStatement) con.prepareStatement(sql);
                    ps.setInt(1, bc.getSoDH());
                    ps.setInt(2, bc.getMaSach());
                    ps.setInt(3, bc.getSoLuong());
                    ps.setDouble(4, bc.getDonGiaBan());
                    ps.setDouble(5, bc.getThanhTien());
                    return ps.executeUpdate();
                } catch (Exception o) {
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    public static int xoaCT_DONHANG(int ma) {
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "delete FROM CT_DONHANG where SoDH='"+ma+"'";
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

    public static List<m_CT_DONHANG> getlist(){
        List<m_CT_DONHANG> list = new ArrayList<m_CT_DONHANG>();
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "select * from CT_DONHANG";
                PreparedStatement ps;
                ps = (PreparedStatement) con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    int SoDH = rs.getInt("SoDH");
                    int MaSach= rs.getInt("MaSach");
                    int SL = rs.getInt("SoLuong");
                    double DonGia = rs.getDouble("DonGiaBan");
                    double ThanhTien = rs.getDouble("ThanhTien");
                       String tenSach = c_SACH.timTenSachThemMa(MaSach);
                   
                    list.add(new m_CT_DONHANG(SoDH, MaSach,tenSach, SL, DonGia, ThanhTien));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public static List<m_CT_DONHANG> dsCT_HoaDon(int ma){
        List<m_CT_DONHANG> list = new ArrayList<m_CT_DONHANG>();
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "select * from CT_DONHANG where SoDH ='"+ma+"'";
                PreparedStatement ps;
                ps = (PreparedStatement) con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    int SoDH = rs.getInt("SoDH");
                    int MaSach= rs.getInt("MaSach");
                    int SL = rs.getInt("SoLuong");
                    String tenSach = c_SACH.timTenSachThemMa(MaSach);
                    double DonGia = rs.getDouble("DonGiaBan");
                    double ThanhTien = rs.getDouble("ThanhTien");
                   
                    list.add(new m_CT_DONHANG(SoDH, MaSach,tenSach, SL, DonGia, ThanhTien));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
