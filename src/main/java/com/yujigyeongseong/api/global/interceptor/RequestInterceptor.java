package com.yujigyeongseong.api.global.interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.servlet.HandlerInterceptor;

import static org.springframework.web.context.request.RequestAttributes.SCOPE_REQUEST;

@Component
public class RequestInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        RequestContextHolder.getRequestAttributes()
                .setAttribute("requestURI", request.getRequestURI(), SCOPE_REQUEST);
        return true;
    }

}
