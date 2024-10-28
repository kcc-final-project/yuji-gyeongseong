package com.yujigyeongseong.api.domain.member.service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MailService {

    private final JavaMailSender javaMailSender;
    private static final String senderEmail= "sanghk32@gmail.com";
    private static int number;

    public static void createNumber() {
        number = (int)(Math.random() * (90000)) + 100000;
    }

    public MimeMessage CreateUserMail(String mail) {
        createNumber();
        MimeMessage message = javaMailSender.createMimeMessage();

        try {
            message.setFrom(senderEmail);
            message.setRecipients(MimeMessage.RecipientType.TO, mail);
            message.setSubject("이메일 인증");
            String body = "";
            body += "<h3>" + "요청하신 인증 번호입니다." + "</h3>";
            body += "<h1>" + number + "</h1>";
            body += "<h3>" + "감사합니다." + "</h3>";
            message.setText(body,"UTF-8", "html");
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return message;
    }

    public MimeMessage CreateMail(String mail) {
        MimeMessage message = javaMailSender.createMimeMessage();

        try {
            message.setFrom(senderEmail);
            message.setRecipients(MimeMessage.RecipientType.TO, mail);
            message.setSubject("기관 웹메일 인증");

            String verificationLink = "https://yourdomain.com/verify-institution?email=" + mail;

            String body = "<h3>기관 웹메일</h3>";
            body += "<h3>아래 버튼을 클릭하여 이메일 인증을 완료해주세요.</h3>";
            body += "<a href='" + verificationLink + "' style='text-decoration: none;'>"
                    + "<button style='background-color: #2E406A; color: white; padding: 14px 25px; font-size: 16px; border: none; border-radius: 5px; cursor: pointer;'>"
                    + "이메일 인증 확인"
                    + "</button>"
                    + "</a>";

            message.setText(body, "UTF-8", "html");
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return message;
    }

    public int sendUserMail(String mail) {
        MimeMessage message = CreateUserMail(mail);
        javaMailSender.send(message);

        return number;
    }

    public int sendMail(String mail) {
        MimeMessage message = CreateMail(mail);
        javaMailSender.send(message);

        return number;
    }
}
