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

import java.util.List;

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
                                                         @RequestParam("content") String content) {
        try {
            Opinion opinion = new Opinion();
            opinion.setOpinionNo(opinionNo);
            opinion.setContent(content);

//            opinion.setRef(opinion.getOpinionNo());
            opinion.setStep(opinion.getStep());
            opinion.setDepth(opinion.getDepth());

            opinion.setEvalCommitteeNo(1);
            opinion.setRndPlanNo(1);
            opinion.setBucketNo(1);

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
                                                    @RequestParam("content") String content) {
        try {
            Opinion opinion = new Opinion();
            opinion.setOpinionNo(opinionNo);
            opinion.setContent(content);

            opinion.setRef(opinion.getRef());
            opinion.setStep(opinion.getStep() + 1);
            opinion.setDepth(opinion.getDepth() + 1);

            opinion.setEvalCommitteeNo(1);
            opinion.setRndPlanNo(1);
            opinion.setBucketNo(1);

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


}