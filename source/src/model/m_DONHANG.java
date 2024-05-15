package model;

public class m_DONHANG {
    private int SoDH;
    private String NgHD;
    private int MaKH;
    private String TenNN;
    private String SDTNN;
    private String DiaChiNN;
    private String GhiChu;
    private double TongTien;
    private int MaTT;
    private int TrangThaiTT;
    private int TrangThaiGiaoHang;

    public m_DONHANG(int soDH, String ngHD, int maKH, String tenNN, String sDTNN, String diaChiNN, String ghiChu,
            double tongTien, int maTT, int trangThaiTT, int trangThaiGiaoHang) {
        SoDH = soDH;
        NgHD = ngHD;
        MaKH = maKH;
        TenNN = tenNN;
        SDTNN = sDTNN;
        DiaChiNN = diaChiNN;
        GhiChu = ghiChu;
        TongTien = tongTien;
        MaTT = maTT;
        TrangThaiTT = trangThaiTT;
        TrangThaiGiaoHang = trangThaiGiaoHang;
    }

    public int getSoDH() {
        return SoDH;
    }

    public void setSoDH(int soDH) {
        SoDH = soDH;
    }

    public String getNgHD() {
        return NgHD;
    }

    public void setNgHD(String ngHD) {
        NgHD = ngHD;
    }

    public int getMaKH() {
        return MaKH;
    }

    public void setMaKH(int maKH) {
        MaKH = maKH;
    }

    public String getTenNN() {
        return TenNN;
    }

    public void setTenNN(String tenNN) {
        TenNN = tenNN;
    }

    public String getSDTNN() {
        return SDTNN;
    }

    public void setSDTNN(String sDTNN) {
        SDTNN = sDTNN;
    }

    public String getDiaChiNN() {
        return DiaChiNN;
    }

    public void setDiaChiNN(String diaChiNN) {
        DiaChiNN = diaChiNN;
    }

    public String getGhiChu() {
        return GhiChu;
    }

    public void setGhiChu(String ghiChu) {
        GhiChu = ghiChu;
    }

    public double getTongTien() {
        return TongTien;
    }

    public void setTongTien(double tongTien) {
        TongTien = tongTien;
    }

    public int getMaTT() {
        return MaTT;
    }

    public void setMaTT(int maTT) {
        MaTT = maTT;
    }

    public int getTrangThaiTT() {
        return TrangThaiTT;
    }

    public void setTrangThaiTT(int trangThaiTT) {
        TrangThaiTT = trangThaiTT;
    }

    public int getTrangThaiGiaoHang() {
        return TrangThaiGiaoHang;
    }

    public void setTrangThaiGiaoHang(int trangThaiGiaoHang) {
        TrangThaiGiaoHang = trangThaiGiaoHang;
    }

    public m_DONHANG(String ngHD, int maKH, String tenNN, String sDTNN, String diaChiNN, String ghiChu, double tongTien,
            int maTT, int trangThaiTT, int trangThaiGiaoHang) {
        NgHD = ngHD;
        MaKH = maKH;
        TenNN = tenNN;
        SDTNN = sDTNN;
        DiaChiNN = diaChiNN;
        GhiChu = ghiChu;
        TongTien = tongTien;
        MaTT = maTT;
        TrangThaiTT = trangThaiTT;
        TrangThaiGiaoHang = trangThaiGiaoHang;
    }

    public m_DONHANG() {
    }
}
