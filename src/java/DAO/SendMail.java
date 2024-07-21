/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Customer;
import Models.Staff;
import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author HP
 */
public class SendMail {

    public String getRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }
    private final String fromEmail = "thaodvhe173219@fpt.edu.vn";
    private final String password = "xxfe ipib unrp uxno";

    public boolean sendEmail(Customer user, String subject, String content) {
        boolean test = false;
        String toEmail = user.getEmail();

        try {
            Properties prop = new Properties();
            prop.setProperty("mail.smtp.host", "smtp.gmail.com");
            prop.setProperty("mail.smtp.port", "587");
            prop.setProperty("mail.smtp.auth", "true");
            prop.setProperty("mail.smtp.starttls.enable", "true");
            prop.put("mail.smtp.socketFactory.port", "587");
            prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

            Session session = Session.getInstance(prop, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

            Message mess = createMessage(session, toEmail, subject, content);

            Transport.send(mess);
            test = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return test;
    }

    public boolean sendEmailStaff(Staff staff, String subject, String content) {
        boolean test = false;
        String toEmail = staff.getEmail();

        try {
            Properties prop = new Properties();
            prop.setProperty("mail.smtp.host", "smtp.gmail.com");
            prop.setProperty("mail.smtp.port", "587");
            prop.setProperty("mail.smtp.auth", "true");
            prop.setProperty("mail.smtp.starttls.enable", "true");
            prop.put("mail.smtp.socketFactory.port", "587");
            prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

            Session session = Session.getInstance(prop, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

            Message mess = createMessage(session, toEmail, subject, content);

            Transport.send(mess);
            test = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return test;
    }

    private Message createMessage(Session session, String toEmail, String subject, String content) throws MessagingException {
        Message mess = new MimeMessage(session);
        mess.setFrom(new InternetAddress(fromEmail));
        mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
        mess.setSubject(subject);
        mess.setText(content);
        return mess;
    }
}
