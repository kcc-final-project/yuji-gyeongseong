package com.yujigyeongseong.api.domain.rnd_plan.dto.response;

import com.yujigyeongseong.api.domain.rnd_plan.dto.RndField;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

import java.util.List;

@RequiredArgsConstructor
@Getter
public class BasicInfoResponse {

    private final String taskName;
    private final String rndTaskNo;
    private List<RndField> rndFields;

    public void assignRndFields(List<RndField> rndFields) {
        this.rndFields = rndFields;
    }

}
