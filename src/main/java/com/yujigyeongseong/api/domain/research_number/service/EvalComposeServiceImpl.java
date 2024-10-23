package com.yujigyeongseong.api.domain.research_number.service;

import com.yujigyeongseong.api.domain.research_number.dao.EvalCommitteeMapper;
import com.yujigyeongseong.api.domain.research_number.dao.EvalComposeMapper;
import com.yujigyeongseong.api.domain.research_number.dto.*;
import com.yujigyeongseong.api.domain.research_number.dto.request.AcadRequest;
import com.yujigyeongseong.api.domain.research_number.dto.request.CareerRequest;
import com.yujigyeongseong.api.domain.research_number.dto.request.EvalNotiRequest;
import com.yujigyeongseong.api.domain.research_number.dto.request.MemberDetails;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class EvalComposeServiceImpl implements EvalComposeService {

    private final EvalComposeMapper evalComposeMapper;

    @Override
    public SubAnnouncement getSubAnnounceById(Long id) {
        return evalComposeMapper.selectSubAnnounceById(id);
    }

    @Override
    public EvalCommittee getOneEvalCommitteeById(Long id) {
        return evalComposeMapper.selectOneEvalCommitteeById(id);
    }

    @Override
    public List<EvalCommittee> getAllEvalCommitteeById(Long id) {
        return evalComposeMapper.selectAllEvalCommitteeById(id);
    }


    @Override
    public int getRndPlanCntById(Long id) {
        return evalComposeMapper.selectRndPlanCntById(id);
    }

    @Override
    public List<EvaluationMember> getEvaluationMembersByCommittee(Long id) {
        return evalComposeMapper.selectEvaluationMembersById(id);
    }

    @Override
    public Member getOneMemberById(Long id) {
        return evalComposeMapper.selectOneMemberById(id);
    }

    @Override
    public MemberDetails getOneMemberDetailWithInstitution(Long id) {
        return evalComposeMapper.selectOneMemberDetailWithInstitution(id);
    }

}