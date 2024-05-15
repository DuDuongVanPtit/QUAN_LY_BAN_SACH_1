package model;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

    public class Connect {

        protected static Connection getConnect() throws Exception {
            Connection connect = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/quanlybansach?useSSL=false", "root", "12345");
            } catch (ClassNotFoundException | SQLException e) {
                // Xử lý ngoại lệ nếu cần
                e.printStackTrace();
            }
            return connect;
        }
    public static void main(String[] args) throws Exception
    {
        String query="select * from SACH";
        System.out.println("Ma sach");
        PreparedStatement ps;
                ps = (PreparedStatement) getConnect().prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int MaSach = rs.getInt("MaSach");
                    int MaTheLoai = rs.getInt("MaTheLoai");
                    String TenSach = rs.getString("TenSach");
                    int MaNXB = rs.getInt("MaNXB");
                    System.out.println("Ma sach" + MaSach + "-"+ TenSach);
                }
    }
}
