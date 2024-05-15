package model;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class c_Mail {
    
    public static int senMail(m_mail m){
        int i = 0;
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(m.getEmail(),m.getPassword());
            }
        });

        try {
            session.setDebug(true);

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(m.getEmail()));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(m.getTo()));
            message.setSubject(m.getSubject());
            message.setText(m.getText());

            Transport.send(message);
            i = 1;

        } catch (MessagingException e) {
             i = 0;
        }
        return i;
    }
}
