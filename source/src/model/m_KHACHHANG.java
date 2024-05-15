package model;

public class m_KHACHHANG {

    private int MaKH;
    private String TenKH;
    private String DiaChi;
    private String Email;
    private String SDT;
    private String MatKhau;

    public m_KHACHHANG(int maKH, String tenKH, String diaChi, String email, String sDT, String matKhau) {
        MaKH = maKH;
        TenKH = tenKH;
        DiaChi = diaChi;
        Email = email;
        SDT = sDT;
        MatKhau = matKhau;
    }

    public m_KHACHHANG(String tenKH, String diaChi, String email, String sDT, String matKhau) {
        TenKH = tenKH;
        DiaChi = diaChi;
        Email = email;
        SDT = sDT;
        MatKhau = matKhau;
    }

    public m_KHACHHANG() {
    }

    public int getMaKH() {
        return MaKH;
    }

    public void setMaKH(int maKH) {
        MaKH = maKH;
    }

    public String getTenKH() {
        return TenKH;
    }

    public void setTenKH(String tenKH) {
        TenKH = tenKH;
    }

    public String getDiaChi() {
        return DiaChi;
    }

    public void setDiaChi(String diaChi) {
        DiaChi = diaChi;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getSDT() {
        return SDT;
    }

    public void setSDT(String sDT) {
        SDT = sDT;
    }

    public String getMatKhau() {
        return MatKhau;
    }

    public void setMatKhau(String matKhau) {
        MatKhau = matKhau;
    }

}
