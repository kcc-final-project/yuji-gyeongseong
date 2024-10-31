package com.yujigyeongseong.api.domain.rnd_plan.exception;

import com.yujigyeongseong.api.global.exception.ErrorCode;
import com.yujigyeongseong.api.global.exception.type.NotFoundException;

public class NotFoundInstitutionInfo extends NotFoundException {

    public NotFoundInstitutionInfo() {
        super(ErrorCode.INSTITUTION_INFO_NOT_FOUND);
    }

}
