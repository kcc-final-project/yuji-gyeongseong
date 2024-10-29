package com.yujigyeongseong.api.domain.member.dao;

import com.yujigyeongseong.api.domain.member.dto.Institution;
import com.yujigyeongseong.api.domain.member.dto.SignUpMember;
import com.yujigyeongseong.api.domain.member.dto.auth.MemberLogin;
import com.yujigyeongseong.api.domain.member.dto.request.SelectInstitutionRequest;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MemberMapper {
    int countByUsername(String id);

    List<Institution> selectAll();

    List<Institution> selectOrgan(SelectInstitutionRequest selectInstitutionRequest);

    int insertMember(SignUpMember signUpMember);

    MemberLogin findByUsername(String username);

    int findByMemNo(String username);

    int insertRole(int memNo);
}
