package com.yujigyeongseong.api.domain.rnd_plan.dto.response;

import com.yujigyeongseong.api.domain.member.dto.Institution;
import com.yujigyeongseong.api.domain.research_number.dto.Member;
import com.yujigyeongseong.api.domain.rnd_plan.dto.RndField;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

import java.util.List;

@RequiredArgsConstructor
@Getter
@ToString
public class BasicInfoResponse {

    private final String taskName;
    private final String rndTaskNo;
    private final Long memNo;
    private List<RndField> rndFields;
    private Member member;
    private Institution institution;

    public void assignRndFields(List<RndField> rndFields) {
        this.rndFields = rndFields;
    }

    public void assignMember(Member member) {this.member = member;}

    public void assignInstitution(Institution institution) {this.institution = institution;}

}
