package model;

public class m_TACGIA {
	private int MaTacGia;
	private String TenTacGia;
	
	public m_TACGIA(int maTacGia, String tenTacGia) {
		MaTacGia = maTacGia;
		TenTacGia = tenTacGia;
	}
	
	public m_TACGIA( String tenTacGia) {
		TenTacGia = tenTacGia;
	}
	
	public m_TACGIA() {
	}

	public int getMaTacGia() {
		return MaTacGia;
	}

	public void setMaTacGia(int maTacGia) {
		MaTacGia = maTacGia;
	}

	public String getTenTacGia() {
		return TenTacGia;
	}

	public void setTenTacGia(String tenTacGia) {
		TenTacGia = tenTacGia;
	}
	
}
