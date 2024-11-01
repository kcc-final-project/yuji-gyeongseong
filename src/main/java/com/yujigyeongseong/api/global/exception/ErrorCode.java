package com.yujigyeongseong.api.global.exception;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;


@RequiredArgsConstructor
@Getter
public enum ErrorCode {

    // 500
    SERVER_ERROR(HttpStatus.INTERNAL_SERVER_ERROR, "SYS_500", "서버에 오류가 발생했습니다."),

    // 400
    BAD_REQUEST(HttpStatus.BAD_REQUEST, "SYS_400", "요청이 잘못되었습니다. 입력하신 정보를 확인해 주세요."),

    // 404
    SUB_ANN_NOT_FOUND(HttpStatus.NOT_FOUND, "SUB_SA_404", "존재하지 않는 공모분야 입니다."),
    BASIC_INFO_NOT_FOUND(HttpStatus.NOT_FOUND, "RND_BI_404", "존재하지 않는 기본정보 입니다."),
    RND_PLAN_NOT_FOUND(HttpStatus.NOT_FOUND, "RND_RP_404", "존재하지 않는 과제정보 입니다."),
    TASK_SUMMARY_NOT_FOUND(HttpStatus.NOT_FOUND, "RND_TS_404", "존재하지 않는 과제요약 정보 입니다."),
    INSTITUTION_INFO_NOT_FOUND(HttpStatus.NOT_FOUND, "RND_IS_404", "존재하지 않는 작성자 기업 정보 입니다."),
    MEMBER_INFO_NOT_FOUND(HttpStatus.NOT_FOUND, "RND_MB_404", "존재하지 않는 작성자 정보 입니다.");

    private final HttpStatus status;
    private final String code;
    private final String message;

}
