package com.yujigyeongseong.api.domain.work_lounge.controller;

import com.yujigyeongseong.api.domain.work_lounge.dto.EvaluationPaperQuestionDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.EvaluationTaskListDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.EvaluationTaskListsDTO;
import com.yujigyeongseong.api.domain.work_lounge.service.EvaluationPaperService;
import com.yujigyeongseong.api.domain.work_lounge.service.EvaluationTaskListService;
import com.yujigyeongseong.api.domain.work_lounge.service.RegisterListService;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Value;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/api/v1/work_lounge")
@RestController
public class WorkLoungeRestController {

    private final EvaluationTaskListService evaluationTaskListService;
    private final EvaluationPaperService evaluationPaperService;

    @Autowired
    public WorkLoungeRestController(EvaluationTaskListService evaluationTaskListService, EvaluationPaperService evaluationPaperService) {
        this.evaluationTaskListService = evaluationTaskListService;
        this.evaluationPaperService = evaluationPaperService;
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

}
