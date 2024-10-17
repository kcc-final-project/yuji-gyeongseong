package com.yujigyeongseong.api.domain.rnd_plan.exception;

import com.yujigyeongseong.api.global.exception.ErrorCode;
import com.yujigyeongseong.api.global.exception.type.NotFoundException;

public class NotFoundRndPlanBasic extends NotFoundException {

    public NotFoundRndPlanBasic() {
        super(ErrorCode.RND_PLAN_BASIC_NOT_FOUND);
    }

}
