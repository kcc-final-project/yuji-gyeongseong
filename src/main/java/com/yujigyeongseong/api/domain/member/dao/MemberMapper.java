package com.yujigyeongseong.api.domain.member.dao;

import com.yujigyeongseong.api.domain.member.DTO.Institution;
import com.yujigyeongseong.api.domain.member.DTO.request.SelectInstitutionRequest;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Optional;

@Mapper
public interface MemberMapper {
    int countByUsername(String id);

    List<Institution> selectAll();

    List<Institution> selectOrgan(SelectInstitutionRequest selectInstitutionRequest);
}
