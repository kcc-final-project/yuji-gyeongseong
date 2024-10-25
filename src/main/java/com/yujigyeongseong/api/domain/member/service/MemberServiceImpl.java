package com.yujigyeongseong.api.domain.member.service;

import com.yujigyeongseong.api.domain.member.DTO.Institution;
import com.yujigyeongseong.api.domain.member.DTO.request.SelectInstitutionRequest;
import com.yujigyeongseong.api.domain.member.dao.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{

    private final MemberMapper memberMapper;

    @Override
    public boolean countByUsername(String id) {
        id = id.trim();
        int count = memberMapper.countByUsername(id);
        return count>0;
    }

    @Override
    public List<Institution> selectAll() {
        return memberMapper.selectAll();
    }

    @Override
    public List<Institution> selectOrgan(SelectInstitutionRequest selectInstitutionRequest) {
        return memberMapper.selectOrgan(selectInstitutionRequest);
    }
}
