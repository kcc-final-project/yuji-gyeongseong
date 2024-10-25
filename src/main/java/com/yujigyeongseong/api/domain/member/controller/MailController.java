package com.yujigyeongseong.api.domain.member.controller;

import com.yujigyeongseong.api.domain.member.service.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

@RestController
public class MailController {
    private final MailService mailService;
    private int number;

    @Autowired
    public MailController(MailService mailService) {
        this.mailService = mailService;
    }

    @PostMapping("/userMailSend")
    public HashMap<String, Object> userMailSend(String mail) {
        HashMap<String, Object> map = new HashMap<>();
        try {
            number = mailService.sendUserMail(mail);
            String num = String.valueOf(number);

            map.put("success", Boolean.TRUE);
            map.put("number", num);
        } catch (Exception e) {
            map.put("success", Boolean.FALSE);
            map.put("error", e.getMessage());
        }
        return map;
    }

    @PostMapping("/mailSend")
    public HashMap<String, Object> mailSend(String mail) {
        HashMap<String, Object> map = new HashMap<>();
        try {
            number = mailService.sendMail(mail);
            String num = String.valueOf(number);

            map.put("success", Boolean.TRUE);
            map.put("number", num);
        } catch (Exception e) {
            map.put("success", Boolean.FALSE);
            map.put("error", e.getMessage());
        }
        return map;
    }

    @GetMapping("/mailCheck")
    public ResponseEntity<?> mailCheck(@RequestParam String userNumber) {
        boolean isMatch = userNumber.equals(String.valueOf(number));
        return ResponseEntity.ok(isMatch);
    }

}
