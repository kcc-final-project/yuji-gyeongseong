package com.yujigyeongseong.api.domain.work_lounge.controller;

import com.yujigyeongseong.api.domain.work_lounge.dto.*;
import com.yujigyeongseong.api.domain.work_lounge.service.*;
import com.yujigyeongseong.api.global.auth.PrincipalDetail;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Value;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/api/v1/work_lounge")
@RestController
@Slf4j
public class WorkLoungeRestController {

    private final EvaluationTaskListService evaluationTaskListService;
    private final EvaluationPaperService evaluationPaperService;
    private final SelectEvaluationService selectEvaluationService;
    private final EvaluationTableListService evaluationTableListService;
    private final SharingOpinionService sharingOpinionService;

    @Autowired
    public WorkLoungeRestController(EvaluationTaskListService evaluationTaskListService, EvaluationPaperService evaluationPaperService, SelectEvaluationService selectEvaluationService, EvaluationTableListService evaluationTableListService, SharingOpinionService sharingOpinionService) {
        this.evaluationTaskListService = evaluationTaskListService;
        this.evaluationPaperService = evaluationPaperService;
        this.selectEvaluationService = selectEvaluationService;
        this.evaluationTableListService = evaluationTableListService;
        this.sharingOpinionService = sharingOpinionService;
    }

    @GetMapping(value = "/getText", produces = "text/plain; charset=UTF-8")
    public String getText() {
        return "안녕하세요";
    }

    @GetMapping("/evaluation-task-list/{name}")
    @ResponseBody
    public ResponseEntity<List<EvaluationTaskListsDTO>> getEvaluationTaskList(@PathVariable String name, @AuthenticationPrincipal PrincipalDetail principal) {
        Integer userId = Math.toIntExact(principal.getId());
        List<EvaluationTaskListsDTO> taskList = evaluationTaskListService.getEvaluationTaskList(name, userId);
        return taskList == null ? new ResponseEntity<>(null, HttpStatus.NOT_FOUND) : new ResponseEntity<>(taskList, HttpStatus.OK);
    }

    @GetMapping("/evaluation-paper/{formType}/{type}")
    @ResponseBody
    public ResponseEntity<List<EvaluationPaperQuestionDTO>> getContentLists(@PathVariable String formType, @PathVariable String type) {
        List<EvaluationPaperQuestionDTO> questionList = evaluationPaperService.getContentLists(formType, type);
        return questionList == null ? new ResponseEntity<>(null, HttpStatus.NOT_FOUND) : new ResponseEntity<>(questionList, HttpStatus.OK);
    }

    @GetMapping("/selection-evaluation-detail/{rndTaskNo}")
    @ResponseBody
    public ResponseEntity<List<SelectEvaluationDTO>> getselectCommittee(@PathVariable String rndTaskNo) {
        List<SelectEvaluationDTO> committeeList = selectEvaluationService.getselectCommittee(rndTaskNo);
        return committeeList == null ? new ResponseEntity<>(null, HttpStatus.NOT_FOUND) : new ResponseEntity<>(committeeList, HttpStatus.OK);
    }

    /* 전자평가표 */
    @GetMapping("/evaluation-table/{subTitle}")
    @ResponseBody
    public ResponseEntity<List<FormDTO>> getSubannounceList(@PathVariable String subTitle) {
        List<FormDTO> subannounceList = evaluationTableListService.getSubannounceList(subTitle);
        return subannounceList == null ? new ResponseEntity<>(null, HttpStatus.NOT_FOUND) : new ResponseEntity<>(subannounceList, HttpStatus.OK);
    }

    // 페이퍼
    @GetMapping("/evaluation-table/{name}/{formType}")
    @ResponseBody
    public ResponseEntity<List<PaperDTO>> getPaperList(@PathVariable String name, @PathVariable String formType) {
        List<PaperDTO> paperList = evaluationTableListService.getPaperList(name, formType);
        System.out.println(paperList);
        return paperList == null ? new ResponseEntity<>(null, HttpStatus.NOT_FOUND) : new ResponseEntity<>(paperList, HttpStatus.OK);
    }

