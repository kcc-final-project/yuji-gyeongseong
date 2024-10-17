package com.yujigyeongseong.api.domain.rnd_plan.dao;

import com.yujigyeongseong.api.domain.rnd_plan.dto.RndPlan;
import com.yujigyeongseong.api.domain.rnd_plan.dto.RndPlanBasic;
import org.apache.ibatis.annotations.Mapper;

import java.util.Optional;

@Mapper
public interface RndPlanMapper {

    // TODO: 테스트 용 기능이니 나중에 지우기
    Optional<RndPlan> selectRndPlanById(Long id);

    Optional<RndPlanBasic> selectRndPlanBasicBySubAnnNo(Long subAnnNo);

}