package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

//import com.mysql.jdbc.PreparedStatement;
import java.sql.PreparedStatement;
public class c_CT_BAOCAODOANHSO {

        @SuppressWarnings("empty-statement")
	public void themCT_BAOCAODOANHSO(m_CT_BAOCAODOANHSO bc) {
		try {
			try (Connection con = Connect.getConnect()) {
                            String sql = "insert into CT_BAOCAODOANHSO (Thang,Nam,MaSach,SLB,ThanhTien,TyLe) values (?,?,?,?,?,?)";
                            PreparedStatement ps;
                            try {
                                ps = (PreparedStatement) con.prepareStatement(sql);
                                ps.setInt(1,bc.getThang());
                                ps.setInt(2,bc.getNam());
                                ps.setInt(3,bc.getMaSach());
                                ps.setInt(4,bc.getSLB());
                                ps.setDouble(5, bc.getThanhTien());
                                ps.setFloat(6, bc.getTyLe());
                                int executeUpdate = ps.executeUpdate();
                            } catch (Exception o) {
                            }
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<m_CT_BAOCAODOANHSO> getlist() throws Exception {
		List<m_CT_BAOCAODOANHSO> list = new ArrayList<m_CT_BAOCAODOANHSO>();
		try {
                    try (Connection con = Connect.getConnect()) {
                        String sql = "select * from CT_BAOCAODOANHSO";
                        PreparedStatement ps;
                        ps = (PreparedStatement) con.prepareStatement(sql);
                        ResultSet rs = ps.executeQuery();
                        
                        while (rs.next()) {
                            int thang = rs.getInt("Thang");
                            int nam = rs.getInt("Nam");
                            int ms = rs.getInt("MaSach");
                            int sl = rs.getInt("SLB");
                            double tt = rs.getDouble("ThanhTien");
                            float tl = rs.getFloat("TyLe");
                            list.add(new m_CT_BAOCAODOANHSO(thang,nam,ms,sl,tt,tl));
                        }
                    }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
