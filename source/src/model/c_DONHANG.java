package model;

//import com.mysql.jdbc.PreparedStatement;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class c_DONHANG {
    public static int themDONHANG(m_DONHANG bc) {
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "insert into DONHANG (NgHD,MaKH,TenNN,SDTNN,DiaChiNN,GhiChu,TongTien,MaTT,TrangThaiTT,TrangThaiGiaoHang) values (?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement ps;
                try {
                    ps = (PreparedStatement) con.prepareStatement(sql);
                    ps.setString(1, bc.getNgHD());
                    ps.setInt(2, bc.getMaKH());
                    ps.setString(3, bc.getTenNN());
                    ps.setString(4, bc.getSDTNN());
                    ps.setString(5, bc.getDiaChiNN());
                    ps.setString(6, bc.getGhiChu());
                    ps.setDouble(7, bc.getTongTien());
                    ps.setInt(8, bc.getMaTT());
                    ps.setInt(9, bc.getTrangThaiTT());
                    ps.setInt(10, bc.getTrangThaiGiaoHang());
                    return ps.executeUpdate();
                } catch (Exception o) {
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static List<m_DONHANG> getlist(int i){
        List<m_DONHANG> list = new ArrayList<m_DONHANG>();
        try {
            try (Connection con = Connect.getConnect()) {
//                String sql = "SELECT * FROM DONHANG ORDER BY SoDH DESC LIMIT 5 offset " + i*5;
//                String sql = "SELECT TOP 5 * FROM DONHANG ORDER BY SoDH DESC OFFSET " + ((i +1) * 5);
                String sql = "SELECT TOP " + (5 * (i + 1)) + " * FROM DONHANG ORDER BY SoDH DESC";
                PreparedStatement ps;
                ps = (PreparedStatement) con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    int SoDH = rs.getInt("SoDH");
                    String NgHD = rs.getString("NgHD");
                    int MaKH = rs.getInt("MaKH");
                    String TenNN = rs.getString("TenNN");
                    String SDTNN = rs.getString("SDTNN");
                    String DiaChiNN = rs.getString("DiaChiNN");
                    String GhiChu = rs.getString("GhiChu");
                    double TongTien = rs.getDouble("TongTien");
                    int MaTT = rs.getInt("MaTT");
                    int TrangThaiTT = rs.getInt("TrangThaiTT");
                    int TrangThaiGiaoHang = rs.getInt("TrangThaiGiaoHang");
                    list.add(new m_DONHANG(SoDH, NgHD, MaKH, TenNN, SDTNN, DiaChiNN, GhiChu, TongTien, MaTT, TrangThaiTT, TrangThaiGiaoHang));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
     public static int xoaDONHANG(int ma) {
         c_CT_DONHANG.xoaCT_DONHANG(ma);
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "delete FROM DONHANG where SoDH='"+ma+"'";
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
     
    public static int maCuoi(){
        int SoDH = -1;
        Connection con;
        try {
            con = Connect.getConnect();
//             String sql = "SELECT SoDH FROM DONHANG ORDER BY SoDH DESC LIMIT 1";
            String sql = "SELECT TOP 1 SoDH FROM DONHANG ORDER BY SoDH DESC";

            PreparedStatement ps;
            ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                SoDH = rs.getInt("SoDH");
            }
        } catch (Exception ex) {
            Logger.getLogger(c_DONHANG.class.getName()).log(Level.SEVERE, null, ex);
        }
        return SoDH;
    }
    
    public static List<m_DONHANG> newList(){
        List<m_DONHANG> list = new ArrayList<m_DONHANG>();
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "select * from DONHANG where TrangThaiTT=0 or TrangThaiGiaoHang=0";
                PreparedStatement ps;
                ps = (PreparedStatement) con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    int SoDH = rs.getInt("SoDH");
                    String NgHD = rs.getString("NgHD");
                    int MaKH = rs.getInt("MaKH");
                    String TenNN = rs.getString("TenNN");
                    String SDTNN = rs.getString("SDTNN");
                    String DiaChiNN = rs.getString("DiaChiNN");
                    String GhiChu = rs.getString("GhiChu");
                    double TongTien = rs.getDouble("TongTien");
                    int MaTT = rs.getInt("MaTT");
                    int TrangThaiTT = rs.getInt("TrangThaiTT");
                    int TrangThaiGiaoHang = rs.getInt("TrangThaiGiaoHang");
                    list.add(new m_DONHANG(SoDH, NgHD, MaKH, TenNN, SDTNN, DiaChiNN, GhiChu, TongTien, MaTT, TrangThaiTT, TrangThaiGiaoHang));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
     
    public static List<m_DONHANG> dsDonHang_maKH(int i){
        List<m_DONHANG> list = new ArrayList<m_DONHANG>();
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "SELECT * FROM DONHANG where MaKH ="+i;
                PreparedStatement ps;
                ps = (PreparedStatement) con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    int SoDH = rs.getInt("SoDH");
                    String NgHD = rs.getString("NgHD");
                    int MaKH = rs.getInt("MaKH");
                    String TenNN = rs.getString("TenNN");
                    String SDTNN = rs.getString("SDTNN");
                    String DiaChiNN = rs.getString("DiaChiNN");
                    String GhiChu = rs.getString("GhiChu");
                    double TongTien = rs.getDouble("TongTien");
                    int MaTT = rs.getInt("MaTT");
                    int TrangThaiTT = rs.getInt("TrangThaiTT");
                    int TrangThaiGiaoHang = rs.getInt("TrangThaiGiaoHang");
                    list.add(new m_DONHANG(SoDH, NgHD, MaKH, TenNN, SDTNN, DiaChiNN, GhiChu, TongTien, MaTT, TrangThaiTT, TrangThaiGiaoHang));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public static m_DONHANG hoadon_ma(int i){
        m_DONHANG m = new m_DONHANG();
        try {
            try (Connection con = Connect.getConnect()) {
                String sql = "SELECT * FROM DONHANG where SoDH ="+i;
                PreparedStatement ps;
                ps = (PreparedStatement) con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    int SoDH = rs.getInt("SoDH");
                    String NgHD = rs.getString("NgHD");
                    int MaKH = rs.getInt("MaKH");
                    String TenNN = rs.getString("TenNN");
                    String SDTNN = rs.getString("SDTNN");
                    String DiaChiNN = rs.getString("DiaChiNN");
                    String GhiChu = rs.getString("GhiChu");
                    double TongTien = rs.getDouble("TongTien");
                    int MaTT = rs.getInt("MaTT");
                    int TrangThaiTT = rs.getInt("TrangThaiTT");
                    int TrangThaiGiaoHang = rs.getInt("TrangThaiGiaoHang");
                    m = new m_DONHANG(SoDH, NgHD, MaKH, TenNN, SDTNN, DiaChiNN, GhiChu, TongTien, MaTT, TrangThaiTT, TrangThaiGiaoHang);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return m;
    }
    
     public static int suaDONHANG(m_DONHANG m) {
         int i = 10;
        try {
            try (Connection con = Connect.getConnect()) {
                String sql =  "UPDATE DONHANG SET TenNN='" + m.getTenNN() +"',SDTNN='"+m.getSDTNN()+"',DiaChiNN ='"+m.getDiaChiNN()+"',GhiChu='"+m.getGhiChu()+"',MaTT='"+m.getMaTT()+"',TrangThaiTT='"+m.getTrangThaiTT()+"',TrangThaiGiaoHang='"+m.getTrangThaiGiaoHang()+"' WHERE SoDH='"+m.getSoDH()+"'"; 
                PreparedStatement ps;
                try {
                    ps = (PreparedStatement) con.prepareStatement(sql);
                    i = ps.executeUpdate();
                } catch (Exception o) {
                    i = 2;
                }
            }
        } catch (Exception e) {
            i = 3;
            e.printStackTrace();
        }
        return i;
    }
}
