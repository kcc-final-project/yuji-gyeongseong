package com.yujigyeongseong.api.global.exception.type;

import com.yujigyeongseong.api.global.exception.ErrorCode;

// 404
public class NotFoundException extends BaseException {

    protected NotFoundException(final ErrorCode errorCode) {
        super(errorCode);
    }

}
