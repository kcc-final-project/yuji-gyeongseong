package com.yujigyeongseong.api.domain.rnd_plan.exception;

import com.yujigyeongseong.api.global.exception.ErrorCode;
import com.yujigyeongseong.api.global.exception.type.NotFoundException;

public class NotFoundRndPlan extends NotFoundException {

    public NotFoundRndPlan() {
        super(ErrorCode.RND_PLAN_NOT_FOUND);
    }

}
