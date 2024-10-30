package com.yujigyeongseong.api.domain.member.service;


import com.yujigyeongseong.api.domain.member.dto.SmsCertRequest;
import com.yujigyeongseong.api.domain.member.dto.SmsDtoRequest;
import com.yujigyeongseong.api.domain.member.config.SmsCertificationUtil;
import com.yujigyeongseong.api.domain.member.dao.CheckCertMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class SmsServiceImpl implements SmsService{
    private final SmsCertificationUtil smsCertificationUtil;
    private final CheckCertMapper checkCert;

    @Override
    public String SendSms(SmsDtoRequest smsRequestDto) {
        String phoneNum = smsRequestDto.getPhoneNum();
        String certificationCode = Integer.toString((int)(Math.random() * (999999 - 100000 + 1)) + 100000); // 6자리 인증 코드를 랜덤으로 생성
        smsCertificationUtil.sendSMS(phoneNum, certificationCode);
        return certificationCode;
    }

    @Override
    public boolean checkCert(SmsCertRequest smsCertRequest) {
        Optional<SmsCertRequest> result = checkCert.checkCert(smsCertRequest);
        return result.isPresent();
    }
}
