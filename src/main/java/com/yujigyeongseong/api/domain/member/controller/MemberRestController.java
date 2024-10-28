package com.yujigyeongseong.api.domain.member.controller;

import com.yujigyeongseong.api.domain.member.DTO.Institution;
import com.yujigyeongseong.api.domain.member.DTO.request.SelectInstitutionRequest;
import com.yujigyeongseong.api.domain.member.service.MemberService;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberRestController {
    private final MemberService memberService;


    @PostMapping("/duplicateCheck")
    public ResponseEntity<?> duplicateId(@RequestBody Map<String,String> request){
        String id = request.get("id");
        boolean isCheck = memberService.countByUsername(id);
        if(!isCheck){
            return ResponseEntity.ok("아이디 중복체크 완료 ! ");
        }else {
            return ResponseEntity.badRequest().body("아이디가 중복되었습니다.");
        }
    }

    @GetMapping("/search/icon")
    public List<Institution> selectIcon(){
        List<Institution> institutions = memberService.selectAll();

        return institutions;
    }

    @GetMapping("/search/organ")
    public List<Institution> selectOrgan(
            @RequestParam String name,
            @RequestParam String businessRegisterNo,
            @RequestParam String companyType){

        List<Institution> institutions;
        SelectInstitutionRequest selectInstitutionRequest = new SelectInstitutionRequest(name, businessRegisterNo, companyType);
        institutions = memberService.selectOrgan(selectInstitutionRequest);
        return institutions;
    }
}
