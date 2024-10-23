package com.yujigyeongseong.api.global.exception;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;


@RequiredArgsConstructor
@Getter
public enum ErrorCode {

    SERVER_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, "SYS_500", "서버에 오류가 발생했습니다."),
    BAD_REQUEST(HttpStatus.BAD_REQUEST, "SYS_400", "요청이 잘못되었습니다. 입력하신 정보를 확인해 주세요."),

    BASIC_INFO_NOT_FOUND(HttpStatus.NOT_FOUND, "RND_BI_404", "존재하지 않는 연구개발계획서(기본 정보)입니다."),
    RND_PLAN_NOT_FOUND(HttpStatus.NOT_FOUND, "RND_RP_404", "존재하지 않는 과제정보입니다."),
    TASK_SUMMARY_NOT_FOUND(HttpStatus.NOT_FOUND, "RND_TS_404", "존재하지 않는 과제요약 정보입니다.");

    private final HttpStatus status;
    private final String code;
    private final String message;

}
