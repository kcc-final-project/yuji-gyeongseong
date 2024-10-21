package com.yujigyeongseong.api.global.dto.response;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import java.time.LocalDateTime;

import static org.springframework.http.MediaType.APPLICATION_JSON;

@NoArgsConstructor(access = AccessLevel.PRIVATE)
@Getter
public class ApiResponse<T> {

    private LocalDateTime timestamp;
    private String path;
    private boolean success;
    private T data;

    public ApiResponse(String path, boolean success) {
        timestamp = LocalDateTime.now();
        this.path = path;
        this.success = success;
    }

    public ApiResponse(String path, boolean success, T data) {
        timestamp = LocalDateTime.now();
        this.path = path;
        this.success = success;
        this.data = data;
    }

    public static <T> ResponseEntity<ApiResponse<T>> success(HttpStatus status) {
        String path = (String) RequestContextHolder.getRequestAttributes()
                .getAttribute("requestURI", RequestAttributes.SCOPE_REQUEST);

        return ResponseEntity
                .status(status)
                .contentType(APPLICATION_JSON)
                .body(new ApiResponse<>(path, true));
    }

    public static <T> ResponseEntity<ApiResponse<T>> success(HttpStatus status, T data) {
        String path = (String) RequestContextHolder.getRequestAttributes()
                .getAttribute("requestURI", RequestAttributes.SCOPE_REQUEST);

        return ResponseEntity
                .status(status)
                .contentType(APPLICATION_JSON)
                .body(new ApiResponse<>(path, true, data));
    }

    public static <T> ResponseEntity<ApiResponse<T>> fail(HttpStatus status, T data) {
        String path = (String) RequestContextHolder.getRequestAttributes()
                .getAttribute("requestURI", RequestAttributes.SCOPE_REQUEST);

        return ResponseEntity
                .status(status)
                .contentType(APPLICATION_JSON)
                .body(new ApiResponse<>(path, false, data));
    }

}
