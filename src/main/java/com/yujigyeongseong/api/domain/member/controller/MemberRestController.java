package com.yujigyeongseong.api.domain.member.controller;

import com.yujigyeongseong.api.domain.member.dto.Institution;
import com.yujigyeongseong.api.domain.member.dto.SignUpMember;
import com.yujigyeongseong.api.domain.member.dto.request.SelectInstitutionRequest;
import com.yujigyeongseong.api.domain.member.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberRestController {
    private final MemberService memberService;

    private final PasswordEncoder passwordEncoder;

    @PostMapping("/duplicateCheck")
    public ResponseEntity<?> duplicateId(@RequestBody Map<String, String> request) {
        String id = request.get("id");
        boolean isCheck = memberService.countByUsername(id);
        if (!isCheck) {
            return ResponseEntity.ok("아이디 중복체크 완료 ! ");
        } else {
            return ResponseEntity.badRequest().body("아이디가 중복되었습니다.");
        }
    }

    @GetMapping("/search/icon")
    public List<Institution> selectIcon() {
        List<Institution> institutions = memberService.selectAll();
        for (int i = 0; i < institutions.size(); i++) {
        }
        return institutions;
    }

    @GetMapping("/search/organ")
    public List<Institution> selectOrgan(
            @RequestParam String name,
            @RequestParam String businessRegisterNo,
            @RequestParam String companyType) {

        List<Institution> institutions;
        SelectInstitutionRequest selectInstitutionRequest = new SelectInstitutionRequest(name, businessRegisterNo, companyType);
        institutions = memberService.selectOrgan(selectInstitutionRequest);
        return institutions;
    }

    @PostMapping("/sign/complete")
    public ResponseEntity<?> insertMember(@RequestBody SignUpMember signUpMember) {

        String encodedPassword = passwordEncoder.encode(signUpMember.getPassword());
        signUpMember.setPassword(encodedPassword);
        boolean isCheck = memberService.insertMember(signUpMember);
        if (isCheck) {
            return ResponseEntity.ok("성공");
        } else {
            return ResponseEntity.badRequest().body("실패");
        }
    }

    @GetMapping("/login/fail")
    public String loginFail() {
        return "로그인 실페";
    }
}
