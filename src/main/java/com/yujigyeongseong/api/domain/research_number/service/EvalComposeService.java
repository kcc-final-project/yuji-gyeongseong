package com.yujigyeongseong.api.domain.research_number.service;

import com.yujigyeongseong.api.domain.research_number.dto.EvalCommittee;
import com.yujigyeongseong.api.domain.research_number.dto.EvaluationMember;
import com.yujigyeongseong.api.domain.research_number.dto.Member;
import com.yujigyeongseong.api.domain.research_number.dto.SubAnnounce;
import com.yujigyeongseong.api.domain.research_number.dto.request.EvalMemberRequest;
import com.yujigyeongseong.api.domain.research_number.dto.request.EvalPercentRequest;
import com.yujigyeongseong.api.domain.research_number.dto.request.MemberDetails;

import java.util.List;

public interface EvalComposeService {
    SubAnnounce getSubAnnounceById(Long id);

    EvalCommittee getOneEvalCommitteeById(Long id);

    List<EvalCommittee> getAllEvalCommitteeById(Long id);

    int getRndPlanCntById(Long id);

    List<EvaluationMember> getEvaluationMembersByCommittee(Long id);

    Member getOneMemberById(Long id);

    MemberDetails getOneMemberDetailWithInstitution(Long id);

    int setEvaluationMemberByNotiContentNo(Long memberId, Long notiContentNo, EvalMemberRequest evalMemberRequest);

    int setNotiByNotificationNo(Long notificationNo);

    int setEvalCommitteesBySubAnnNo(Long subAnnNo, int rndPlanCnt, EvalPercentRequest request);

    int getEvalCommitteeCntById(Long SubAnnNo);

}
