package com.yujigyeongseong.api.domain.member.service;

import com.yujigyeongseong.api.domain.member.dto.SmsCertRequest;
import com.yujigyeongseong.api.domain.member.dto.SmsDtoRequest;
import org.springframework.stereotype.Service;

@Service
public interface SmsService {
    String SendSms(SmsDtoRequest smsRequestDto);
    boolean checkCert(SmsCertRequest smsCertRequest);
}
