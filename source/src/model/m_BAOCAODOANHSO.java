package model;

public class m_BAOCAODOANHSO {
	private int Thang;
	private int Nam;
	private int TongDoanhThu;
	private int SLB;
	public m_BAOCAODOANHSO(int thang, int nam, int tongDoanhThu, int sLB) {
		Thang = thang;
		Nam = nam;
		TongDoanhThu = tongDoanhThu;
		SLB = sLB;
	}
	public m_BAOCAODOANHSO() {
	}
	public int getThang() {
		return Thang;
	}
	public void setThang(int thang) {
		Thang = thang;
	}
	public int getNam() {
		return Nam;
	}
	public void setNam(int nam) {
		Nam = nam;
	}
	public int getTongDoanhThu() {
		return TongDoanhThu;
	}
	public void setTongDoanhThu(int tongDoanhThu) {
		TongDoanhThu = tongDoanhThu;
	}
	public int getSLB() {
		return SLB;
	}
	public void setSLB(int sLB) {
		SLB = sLB;
	}
}
