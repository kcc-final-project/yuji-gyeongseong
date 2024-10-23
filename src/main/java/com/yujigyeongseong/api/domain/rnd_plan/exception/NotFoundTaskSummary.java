package com.yujigyeongseong.api.domain.rnd_plan.exception;

import com.yujigyeongseong.api.global.exception.ErrorCode;
import com.yujigyeongseong.api.global.exception.type.NotFoundException;

public class NotFoundTaskSummary extends NotFoundException {

    public NotFoundTaskSummary() {
        super(ErrorCode.TASK_SUMMARY_NOT_FOUND);
    }

}
