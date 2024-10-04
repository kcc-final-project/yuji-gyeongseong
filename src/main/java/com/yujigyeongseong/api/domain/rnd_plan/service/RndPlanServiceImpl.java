package com.yujigyeongseong.api.domain.rnd_plan.service;

import com.yujigyeongseong.api.domain.rnd_plan.dao.RndPlanMapper;
import com.yujigyeongseong.api.domain.rnd_plan.dto.RndPlan;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class RndPlanServiceImpl implements RndPlanService {

    private final RndPlanMapper rndPlanMapper;

    @Override
    public RndPlan getMemberById(Long id) {
        return rndPlanMapper.selectRndPlanById(id).get();
    }

}