    // 질문 리스트
    @GetMapping("/evaluation-question/{name}")
    @ResponseBody
    public ResponseEntity<List<PaperDTO>> getquestionList(@PathVariable String name) {
        List<PaperDTO> questionList = evaluationTableListService.getquestionList(name);
        return questionList == null ? new ResponseEntity<>(null, HttpStatus.NOT_FOUND) : new ResponseEntity<>(questionList, HttpStatus.OK);
    }

    // 의견공유
    @GetMapping("/opinion")
    @ResponseBody
    public ResponseEntity<List<Opinion>> getSelectSharingOpinionList() {
        List<Opinion> opinionList = sharingOpinionService.getselectOpinionList();
        return opinionList == null ? new ResponseEntity<>(null, HttpStatus.NOT_FOUND) : new ResponseEntity<>(opinionList, HttpStatus.OK);
    }

    //의견 상세
    @GetMapping("/summary-id/{opinionNo}")
    @ResponseBody
    public ResponseEntity<Opinion> getSummaryId(@PathVariable("opinionNo") int opinionNo) {
        Opinion summary = sharingOpinionService.summaryId(opinionNo);
        return summary == null ? new ResponseEntity<>(null, HttpStatus.NOT_FOUND) : new ResponseEntity<>(summary, HttpStatus.OK);
    }

