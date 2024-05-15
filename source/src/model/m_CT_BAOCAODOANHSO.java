package model;

public class m_CT_BAOCAODOANHSO {
	private int Thang;
	private int Nam;
	private int MaSach;
	private int SLB;
	private double ThanhTien;
	private float TyLe;
	public m_CT_BAOCAODOANHSO(int thang, int nam, int maSach, int sLB, double thanhTien, float tyLe) {
		Thang = thang;
		Nam = nam;
		MaSach = maSach;
		SLB = sLB;
		ThanhTien = thanhTien;
		TyLe = tyLe;
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
	public int getMaSach() {
		return MaSach;
	}
	public void setMaSach(int maSach) {
		MaSach = maSach;
	}
	public int getSLB() {
		return SLB;
	}
	public void setSLB(int sLB) {
		SLB = sLB;
	}
	public double getThanhTien() {
		return ThanhTien;
	}
	public void setThanhTien(double thanhTien) {
		ThanhTien = thanhTien;
	}
	public float getTyLe() {
		return TyLe;
	}
	public void setTyLe(float tyLe) {
		TyLe = tyLe;
	}
	public m_CT_BAOCAODOANHSO() {
		super();
	}
	
}
