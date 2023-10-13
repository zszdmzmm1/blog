package com.auefly.controller.advice;

import com.auefly.util.R;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class ExceptionController {
    @ExceptionHandler(Exception.class)
    public R exception(Exception e) {
        return R.fail(e.getClass() + ":" + e.getMessage());
    }
}
