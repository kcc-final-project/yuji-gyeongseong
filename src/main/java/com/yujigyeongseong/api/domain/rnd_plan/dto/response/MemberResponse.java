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
public class MemberResponse {
    private final String name;
    private final Long rsrch_no;
    private final String institution_name;
    private final String affil_dept;
    private final String position;
    private final String birth;
}
