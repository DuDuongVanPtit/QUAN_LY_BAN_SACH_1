
package model;

public class m_GIOHANG {

    private m_SACH s;
    private int sl;

    public m_GIOHANG(m_SACH c, int sli) {
        s = c;
        sl = sli;
    }

    public m_GIOHANG() {
    }

    public m_SACH getm_SACH() {
        return s;
    }

    public void sets(m_SACH c) {
        s = c;
    }

    public int getsl() {
        return sl;
    }

    public void setsl(int li) {
        sl = li;
    }

}
