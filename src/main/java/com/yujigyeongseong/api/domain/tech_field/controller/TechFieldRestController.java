package com.yujigyeongseong.api.domain.tech_field.controller;

import com.yujigyeongseong.api.domain.tech_field.dto.TechFieldForRndPlanBasic;
import com.yujigyeongseong.api.domain.tech_field.service.TechFieldService;
import com.yujigyeongseong.api.global.dto.response.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.javassist.NotFoundException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import static org.springframework.http.HttpStatus.OK;

@RequestMapping("/api/v1/tech-fields")
@RestController
@RequiredArgsConstructor
public class TechFieldRestController {

    private final TechFieldService techFieldService;

    @GetMapping("/rnd-plan/basic")
    public ResponseEntity<?> getTechFieldsForRndPlanBasic() throws NotFoundException {
        List<TechFieldForRndPlanBasic> techFields = techFieldService.getTechFieldsForRndPlanBasic();
        return ApiResponse.success(OK, techFields);
    }

}
