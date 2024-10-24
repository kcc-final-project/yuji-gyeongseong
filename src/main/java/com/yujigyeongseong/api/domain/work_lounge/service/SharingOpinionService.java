package com.yujigyeongseong.api.domain.work_lounge.service;

import com.yujigyeongseong.api.domain.work_lounge.dto.SelectEvaluationDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.SharingOpinionDTO;

import java.util.List;

public interface SharingOpinionService {
    public List<SharingOpinionDTO> getSelectSharingOpinionList(String taskName);

    public List<SharingOpinionDTO> getSelectCommitteePersonList(String taskName);
}
