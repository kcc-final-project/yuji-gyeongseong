package com.yujigyeongseong.api.domain.rnd_plan.exception;

import com.yujigyeongseong.api.global.exception.ErrorCode;
import com.yujigyeongseong.api.global.exception.type.NotFoundException;

public class NotFoundBasicInfo extends NotFoundException {

    public NotFoundBasicInfo() {
        super(ErrorCode.BASIC_INFO_NOT_FOUND);
    }

}
