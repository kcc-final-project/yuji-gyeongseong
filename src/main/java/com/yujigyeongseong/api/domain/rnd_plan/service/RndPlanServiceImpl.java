package com.yujigyeongseong.api.domain.rnd_plan.service;

import com.yujigyeongseong.api.domain.rnd_plan.dao.RndPlanMapper;
import com.yujigyeongseong.api.domain.rnd_plan.dto.RndPlan;
import com.yujigyeongseong.api.domain.rnd_plan.dto.RndPlanBasic;
import com.yujigyeongseong.api.domain.rnd_plan.exception.NotFoundRndPlanBasic;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class RndPlanServiceImpl implements RndPlanService {

    private final RndPlanMapper rndPlanMapper;

    // TODO: 테스트 용 기능이니 나중에 지우기
    @Override
    public RndPlan getMemberById(Long id) {
        return rndPlanMapper.selectRndPlanById(id).get();
    }

    @Override
    public RndPlanBasic getBasicInfoBySubAnnNo(Long subAnnNo) {
        return rndPlanMapper.selectRndPlanBasicBySubAnnNo(subAnnNo)
                .orElseThrow(NotFoundRndPlanBasic::new);
    }

}