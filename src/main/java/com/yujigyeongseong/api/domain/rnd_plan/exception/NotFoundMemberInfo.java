package com.yujigyeongseong.api.domain.rnd_plan.exception;

import com.yujigyeongseong.api.global.exception.ErrorCode;
import com.yujigyeongseong.api.global.exception.type.NotFoundException;

public class NotFoundMemberInfo extends NotFoundException {

    public NotFoundMemberInfo() {
        super(ErrorCode.MEMBER_INFO_NOT_FOUND);
    }

}
