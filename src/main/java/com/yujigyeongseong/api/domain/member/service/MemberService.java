package com.yujigyeongseong.api.domain.member.service;

import com.yujigyeongseong.api.domain.member.dto.Institution;
import com.yujigyeongseong.api.domain.member.dto.SignUpMember;
import com.yujigyeongseong.api.domain.member.dto.request.SelectInstitutionRequest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface MemberService {
    boolean countByUsername(String id);

    List<Institution> selectAll();

    List<Institution> selectOrgan(SelectInstitutionRequest selectInstitutionRequest);

    boolean insertMember(SignUpMember signUpMember);

    boolean updateMember(SignUpMember signUpMember);

    boolean deleteMemberById(Long memNo);
}