    // 게시글 작성
    // 게시글 작성 요청을 처리하는 메서드
    @PostMapping("/summary-id/{opinionNo}")
    public ResponseEntity<String> insertOpinionReplyList(@PathVariable("opinionNo") int opinionNo,
                                                         @RequestParam("content") String content, @AuthenticationPrincipal PrincipalDetail principal) {
//        log.info("ref = {}", ref);
        try {
            Integer userId = Math.toIntExact(principal.getId());
            Opinion opinion = new Opinion();
            opinion.setOpinionNo(opinionNo);
            opinion.setMemNo(userId);
            opinion.setContent(content);

//            log.info("ref = {}", ref);
//            opinion.setRef(ref);
            opinion.setStep(opinion.getStep());
            opinion.setDepth(opinion.getDepth());

            opinion.setEvalCommitteeNo(1);
            opinion.setRndPlanNo(1);
            opinion.setBucketNo(1);
//            log.info("ref = {}", ref);
            int result = sharingOpinionService.insertOpinionReplyList(opinion);

            if (result > 0) {
                return ResponseEntity.ok("댓글 작성 성공");
            } else {
                return ResponseEntity.status(500).body("댓글 작성 실패");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("서버 에러 발생");
        }
    }


    //댓글 작성
    @PostMapping("/post/{opinionNo}")
    public ResponseEntity<String> insertOpinionList(@PathVariable("opinionNo") int opinionNo,
                                                    @RequestParam("ref") int ref,
                                                    @RequestParam("content") String content, @AuthenticationPrincipal PrincipalDetail principal) {
        try {
            Integer userId = Math.toIntExact(principal.getId());
            // Opinion 객체 생성
            Opinion opinion = new Opinion();

            // 받은 파라미터를 Opinion 객체에 설정
            opinion.setOpinionNo(opinionNo);
            opinion.setRef(ref);  // ref 값 설정
            opinion.setContent(content);
            opinion.setMemNo(userId);  // 예시로 memNo를 1로 설정, 실제로는 로그인 사용자 ID로 설정해야 함
            opinion.setStep(opinion.getStep() + 1);
            opinion.setDepth(opinion.getDepth() + 1);; // 기본값으로 설정, 필요에 따라 업데이트
            opinion.setEvalCommitteeNo(1);  // 예시로 설정
            opinion.setRndPlanNo(1);  // 예시로 설정
            opinion.setBucketNo(1);  // 예시로 설정

            // DB에 댓글을 추가하는 서비스 호출
            int result = sharingOpinionService.insertOpinionList(opinion);

            if (result > 0) {
                return ResponseEntity.ok("댓글 작성 성공");
            } else {
                return ResponseEntity.status(500).body("댓글 작성 실패");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("서버 에러 발생");
        }
    }

    // 선정 버튼
    @PostMapping("/update-plan-status/{rndPlanNo}")
    public ResponseEntity<?> updatePlanStatus(@PathVariable("rndPlanNo") int rndPlanNo, @RequestBody Map<String, String> request) {
        String planStatus = request.get("planStatus");

        // 서비스 계층에서 DB 업데이트 호출
        int updateCount = selectEvaluationService.updatePlanStatus(rndPlanNo, planStatus);

        if (updateCount > 0) {
            return ResponseEntity.ok().build();
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }


    //저장용도
    // 새로운 평가 설문지 생성
    @PostMapping("/newForm")
    public ResponseEntity<String> createEvaluationForm(@RequestBody EvaluationFormRequest request) {
        try {
            // 필수 값 검증 - 질문이 없을 경우 예외 처리
            if (request.getQuestions() == null || request.getQuestions().isEmpty()) {
                throw new IllegalArgumentException("At least one question must be provided.");
            }

            // EvaluationTable 객체 생성 및 필드 설정
            EvaluationTable evaluationTable = new EvaluationTable();
            evaluationTable.setTitle(request.getTitle());
            evaluationTable.setDescription(request.getDescription());
            evaluationTable.setFormType(request.getFormType());
            evaluationTable.setTechFieldNo(request.getTechFieldNo());

            // 질문 리스트 설정
            List<Question> questions = request.getQuestions();

            // 서비스 메서드 호출하여 평가 설문지 생성
            evaluationTableListService.createEvaluationForm(evaluationTable, questions);

            return ResponseEntity.status(HttpStatus.CREATED).body("Evaluation form created successfully.");
        } catch (IllegalArgumentException e) {
            // 클라이언트 오류 (잘못된 요청)
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("Invalid input: " + e.getMessage());
        } catch (Exception e) {
            // 서버 오류 (예기치 않은 오류)
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Failed to create evaluation form: " + e.getMessage());
        }
    }

    // 선정확정용 진행 상태
    @PostMapping("/prog-status/{subAnnNo}")
    public ResponseEntity<?> progStatus(@PathVariable("subAnnNo") Long subAnnNo) {
        int progStatus = selectEvaluationService.updateProgStatus(subAnnNo);

        if (progStatus <= 0) {
            return ResponseEntity.noContent().build();
        } else {
            return ResponseEntity.ok(progStatus);
        }
    }

    // 의견공유 평가위원
    @GetMapping("/researcher/{evalCommitteeNo}")
    public List<SharingOpinionDTO> getResearcherOpinions(
            @PathVariable("evalCommitteeNo") int evalCommitteeNo,
            @AuthenticationPrincipal PrincipalDetail principal) {

        Integer userId = Math.toIntExact(principal.getId());

        // Service의 researcher 메서드를 호출하여 결과를 반환
        return sharingOpinionService.researcher(evalCommitteeNo, userId);
    }



    //여러개 선정 버튼
//    @PutMapping("/updatePlanStatus")
//    public ResponseEntity<String> updatePlanStatus(@RequestBody List<Integer> rndPlanNoList) {
//        try {
//            selectEvaluationService.updatePlanStatus(rndPlanNoList);
//            return new ResponseEntity<>("Plan status updated successfully", HttpStatus.OK); }
//        catch (Exception e) {
//            return new ResponseEntity<>("Failed to update plan status", HttpStatus.INTERNAL_SERVER_ERROR);
//        }
//    }

//    @PostMapping("/updatePlanStatus")
//    public void updatePlanStatus(@RequestBody List<UpdatePlanStatusDto> requestDtos) {
//        selectEvaluationService.updatePlanStatusBatch(requestDtos);
//    }

    // 상태 업데이트 API
//    @PutMapping("/update-status")
//    public String updateStatus(@RequestParam Long subAnnNo, @RequestParam int rndPlanNo) {
//        Map<String, Object> params = new HashMap<>();
//        params.put("subAnnNo", subAnnNo);
//        params.put("rndPlanNo", rndPlanNo);
//
//        try {
//            selectEvaluationService.updatePlanStatus(params);
//            return "상태 업데이트가 완료되었습니다.";
//        } catch (Exception e) {
//            return "상태 업데이트 중 오류가 발생했습니다.";
//        }
//    }




}