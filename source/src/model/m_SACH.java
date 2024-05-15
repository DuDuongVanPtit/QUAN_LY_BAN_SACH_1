package model;

public class m_SACH {
	private int MaSach;
	private int MaTheLoai;
	private String TenSach;
	private int MaNXB;
	private int MaTacGia;
	private int NamXuatBan;
	private int SoLuongTon;
	private int SoTrang;
	private String KhoiLuong;
	private String NgonNgu;
	private String TomTat;
	private int GiaBia;
	private int KhuyenMai;
	private int GiaBan;
	private int Diem;
	private String LinkAnh;
	
	public m_SACH(int maTheLoai, String tenSach, int maNXB, int maTacGia, int namXuatBan, int soLuongTon,
			int soTrang, String khoiLuong, String ngonNgu, String tomTat, int giaBia, int khuyenMai, int giaBan,
			int diem, String linkAnh) {
		MaTheLoai = maTheLoai;
		TenSach = tenSach;
		MaNXB = maNXB;
		MaTacGia = maTacGia;
		NamXuatBan = namXuatBan;
		SoLuongTon = soLuongTon;
		SoTrang = soTrang;
		KhoiLuong = khoiLuong;
		NgonNgu = ngonNgu;
		TomTat = tomTat;
		GiaBia = giaBia;
		KhuyenMai = khuyenMai;
		GiaBan = giaBan;
		Diem = diem;
		LinkAnh = linkAnh;
	}
       
	public m_SACH(int maSach, int maTheLoai, String tenSach, int maNXB, int maTacGia, int namXuatBan, int soLuongTon,
			int soTrang, String khoiLuong, String ngonNgu, String tomTat, int giaBia, int khuyenMai, int giaBan,
			int diem, String linkAnh) {
		MaSach = maSach;
		MaTheLoai = maTheLoai;
		TenSach = tenSach;
		MaNXB = maNXB;
		MaTacGia = maTacGia;
		NamXuatBan = namXuatBan;
		SoLuongTon = soLuongTon;
		SoTrang = soTrang;
		KhoiLuong = khoiLuong;
		NgonNgu = ngonNgu;
		TomTat = tomTat;
		GiaBia = giaBia;
		KhuyenMai = khuyenMai;
		GiaBan = giaBan;
		Diem = diem;
		LinkAnh = linkAnh;
	}

    public m_SACH() {
    
    }

	public int getMaSach() {
		return MaSach;
	}

	public void setMaSach(int maSach) {
		MaSach = maSach;
	}

	public String getTenSach() {
		return TenSach;
	}

	public void setTenSach(String tenSach) {
		TenSach = tenSach;
	}

	public int getMaTheLoai() {
		return MaTheLoai;
	}

	public void setMaTheLoai(int maTheLoai) {
		MaTheLoai = maTheLoai;
	}

	public int getMaNXB() {
		return MaNXB;
	}

	public void setMaNXB(int maNXB) {
		MaNXB = maNXB;
	}

	public int getMaTacGia() {
		return MaTacGia;
	}

	public void setMaTacGia(int maTacGia) {
		MaTacGia = maTacGia;
	}

	public int getNamXuatBan() {
		return NamXuatBan;
	}

	public void setNamXuatBan(int namXuatBan) {
		NamXuatBan = namXuatBan;
	}

	public int getSoLuongTon() {
		return SoLuongTon;
	}

	public void setSoLuongTon(int soLuongTon) {
		SoLuongTon = soLuongTon;
	}

	public int getSoTrang() {
		return SoTrang;
	}

	public void setSoTrang(int soTrang) {
		SoTrang = soTrang;
	}

	public String getKhoiLuong() {
		return KhoiLuong;
	}

	public void setKhoiLuong(String khoiLuong) {
		KhoiLuong = khoiLuong;
	}

	public String getNgonNgu() {
		return NgonNgu;
	}

	public void setNgonNgu(String ngonNgu) {
		NgonNgu = ngonNgu;
	}

	public String getTomTat() {
		return TomTat;
	}

	public void setTomTat(String tomTat) {
		TomTat = tomTat;
	}

	public int getGiaBia() {
		return GiaBia;
	}

	public void setGiaBia(int giaBia) {
		GiaBia = giaBia;
	}

	public int getKhuyenMai() {
		return KhuyenMai;
	}

	public void setKhuyenMai(int khuyenMai) {
		KhuyenMai = khuyenMai;
	}

	public int getGiaBan() {
		return GiaBan;
	}

	public void setGiaBan(int giaBan) {
		GiaBan = giaBan;
	}

	public int getDiem() {
		return Diem;
	}

	public void setDiem(int diem) {
		Diem = diem;
	}

	public String getLinkAnh() {
		return LinkAnh;
	}

	public void setLinkAnh(String linkAnh) {
		LinkAnh = linkAnh;
	}
	
	
}
