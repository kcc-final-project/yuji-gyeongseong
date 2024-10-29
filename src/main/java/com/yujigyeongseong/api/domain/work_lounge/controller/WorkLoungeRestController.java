package com.yujigyeongseong.api.domain.work_lounge.controller;

import com.yujigyeongseong.api.domain.work_lounge.dto.*;
import com.yujigyeongseong.api.domain.work_lounge.service.*;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Value;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RequestMapping("/api/v1/work_lounge")
@RestController
public class WorkLoungeRestController {

    private final EvaluationTaskListService evaluationTaskListService;
    private final EvaluationPaperService evaluationPaperService;
    private final SelectEvaluationService selectEvaluationService;
    private final EvaluationTableListService evaluationTableListService;

    @Autowired
    public WorkLoungeRestController(EvaluationTaskListService evaluationTaskListService, EvaluationPaperService evaluationPaperService, SelectEvaluationService selectEvaluationService, EvaluationTableListService evaluationTableListService) {
        this.evaluationTaskListService = evaluationTaskListService;
        this.evaluationPaperService = evaluationPaperService;
        this.selectEvaluationService = selectEvaluationService;
        this.evaluationTableListService = evaluationTableListService;
    }

    @GetMapping(value = "/getText", produces = "text/plain; charset=UTF-8")
    public String getText() {
        return "안녕하세요";
    }

    @GetMapping("/evaluation-task-list/{name}")
    @ResponseBody
    public ResponseEntity<List<EvaluationTaskListsDTO>> getEvaluationTaskList(@PathVariable String name) {
        List<EvaluationTaskListsDTO> taskList = evaluationTaskListService.getEvaluationTaskList(name);
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
        System.out.println(committeeList);
        return committeeList == null ? new ResponseEntity<>(null, HttpStatus.NOT_FOUND) : new ResponseEntity<>(committeeList, HttpStatus.OK);
    }

    /* 전자평가표 */
    @GetMapping("/evaluation-table/{subTitle}")
    @ResponseBody
    public ResponseEntity<List<FormDTO>> getSubannounceList(@PathVariable String subTitle) {
        List<FormDTO> subannounceList = evaluationTableListService.getSubannounceList(subTitle);
        System.out.println(subannounceList);
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
        System.out.println(questionList);
        return questionList == null ? new ResponseEntity<>(null, HttpStatus.NOT_FOUND) : new ResponseEntity<>(questionList, HttpStatus.OK);
    }

}
