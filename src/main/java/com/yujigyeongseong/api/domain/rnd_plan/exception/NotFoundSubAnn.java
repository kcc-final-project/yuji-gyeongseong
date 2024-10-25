package com.yujigyeongseong.api.domain.rnd_plan.exception;

import com.yujigyeongseong.api.global.exception.ErrorCode;
import com.yujigyeongseong.api.global.exception.type.NotFoundException;

public class NotFoundSubAnn extends NotFoundException {

    public NotFoundSubAnn() {
        super(ErrorCode.SUB_ANN_NOT_FOUND);
    }

}
