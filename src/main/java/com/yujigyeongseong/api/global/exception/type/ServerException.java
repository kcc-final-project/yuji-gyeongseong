package com.yujigyeongseong.api.global.exception.type;

import com.yujigyeongseong.api.global.exception.ErrorCode;

// 500
public class ServerException extends BaseException {

    protected ServerException(final ErrorCode errorCode) {
        super(errorCode);
    }

}
