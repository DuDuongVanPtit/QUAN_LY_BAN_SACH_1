package model;

public class m_THELOAI {
	private int MaTheLoai;
	private String TenTheLoai;
	public m_THELOAI(int maTheLoai, String tenTheLoai) {
		MaTheLoai = maTheLoai;
		TenTheLoai = tenTheLoai;
	}
	public m_THELOAI(String tenTheLoai) {
		TenTheLoai = tenTheLoai;
	}
	public m_THELOAI() {
	}
	public int getMaTheLoai() {
		return MaTheLoai;
	}
	public void setMaTheLoai(int maTheLoai) {
		MaTheLoai = maTheLoai;
	}
	public String getTenTheLoai() {
		return TenTheLoai;
	}
	public void setTenTheLoai(String tenTheLoai) {
		TenTheLoai = tenTheLoai;
	}
}
