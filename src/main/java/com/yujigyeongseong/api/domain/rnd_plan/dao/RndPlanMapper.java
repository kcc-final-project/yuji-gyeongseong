package com.yujigyeongseong.api.domain.rnd_plan.dao;

import com.yujigyeongseong.api.domain.rnd_plan.dto.*;
import com.yujigyeongseong.api.domain.rnd_plan.dto.request.CreateBasicInfoRequest;
import com.yujigyeongseong.api.domain.rnd_plan.dto.request.CreateTaskSummaryRequest;
import com.yujigyeongseong.api.domain.rnd_plan.dto.response.BasicInfoResponse;
import com.yujigyeongseong.api.domain.rnd_plan.dto.response.RndPlanResponse;
import com.yujigyeongseong.api.domain.rnd_plan.dto.response.TaskSummaryResponse;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Optional;

@Mapper
public interface RndPlanMapper {

    // '기본정보 페이지' 데이터 '조회' 쿼리
    Optional<BasicInfo> selectBasicInfoBySubAnnNo(final Long subAnnNo);

    // '과제정보' 데이터 '조회' 쿼리
    Optional<RndPlanResponse> selectRndPlanBySubAnnNo(final Long subAnnNo);

    // TODO: SelectKey로 처리할 수 있지 않을까?
    Long selectRndPlanSequence();

    // '기본정보' 데이터 '등록' 쿼리
    int insertBasicInfo(final CreateBasicInfoRequest request);

    // '연구분야' 데이터 '등록' 쿼리
    int insertRndFields(@Param("rndFields") final List<RndField> rndFields);

    // 기본정보 데이터 '조회' 쿼리__'과제명/계획서번호'
    Optional<BasicInfoResponse> selectTaskNameAndTaskNoByRndPlanNo(final Long rndPlanNo);

    // 기본정보 데이터 '조회' 쿼리__'연구분야'
    List<RndField> selectRndFieldsByRndPlanNo(final Long rndPlanNo);

    // '연구분야' 데이터 '삭제' 쿼리
    int deleteRndFieldsByRndPlanNo(final Long rndPlanNo);

    // '과제명' 데이터 '수정' 쿼리
    int updateTaskNameByRndPlanNo(@Param("rndPlanNo") final Long rndPlanNo,
                                  @Param("taskName") String taskName);

    // '연구개발계획서' 현재 작성 단계 '조회' 쿼리
    int selectCurrStepByRndPlanNo(final Long rndPlanNo);

    // '연구개발계획서' 현재 작서 단계 '수정' 쿼리
    int updateCurrStepByRndPlanNo(final Long rndPlanNo, final Integer currStep);

    // '과제요약' 데이터 '등록' 쿼리
    int insertTaskSummaryByRndPlanNo(final CreateTaskSummaryRequest request);

    // '연구개발기간' 데이터 '삭제' 쿼리
    int deleteRndPeriodsByRndPlanNo(final Long rndPlanNo);

    // '연구개발기간' 데이터 '등록' 쿼리
    int insertRndPeriods(@Param("rndPeriods") final List<RndPeriod> rndPeriods);

    // '단계별 내용' 데이터 '삭제' 쿼리
    int deleteStageContentsByRndPlanNo(final Long rndPlanNo);

    // '단계별 내용' 데이터 '등록' 쿼리
    int insertStageContents(@Param("stageContents") final List<StageContent> stageContents);

    // '과제요약' 데이터 '조회' 쿼리
    Optional<TaskSummaryResponse> selectTaskSummaryByRndPlanNo(final Long rndPlanNo);

    // '연구개발기간' 데이터 '조회' 쿼리
    List<RndPeriod> selectRndPeriodsByRndPlanNo(final Long rndPlanNo);

    // '단계별 내용' 데이터 '조회' 쿼리
    List<StageContent> selectStageContentsByRndPlanNo(final Long rndPlanNo);

}