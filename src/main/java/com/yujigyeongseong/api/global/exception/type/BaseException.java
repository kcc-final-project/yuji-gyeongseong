package com.yujigyeongseong.api.global.exception.type;

import com.yujigyeongseong.api.global.exception.ErrorCode;
import lombok.Getter;

@Getter
public class BaseException extends RuntimeException {

    protected final ErrorCode errorCode;

    protected BaseException(final ErrorCode errorCode) {
        super(errorCode.getMessage());
        this.errorCode = errorCode;
    }

}
