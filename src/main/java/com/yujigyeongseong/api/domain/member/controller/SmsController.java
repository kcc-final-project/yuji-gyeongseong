package com.yujigyeongseong.api.domain.member.controller;

import com.yujigyeongseong.api.domain.member.dto.SmsCertRequest;
import com.yujigyeongseong.api.domain.member.dto.SmsDtoRequest;
import com.yujigyeongseong.api.domain.member.dto.UserSessionData;
import com.yujigyeongseong.api.domain.member.service.SmsService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/sms")
public class SmsController {

    private final SmsService smsService;

    public SmsController(@Autowired SmsService smsService){
        this.smsService = smsService;
    }

    @PostMapping("/send")
    public ResponseEntity<?> SendSMS(@RequestBody @Valid SmsDtoRequest smsRequestDto){
        String number = smsService.SendSms(smsRequestDto);
        return ResponseEntity.ok(number);
    }

    @PostMapping("/cert")
    public ResponseEntity<?> SendCert(@RequestBody SmsCertRequest smsCertRequest){
        boolean isCheck = smsService.checkCert(smsCertRequest);
        if(isCheck){
            return ResponseEntity.badRequest().body("이미 존재하는 회원입니다.");
        }else{
            return ResponseEntity.ok(true);
        }
    }

    @PostMapping("/store")
    public ResponseEntity<Void> storeSessionData(@RequestBody UserSessionData data, HttpSession session) {
        session.setAttribute("name", data.getName());
        session.setAttribute("birth", data.getBirth());
        session.setAttribute("tel", data.getTel());
        return ResponseEntity.ok().build();
    }

}