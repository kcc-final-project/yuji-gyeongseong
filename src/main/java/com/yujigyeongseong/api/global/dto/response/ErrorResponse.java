package com.yujigyeongseong.api.global.dto.response;

import com.yujigyeongseong.api.global.exception.ErrorCode;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.Map;

@NoArgsConstructor(access = AccessLevel.PRIVATE)
@Getter
public class ErrorResponse {

    private ErrorCode errorCode;
    private Map<String, String> errors;

    @Builder
    private ErrorResponse(ErrorCode errorCode, Map<String, String> errors) {
        this.errorCode = errorCode;
        this.errors = errors;
    }

    public static ErrorResponse of(ErrorCode errorCode, Map<String, String> errors) {
        return ErrorResponse.builder()
                .errorCode(errorCode)
                .errors(errors)
                .build();
    }

}
