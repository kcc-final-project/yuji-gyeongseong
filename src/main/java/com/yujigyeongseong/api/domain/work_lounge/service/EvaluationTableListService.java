package com.yujigyeongseong.api.domain.work_lounge.service;

import com.yujigyeongseong.api.domain.work_lounge.dto.*;

import java.util.List;

public interface EvaluationTableListService {
    List<EvaluationTableDTO> getAnnounceList();

    List<FormDTO> getSubannounceList(String totalTitle);

    List<PaperDTO> getPaperList(String name, String formType);

    List<PaperDTO> getquestionList(String name);

    //질문지 저장 용도
    public void createEvaluationForm(EvaluationTable evaluationTable, List<Question> questions);
}
