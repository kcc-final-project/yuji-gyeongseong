package com.yujigyeongseong.api.global.exception.type;

import com.yujigyeongseong.api.global.exception.ErrorCode;

// 400
public class BadRequestException extends BaseException {

    protected BadRequestException(final ErrorCode errorCode) {
        super(errorCode);
    }

}
