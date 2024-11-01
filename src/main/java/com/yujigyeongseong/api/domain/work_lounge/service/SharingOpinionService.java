package com.yujigyeongseong.api.domain.work_lounge.service;

import com.yujigyeongseong.api.domain.work_lounge.dto.Board;
import com.yujigyeongseong.api.domain.work_lounge.dto.Opinion;
import com.yujigyeongseong.api.domain.work_lounge.dto.SelectEvaluationDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.SharingOpinionDTO;

import java.util.List;

public interface SharingOpinionService {
    public List<SharingOpinionDTO> getSelectSharingOpinionList(int rndPlanNo);

    public List<SharingOpinionDTO> evalPeople(int rndPlanNo);

    public List<SharingOpinionDTO> getSelectCommitteePersonList(String taskName);

    public List<Opinion> getselectOpinionList();

    public Opinion summaryId(int opinionNo);

    public int insertOpinionReplyList(Opinion opinion);



}
