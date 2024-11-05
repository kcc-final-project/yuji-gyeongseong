package com.yujigyeongseong.api.domain.research_number.dao;

import com.yujigyeongseong.api.domain.research_number.dto.AcadAbility;
import com.yujigyeongseong.api.domain.research_number.dto.Career;
import com.yujigyeongseong.api.domain.research_number.dto.Noti;
import com.yujigyeongseong.api.domain.research_number.dto.request.AcadRequest;
import com.yujigyeongseong.api.domain.research_number.dto.request.CareerRequest;
import com.yujigyeongseong.api.domain.research_number.dto.request.EvalNotiRequest;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface EvalCommitteeMapper {
    List<Career> selectAllCareersByMemberId(Long Id);

    List<AcadAbility> selectAllAcadAbilitiesByMemberId(Long Id);

    List<String> selectAllTechFieldNameByMemberId(Long Id);

    List<Noti> selectAllNotiByMemberId(Long Id);

//    int insertAllCareersByMemberId(@Param("id") Long id, @Param("careers") List<CareerRequest> careers);
    int insertCareer(Long id, CareerRequest career);

    int insertAllAcadAbilitiesByMemberId(@Param("id") Long id, @Param("acadAbilities") List<AcadRequest> acadAbilities);

    int insertAcadAbility(Long id, AcadRequest acad);

    int insertRsrcNoByMemberId(Long id);

    int insertEvalNotiByMemberId(EvalNotiRequest evalNotiRequest);
}