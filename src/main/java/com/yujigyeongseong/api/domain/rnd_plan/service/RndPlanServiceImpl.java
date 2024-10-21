package com.yujigyeongseong.api.domain.rnd_plan.service;

import com.yujigyeongseong.api.domain.rnd_plan.dao.RndPlanMapper;
import com.yujigyeongseong.api.domain.rnd_plan.dto.RndField;
import com.yujigyeongseong.api.domain.rnd_plan.dto.RndPlan;
import com.yujigyeongseong.api.domain.rnd_plan.dto.RndPlanBasic;
import com.yujigyeongseong.api.domain.rnd_plan.dto.RndPlanBasicData;
import com.yujigyeongseong.api.domain.rnd_plan.dto.request.SaveRndFieldRequest;
import com.yujigyeongseong.api.domain.rnd_plan.dto.request.SaveRndPlanBasicRequest;
import com.yujigyeongseong.api.domain.rnd_plan.exception.NotFoundRndPlanBasic;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
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
    public RndPlanBasic getBasicInfoBySubAnnNo(final Long subAnnNo) {
        return rndPlanMapper.selectRndPlanBasicBySubAnnNo(subAnnNo)
                .orElseThrow(NotFoundRndPlanBasic::new);
    }

    @Override
    @Transactional
    public Long insertRndPlanBasic(final SaveRndPlanBasicRequest request) {

        Long rndPlanSeq = rndPlanMapper.selectRndPlanSequence();
        request.assignRndTaskNo(rndPlanSeq);
        request.assignRndPlanNo(rndPlanSeq);
        for (SaveRndFieldRequest rndField : request.getRndFields()) {
            rndField.assignRndPlanNo(rndPlanSeq);
        }

        rndPlanMapper.insertRndPlanBasic(request);
        rndPlanMapper.insertRndFields(request.getRndFields());

        return rndPlanSeq;
    }

    @Override
    public RndPlanBasicData getBasicInfoByRndPlanNo(Long rndPlanNo) {
        String taskName = rndPlanMapper.selectTaskNameByRndPlanNo(rndPlanNo);
        List<RndField> rndFields = rndPlanMapper.selectRndFieldsByRndPlanNo(rndPlanNo);
        return new RndPlanBasicData(taskName, rndFields);
    }

}