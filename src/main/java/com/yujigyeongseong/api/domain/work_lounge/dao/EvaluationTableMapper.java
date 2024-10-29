package com.yujigyeongseong.api.domain.work_lounge.dao;

import com.yujigyeongseong.api.domain.work_lounge.dto.EvaluationTableDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.FormDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.PaperDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.SelectEvaluationDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface EvaluationTableMapper {
    public List<EvaluationTableDTO> announceList();

    public List<FormDTO> subannounceList(String subTitle);

    public List<PaperDTO> paperList(String name, String formType);

    public List<PaperDTO> questionList(String name);

}
