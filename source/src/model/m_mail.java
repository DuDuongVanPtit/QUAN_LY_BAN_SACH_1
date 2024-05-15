package model;

public class m_mail {

    String email;
    String password;
    String to;
    String subject;
    String text;

    public m_mail(String email, String password, String to, String subject, String text) {
        this.email = email;
        this.password = password;
        this.to = to;
        this.subject = subject;
        this.text = text;
    }

    public m_mail() {
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getPassword() {
        return password;
    }

    public String getTo() {
        return to;
    }

    public String getSubject() {
        return subject;
    }

    public String getText() {
        return text;
    }
}
