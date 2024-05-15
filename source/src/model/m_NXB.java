package model;

public class m_NXB {
	private int MaNXB;
	private String TenNXB;
	public m_NXB(int maNXB, String tenNXB) {
		MaNXB = maNXB;
		TenNXB = tenNXB;
	}
	public m_NXB(String tenNXB) {
		TenNXB = tenNXB;
	}
	public m_NXB() {
	}
	public int getMaNXB() {
		return MaNXB;
	}
	public void setMaNXB(int maNXB) {
		MaNXB = maNXB;
	}
	public String getTenNXB() {
		return TenNXB;
	}
	public void setTenNXB(String tenNXB) {
		TenNXB = tenNXB;
	}
}
