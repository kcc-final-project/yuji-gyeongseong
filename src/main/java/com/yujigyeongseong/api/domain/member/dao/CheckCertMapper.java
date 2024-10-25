package com.yujigyeongseong.api.domain.member.dao;

import com.yujigyeongseong.api.domain.member.DTO.SmsCertRequest;
import org.apache.ibatis.annotations.Mapper;

import java.util.Optional;

@Mapper
public interface CheckCertMapper {
    Optional<SmsCertRequest> checkCert(SmsCertRequest smsCertRequest);
}
