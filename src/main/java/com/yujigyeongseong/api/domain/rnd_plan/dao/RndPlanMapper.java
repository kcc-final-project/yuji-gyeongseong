package com.yujigyeongseong.api.domain.rnd_plan.dao;

import com.yujigyeongseong.api.domain.rnd_plan.dto.BasicInfo;
import com.yujigyeongseong.api.domain.rnd_plan.dto.RndField;
import com.yujigyeongseong.api.domain.rnd_plan.dto.RndPlan;
import com.yujigyeongseong.api.domain.rnd_plan.dto.request.CreateBasicInfoRequest;
import com.yujigyeongseong.api.domain.rnd_plan.dto.response.BasicInfoResponse;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Optional;

@Mapper
public interface RndPlanMapper {

    // 기본정보 페이지 데이터 조회 쿼리
    Optional<BasicInfo> selectBasicInfoBySubAnnNo(final Long subAnnNo);

    // 과제정보 데이터 조회 쿼리
    Optional<RndPlan> selectRndPlanBySubAnnNo(final Long subAnnNo);

    // TODO: SelectKey로 처리할 수 있지 않을까?
    Long selectRndPlanSequence();

    // 기본정보 데이터 등록 쿼리
    int insertBasicInfo(final CreateBasicInfoRequest request);

    // 연구분야 데이터 등록 쿼리
    int insertRndFields(@Param("rndFields") final List<RndField> rndFields);

    // 기본정보 데이터 조회 쿼리__과제명/계획서번호
    BasicInfoResponse selectTaskNameAndTaskNoByRndPlanNo(final Long rndPlanNo);

    // 기본정보 데이터 조회 쿼리__연구분야
    List<RndField> selectRndFieldsByRndPlanNo(final Long rndPlanNo);

    // 연구분야 데이터 삭제 쿼리
    int deleteRndFieldsByRndPlanNo(final Long rndPlanNo);

    // 과제명 데이터 수정 쿼리
    int updateTaskNameByRndPlanNo(@Param("rndPlanNo") final Long rndPlanNo,
                                  @Param("taskName") String taskName);

}