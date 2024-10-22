package com.yujigyeongseong.api.domain.rnd_plan.service;

import com.yujigyeongseong.api.domain.rnd_plan.dao.RndPlanMapper;
import com.yujigyeongseong.api.domain.rnd_plan.dto.RndField;
import com.yujigyeongseong.api.domain.rnd_plan.dto.RndPlan;
import com.yujigyeongseong.api.domain.rnd_plan.dto.RndPlanBasic;
import com.yujigyeongseong.api.domain.rnd_plan.dto.RndPlanBasicData;
import com.yujigyeongseong.api.domain.rnd_plan.dto.request.CreateRndFieldRequest;
import com.yujigyeongseong.api.domain.rnd_plan.dto.request.CreateRndPlanBasicRequest;
import com.yujigyeongseong.api.domain.rnd_plan.dto.request.UpdateRndPlanBasicRequest;
import com.yujigyeongseong.api.domain.rnd_plan.exception.NotFoundRndPlanBasic;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@Service
@Transactional(readOnly = true)
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
    public Long insertRndPlanBasic(final CreateRndPlanBasicRequest request) {

        Long rndPlanSeq = rndPlanMapper.selectRndPlanSequence();
        request.assignRndTaskNo(rndPlanSeq);
        request.assignRndPlanNo(rndPlanSeq);
        for (CreateRndFieldRequest rndField : request.getRndFields()) {
            rndField.assignRndPlanNo(rndPlanSeq);
        }

        rndPlanMapper.insertRndPlanBasic(request);
        rndPlanMapper.insertRndFields(request.getRndFields());

        return rndPlanSeq;
    }

    @Override
    public RndPlanBasicData getBasicDataByRndPlanNo(Long rndPlanNo) {
        RndPlanBasicData rndPlanBasicData = rndPlanMapper.selectTaskNameByRndPlanNo(rndPlanNo);
        List<RndField> rndFields = rndPlanMapper.selectRndFieldsByRndPlanNo(rndPlanNo);
        rndPlanBasicData.assignRndFields(rndFields);
        return rndPlanBasicData;
    }

    @Override
    @Transactional
    public void patchBasicInfo(final Long rndPlanNo,
                               final UpdateRndPlanBasicRequest request) {
        request.assignRndPlanNo(rndPlanNo);
        for (CreateRndFieldRequest rndField : request.getRndFields()) {
            rndField.assignRndPlanNo(rndPlanNo);
        }

        rndPlanMapper.updateTaskNameByRndPlanNo(rndPlanNo, request.getTaskName());
        rndPlanMapper.deleteRndFieldsByRndPlanNo(rndPlanNo);
        rndPlanMapper.insertRndFields(request.getRndFields());
    }

}