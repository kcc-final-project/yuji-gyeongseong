package com.yujigyeongseong.api.domain.member.service;

import com.yujigyeongseong.api.domain.member.dto.Institution;
import com.yujigyeongseong.api.domain.member.dto.SignUpMember;
import com.yujigyeongseong.api.domain.member.dto.request.SelectInstitutionRequest;
import com.yujigyeongseong.api.domain.member.dao.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

    private final MemberMapper memberMapper;

    @Override
    public boolean countByUsername(String id) {
        id = id.trim();
        int count = memberMapper.countByUsername(id);
        return count > 0;
    }

    @Override
    public List<Institution> selectAll() {
        return memberMapper.selectAll();
    }

    @Override
    public List<Institution> selectOrgan(SelectInstitutionRequest selectInstitutionRequest) {
        return memberMapper.selectOrgan(selectInstitutionRequest);
    }

    @Override
    public boolean insertMember(SignUpMember signUpMember) {
        int result = memberMapper.insertMember(signUpMember);
        if (result == 1) {
            String username = signUpMember.getUsername();
            int memNo = memberMapper.findByMemNo(username);
            System.out.println("memNo" + memNo);

            if (memNo > 0) {
                int insertNum = memberMapper.insertRole(memNo);

                if (insertNum == 1) {
                    return true;
                }
            }
            return true;
        } else {
            return false;
        }

    }

}
