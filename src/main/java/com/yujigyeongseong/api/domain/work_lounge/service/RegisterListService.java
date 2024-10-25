package com.yujigyeongseong.api.domain.work_lounge.service;

import com.yujigyeongseong.api.domain.work_lounge.dto.EvaluationPaperDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.RegisterListDTO;

import java.util.List;

public interface RegisterListService {
    List<RegisterListDTO> getRegisterList(Integer memNo);

    List<RegisterListDTO> getCompleteList(int memNo);
}
