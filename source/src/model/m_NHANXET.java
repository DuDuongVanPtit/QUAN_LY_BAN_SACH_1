package model;

public class m_NHANXET {
	private int MaNS;
	private int MaSach;
	private int MaKH;
	private int Diem;
	private String NoiDung;
        private String Ten;
        private String Email;
	public m_NHANXET(int maNS, int maSach, int maKH, int diem, String noiDung,String email,String ten) {
		MaNS = maNS;
		MaSach = maSach;
		MaKH = maKH;
		Diem = diem;
		NoiDung = noiDung;
                Ten = ten;
                Email = email;
	}
	public m_NHANXET(int maSach, int maKH, int diem, String noiDung,String email,String ten) {
		MaSach = maSach;
		MaKH = maKH;
		Diem = diem;
		NoiDung = noiDung;
                Ten = ten;
                Email = email;
	}
	public m_NHANXET() {
	}
	public int getMaNS() {
		return MaNS;
	}
	public void setMaNS(int maNS) {
		MaNS = maNS;
	}
	public int getMaSach() {
		return MaSach;
	}
	public void setMaSach(int maSach) {
		MaSach = maSach;
	}
	public int getMaKH() {
		return MaKH;
	}
	public void setMaKH(int maKH) {
		MaKH = maKH;
	}
	public int getDiem() {
		return Diem;
	}
	public void setDiem(int diem) {
		Diem = diem;
	}
	public String getNoiDung() {
		return NoiDung;
	}
        public String getTen() {
		return Ten;
	}
        public String getEmail() {
		return Email;
	}
	public void setNoiDung(String noiDung) {
		NoiDung = noiDung;
	}
	
	

}
