package com.yujigyeongseong.api.domain.member.service;

import com.yujigyeongseong.api.domain.member.DTO.SmsCertRequest;
import com.yujigyeongseong.api.domain.member.DTO.SmsDtoRequest;
import org.springframework.stereotype.Service;

@Service
public interface SmsService {
    String SendSms(SmsDtoRequest smsRequestDto);

    boolean checkCert(SmsCertRequest smsCertRequest);
}
