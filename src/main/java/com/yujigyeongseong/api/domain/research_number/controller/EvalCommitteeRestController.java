package com.yujigyeongseong.api.domain.research_number.controller;

import com.yujigyeongseong.api.domain.research_number.dto.request.SubmitResearchRequest;
import com.yujigyeongseong.api.domain.research_number.service.EvalCommitteeService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/api/v1/research_number")
@RestController
@RequiredArgsConstructor
public class EvalCommitteeRestController {

    private final EvalCommitteeService evalCommitteeService;

    @PostMapping("/register/{memberId}")
    public ResponseEntity<?> registerResearchInformation(@PathVariable Long memberId, @RequestBody SubmitResearchRequest submitRequest) {
        try {
            evalCommitteeService.setCareersByMemberId(memberId, submitRequest.getCareerInfos());
            evalCommitteeService.setAcadAbilitiesByMemberId(memberId, submitRequest.getAcademicInfos());
//            evalCommitteeService.setTechFieldsByMemberId(memberId, submitRequest.getTechnicalInfos());
            return ResponseEntity.ok("Information registered successfully");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Error registering information: " + e.getMessage());
        }
    }
}
