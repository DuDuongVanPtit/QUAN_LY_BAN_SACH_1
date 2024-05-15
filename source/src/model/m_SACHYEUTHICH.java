package model;

public class m_SACHYEUTHICH {
	private int MaSach;
	private int MaKH;
	public m_SACHYEUTHICH(int maSach, int maKH) {
		MaSach = maSach;
		MaKH = maKH;
	}
	public m_SACHYEUTHICH() {
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
}
