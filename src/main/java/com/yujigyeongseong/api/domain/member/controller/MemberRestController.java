package com.yujigyeongseong.api.domain.member.controller;

import com.yujigyeongseong.api.domain.member.dto.Institution;
import com.yujigyeongseong.api.domain.member.dto.SignUpMember;
import com.yujigyeongseong.api.domain.member.dto.request.SelectInstitutionRequest;
import com.yujigyeongseong.api.domain.member.service.MemberService;
import com.yujigyeongseong.api.global.auth.PrincipalDetail;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
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

    @PostMapping("/update")
    public ResponseEntity<String> updateMember(@RequestBody SignUpMember signUpMember) {

        try {
            boolean update = memberService.updateMember(signUpMember);

            if (update) {
                return ResponseEntity.ok("회원 정보가 성공적으로 업데이트되었습니다.");
            } else {
                return ResponseEntity.badRequest().body("회원 정보 업데이트에 실패했습니다. 입력된 정보를 확인해주세요.");
            }
        } catch (Exception ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("서버 에러가 발생했습니다: " + ex.getMessage());
        }
    }

    @PostMapping("/check/password")
    public ResponseEntity<String> checkPassword(@AuthenticationPrincipal PrincipalDetail principalDetail, @RequestBody Map<String, String> request) {
        String rawPassword = request.get("password");
        String encodedPassword = principalDetail.getPassword();

        // 비밀번호 확인 로직
        boolean isPasswordCorrect = passwordEncoder.matches(rawPassword, encodedPassword);

        if (isPasswordCorrect) {
            return ResponseEntity.ok("비밀번호가 일치합니다.");
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("비밀번호가 일치하지 않습니다.");
        }
    }

    @DeleteMapping("/delete-member")
    public ResponseEntity<String> deleteMember(@RequestBody Map<String, Long> request, HttpSession session) {
        Long memNo = request.get("memNo");


        // 삭제 로직 수행
        boolean isDeleted = memberService.deleteMemberById(memNo);

        if (isDeleted) {
            session.invalidate();
            return ResponseEntity.ok("회원이 성공적으로 삭제되었습니다.");
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("해당 회원을 찾을 수 없습니다.");
        }
    }



}
