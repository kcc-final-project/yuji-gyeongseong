package com.yujigyeongseong.api.domain.research_number.service;

import com.yujigyeongseong.api.domain.research_number.dto.EvalCommittee;
import com.yujigyeongseong.api.domain.research_number.dto.EvaluationMember;
import com.yujigyeongseong.api.domain.research_number.dto.Member;
import com.yujigyeongseong.api.domain.research_number.dto.SubAnnouncement;
import com.yujigyeongseong.api.domain.research_number.dto.request.MemberDetails;

import java.util.List;

public interface EvalComposeService {
    SubAnnouncement getSubAnnounceById(Long id);
    EvalCommittee getOneEvalCommitteeById(Long id);
    List<EvalCommittee> getAllEvalCommitteeById(Long id);
    int getRndPlanCntById(Long id);
    List<EvaluationMember> getEvaluationMembersByCommittee(Long id);
    Member getOneMemberById(Long id);
    MemberDetails getOneMemberDetailWithInstitution(Long id);
}
