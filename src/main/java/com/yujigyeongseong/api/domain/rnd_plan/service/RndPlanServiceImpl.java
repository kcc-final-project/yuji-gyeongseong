package com.yujigyeongseong.api.domain.rnd_plan.service;

import com.yujigyeongseong.api.domain.member.dto.Institution;
import com.yujigyeongseong.api.domain.research_number.dto.Member;
import com.yujigyeongseong.api.domain.rnd_plan.dao.RndPlanMapper;
import com.yujigyeongseong.api.domain.rnd_plan.dto.BasicInfo;
import com.yujigyeongseong.api.domain.rnd_plan.dto.RndField;
import com.yujigyeongseong.api.domain.rnd_plan.dto.RndPeriod;
import com.yujigyeongseong.api.domain.rnd_plan.dto.StageContent;
import com.yujigyeongseong.api.domain.rnd_plan.dto.response.MemberResponse;
import com.yujigyeongseong.api.domain.rnd_plan.dto.response.RndPlanResponse;
import com.yujigyeongseong.api.domain.rnd_plan.dto.request.CreateBasicInfoRequest;
import com.yujigyeongseong.api.domain.rnd_plan.dto.request.CreateTaskSummaryRequest;
import com.yujigyeongseong.api.domain.rnd_plan.dto.request.UpdateBasicInfoRequest;
import com.yujigyeongseong.api.domain.rnd_plan.dto.response.BasicInfoResponse;
import com.yujigyeongseong.api.domain.rnd_plan.dto.response.TaskSummaryResponse;
import com.yujigyeongseong.api.domain.rnd_plan.exception.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Slf4j
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class RndPlanServiceImpl implements RndPlanService {

    private final RndPlanMapper rndPlanMapper;

    // 기본정보 페이지 조회 API
    @Override
    public BasicInfo getBasicInfoPageBySubAnnNo(final Long subAnnNo) {
        return rndPlanMapper.selectBasicInfoBySubAnnNo(subAnnNo)
                .orElseThrow(NotFoundSubAnn::new);
    }

    // 과제정보 데이터 조회 API
    @Override
    public RndPlanResponse getRndPlanDataBySubAnnNo(Long subAnnNo) {

        return rndPlanMapper.selectRndPlanBySubAnnNo(subAnnNo)
                .orElseThrow(NotFoundRndPlan::new);
    }

    // 기본정보 데이터 등록 API
    @Transactional
    @Override
    public Long registerBasicInfo(final CreateBasicInfoRequest request) {

        Long rndPlanSeq = rndPlanMapper.selectRndPlanSequence();
        request.assignRndTaskNo(rndPlanSeq);
        request.assignRndPlanNo(rndPlanSeq);
        for (RndField rndField : request.getRndFields()) {
            rndField.assignRndPlanNo(rndPlanSeq);
        }

        rndPlanMapper.insertBasicInfo(request);
        rndPlanMapper.insertRndFields(request.getRndFields());

        return rndPlanSeq;
    }

    // 기본정보 데이터 조회 API
    @Override
    public BasicInfoResponse getBasicInfoDataByRndPlanNo(final Long rndPlanNo) {

        BasicInfoResponse basicInfoResponse = rndPlanMapper.selectTaskNameAndTaskNoAndMemNoByRndPlanNo(rndPlanNo)
                .orElseThrow(NotFoundBasicInfo::new);

        List<RndField> rndFields = rndPlanMapper.selectRndFieldsByRndPlanNo(rndPlanNo);
        basicInfoResponse.assignRndFields(rndFields);

        Member member = rndPlanMapper.selectMemberByRndMemberNo(basicInfoResponse.getMemNo()).orElseThrow(NotFoundMemberInfo::new);
        basicInfoResponse.assignMember(member);

        // rndPlanNo 에서 memNo의 Member 정보, memNo의 기관 정보
        Institution institution = rndPlanMapper.selectInstitutionByRndMemberNo(member.getInstitutionNo()).orElseThrow(NotFoundInstitutionInfo::new);
        basicInfoResponse.assignInstitution(institution);

        return basicInfoResponse;
    }

    // 기본정보 데이터 수정 API
    @Transactional
    @Override
    public void updateBasicInfo(final Long rndPlanNo,
                                final UpdateBasicInfoRequest request) {

        request.assignRndPlanNo(rndPlanNo);
        for (RndField rndField : request.getRndFields()) {
            rndField.assignRndPlanNo(rndPlanNo);
        }

        rndPlanMapper.updateTaskNameByRndPlanNo(rndPlanNo, request.getTaskName());
        rndPlanMapper.deleteRndFieldsByRndPlanNo(rndPlanNo);
        rndPlanMapper.insertRndFields(request.getRndFields());
    }

    // 과제요약 데이터 등록 API
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int registerTaskSummary(final CreateTaskSummaryRequest request) {
        // 요청 보낸 currentStep이 DB currentStep 크면(>) UPDATE
        int currStep = rndPlanMapper.selectCurrStepByRndPlanNo(request.getRndPlanNo());
        if (request.getCurrentStep() > currStep) {
            currStep += 1;
            rndPlanMapper.updateCurrStepByRndPlanNo(request.getRndPlanNo(), currStep);
        }

        rndPlanMapper.insertTaskSummaryByRndPlanNo(request);

        rndPlanMapper.deleteRndPeriodsByRndPlanNo(request.getRndPlanNo());
        rndPlanMapper.insertRndPeriods(request.getRndPeriods());

        rndPlanMapper.deleteStageContentsByRndPlanNo(request.getRndPlanNo());
        rndPlanMapper.insertStageContents(request.getStageContents());

        return currStep;
    }

    // 과제요약 데이터 조회 API
    @Override
    public TaskSummaryResponse getTaskSummaryDataByRndPlanNo(final Long rndPlanNo) {

        TaskSummaryResponse taskSummaryResponse = rndPlanMapper.selectTaskSummaryByRndPlanNo(rndPlanNo)
                .orElseThrow(NotFoundTaskSummary::new);

        List<RndPeriod> rndPeriods = rndPlanMapper.selectRndPeriodsByRndPlanNo(rndPlanNo);
        taskSummaryResponse.assignRndPeriods(rndPeriods);

        List<StageContent> stageContents = rndPlanMapper.selectStageContentsByRndPlanNo(rndPlanNo);
        taskSummaryResponse.assignStageContents(stageContents);

        return taskSummaryResponse;
    }

    @Override
    public List<MemberResponse> getAllMember() {
        return rndPlanMapper.selectAllMembers();
    }

}