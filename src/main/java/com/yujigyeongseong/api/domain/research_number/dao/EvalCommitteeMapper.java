package com.yujigyeongseong.api.domain.research_number.dao;

import com.yujigyeongseong.api.domain.research_number.dto.AcadAbility;
import com.yujigyeongseong.api.domain.research_number.dto.Career;
import com.yujigyeongseong.api.domain.research_number.dto.Noti;
import com.yujigyeongseong.api.domain.research_number.dto.request.AcadRequest;
import com.yujigyeongseong.api.domain.research_number.dto.request.CareerRequest;
import com.yujigyeongseong.api.domain.research_number.dto.request.EvalNotiRequest;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface EvalCommitteeMapper {
    List<Career> selectAllCareersByMemberId(Long Id);

    List<AcadAbility> selectAllAcadAbilitiesByMemberId(Long Id);

    List<String> selectAllTechFieldNameByMemberId(Long Id);

    List<Noti> selectAllNotiByMemberId(Long Id);

    int insertAllCareersByMemberId(Long id, List<CareerRequest> careers);

    int insertAllAcadAbilitiesByMemberId(Long id, List<AcadRequest> acadAbilities);

    int insertEvalNotiByMemberId(EvalNotiRequest evalNotiRequest);
}