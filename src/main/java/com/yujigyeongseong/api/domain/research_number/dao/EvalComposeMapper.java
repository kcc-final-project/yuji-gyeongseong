package com.yujigyeongseong.api.domain.research_number.dao;

import com.yujigyeongseong.api.domain.research_number.dto.EvalCommittee;
import com.yujigyeongseong.api.domain.research_number.dto.EvaluationMember;
import com.yujigyeongseong.api.domain.research_number.dto.Member;
import com.yujigyeongseong.api.domain.research_number.dto.SubAnnounce;
import com.yujigyeongseong.api.domain.research_number.dto.request.MemberDetails;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface EvalComposeMapper {
    SubAnnounce selectSubAnnounceById(Long id);
    EvalCommittee selectOneEvalCommitteeById(Long id);
    List<EvalCommittee> selectAllEvalCommitteeById(Long id);
    int selectRndPlanCntById(Long id);
    List<EvaluationMember> selectEvaluationMembersById(Long id);
    Member selectOneMemberById(Long id);
    MemberDetails selectOneMemberDetailWithInstitution(Long id);
}
