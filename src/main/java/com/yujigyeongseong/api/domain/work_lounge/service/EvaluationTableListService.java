package com.yujigyeongseong.api.domain.work_lounge.service;

import com.yujigyeongseong.api.domain.work_lounge.dto.EvaluationTableDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.FormDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.PaperDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.RegisterListDTO;

import java.util.List;

public interface EvaluationTableListService {
    List<EvaluationTableDTO> getAnnounceList();

    List<FormDTO> getSubannounceList(String totalTitle);

    List<PaperDTO> getPaperList(String name, String formType);

    List<PaperDTO> getquestionList(String name);

}
