package com.yujigyeongseong.api.domain.research_number.service;

import com.yujigyeongseong.api.domain.research_number.dto.AcadAbility;
import com.yujigyeongseong.api.domain.research_number.dto.Career;

import java.util.List;

public interface EvalCommitteeService {
    List<Career> getAllCareersByMemberId(Long id);

    List<AcadAbility> getAllAcadAbilitiesByMemberId(Long id);
}
