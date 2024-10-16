package com.yujigyeongseong.api.domain.research_number.dao;

import com.yujigyeongseong.api.domain.research_number.dto.AcadAbility;
import com.yujigyeongseong.api.domain.research_number.dto.Career;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Optional;

@Mapper
public interface EvalCommitteeMapper {
    List<Career> selectAllCareersByMemberId(Long Id);

    List<AcadAbility> selectAllAcadAbilitiesByMemberId(Long Id);

}
