package model;

public class m_CT_DONHANG {
	private int SoDH;
	private int MaSach;
	private int SoLuong;
	private double DonGiaBan;
	private double ThanhTien;
        private String TenSach;
        
	public m_CT_DONHANG(int soDH, int maSach, String tenSach, int soLuong, double donGiaBan, double thanhTien) {
		SoDH = soDH;
		MaSach = maSach;
		SoLuong = soLuong;
		DonGiaBan = donGiaBan;
		ThanhTien = thanhTien;
                TenSach = tenSach;
	}
        public m_CT_DONHANG(int soDH, int maSach,  int soLuong, double donGiaBan, double thanhTien) {
		SoDH = soDH;
		MaSach = maSach;
		SoLuong = soLuong;
		DonGiaBan = donGiaBan;
		ThanhTien = thanhTien;
	}
	public m_CT_DONHANG() {
	}
        public String getTenSach() {
		return TenSach;
	}
        public void setTenSach(String tenSach) {
		TenSach = tenSach;
	}
        
	public int getSoDH() {
		return SoDH;
	}
	public void setSoDH(int soDH) {
		SoDH = soDH;
	}
	public int getMaSach() {
		return MaSach;
	}
	public void setMaSach(int maSach) {
		MaSach = maSach;
	}
	public int getSoLuong() {
		return SoLuong;
	}
	public void setSoLuong(int soLuong) {
		SoLuong = soLuong;
	}
	public double getDonGiaBan() {
		return DonGiaBan;
	}
	public void setDonGiaBan(double donGiaBan) {
		DonGiaBan = donGiaBan;
	}
	public double getThanhTien() {
		return ThanhTien;
	}
	public void setThanhTien(double thanhTien) {
		ThanhTien = thanhTien;
	}
}
