package com.yujigyeongseong.api.domain.research_number.service;

import com.yujigyeongseong.api.domain.research_number.dto.AcadAbility;
import com.yujigyeongseong.api.domain.research_number.dto.Career;
import com.yujigyeongseong.api.domain.research_number.dto.Noti;
import com.yujigyeongseong.api.domain.research_number.dto.request.AcadRequest;
import com.yujigyeongseong.api.domain.research_number.dto.request.CareerRequest;
import com.yujigyeongseong.api.domain.research_number.dto.request.EvalNotiRequest;

import java.util.List;

public interface EvalCommitteeService {
    List<Career> getAllCareersByMemberId(Long id);

    List<AcadAbility> getAllAcadAbilitiesByMemberId(Long id);

    List<String> getAllTechFieldNameByMemberId(Long id);

    List<Noti> getAllTechNotiByMemberId(Long id);

    int setCareersByMemberId(Long id, List<CareerRequest> careers);

    int setAcadAbilitiesByMemberId(Long id, List<AcadRequest> acadAbilities);

    int setEvalNotiByMemberId(EvalNotiRequest evalNotiRequest);
}
