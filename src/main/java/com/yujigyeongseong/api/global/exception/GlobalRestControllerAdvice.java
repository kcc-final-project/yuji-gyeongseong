/*
package com.yujigyeongseong.api.global.exception;

import com.yujigyeongseong.api.global.dto.response.ApiResponse;
import com.yujigyeongseong.api.global.dto.response.ErrorResponse;
import com.yujigyeongseong.api.global.exception.type.NotFoundException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.http.converter.HttpMessageNotWritableException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import static org.springframework.http.HttpStatus.NOT_FOUND;

@RestControllerAdvice
@Slf4j
public class GlobalRestControllerAdvice {

    // 404
    @ExceptionHandler(NotFoundException.class)
    protected ResponseEntity<?> handle(NotFoundException ex) {
        log.error("[{}] [{}] - {}", ex.getErrorCode().getStatus(), ex.getErrorCode().getCode(), ex.getMessage());
        return ApiResponse.fail(NOT_FOUND, ErrorResponse.of(ex.getErrorCode(), null));
    }

    // TODO: 지원하지 않은 HTTP method 호출 시 발생
    @ExceptionHandler(HttpRequestMethodNotSupportedException.class)
    protected ResponseEntity<?> handle(HttpRequestMethodNotSupportedException ex) {
        return null;
    }

    // TODO: 잘못된 형식 요청 시 발생
    @ExceptionHandler(HttpMessageNotReadableException.class)
    protected ResponseEntity<?> handle(HttpMessageNotReadableException ex) {
        return null;
    }

    // TODO: 서버에서 응답을 생성하는 과정에 문제가 발생
    @ExceptionHandler(HttpMessageNotWritableException.class)
    protected ResponseEntity<?> handle(HttpMessageNotWritableException ex) {
        return null;
    }

    // TODO: 유효성 실패 시 발생
    @ExceptionHandler(MethodArgumentNotValidException.class)
    protected ResponseEntity<?> handle(MethodArgumentNotValidException ex) {
        return null;
    }

    // TODO: [500] INTERNAL_SERVER_ERROR
    @ExceptionHandler(Exception.class)
    protected ResponseEntity<?> handle(Exception ex) {
        return null;
    }

}
*/
