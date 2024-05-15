package model;

public class m_THANHTOAN {
	private int MaTT;
	private String KieuTT;
	
        public m_THANHTOAN(int maTT, String kieuTT) {
		MaTT = maTT;
		KieuTT = kieuTT;
	}
	public int getMaTT() {
		return MaTT;
	}
	public void setMaTT(int maTT) {
		MaTT = maTT;
	}
	public String getKieuTT() {
		return KieuTT;
	}
	public void setKieuTT(String kieuTT) {
		KieuTT = kieuTT;
	}
	public m_THANHTOAN(String kieuTT) {
		KieuTT = kieuTT;
	}
}
