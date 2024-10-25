package com.yujigyeongseong.api.domain.member.service;

import com.yujigyeongseong.api.domain.member.DTO.Institution;
import com.yujigyeongseong.api.domain.member.DTO.request.SelectInstitutionRequest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface MemberService {
    boolean countByUsername(String id);

    List<Institution> selectAll();

    List<Institution> selectOrgan(SelectInstitutionRequest selectInstitutionRequest);
}
