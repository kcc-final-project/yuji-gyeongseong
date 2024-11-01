package com.yujigyeongseong.api.domain.research_number.dto.request;

import com.yujigyeongseong.api.domain.research_number.dto.EvaluationMember;
import com.yujigyeongseong.api.domain.research_number.dto.Member;
import lombok.Data;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Data
@ToString
public class MemberEvalRequest {
    private MemberDetails member;
    private EvaluationMember evaluationMember;

    public MemberEvalRequest(MemberDetails member, EvaluationMember evaluationMember) {
        this.member = member;
        this.evaluationMember = evaluationMember;
    }
}
