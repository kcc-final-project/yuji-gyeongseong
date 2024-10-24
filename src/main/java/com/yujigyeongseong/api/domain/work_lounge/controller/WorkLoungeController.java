package com.yujigyeongseong.api.domain.work_lounge.controller;

import ch.qos.logback.core.net.SyslogOutputStream;
import com.yujigyeongseong.api.domain.work_lounge.dto.*;
import com.yujigyeongseong.api.domain.work_lounge.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Map;

@RequestMapping("/work-lounge")
@Controller
public class WorkLoungeController {

    private final EvaluationPaperService evaluationPaperService;
    private final RegisterListService registerListService;
    private final EvaluationTaskListService evaluationTaskListService;
    private final SelectEvaluationService selectEvaluationService;
    private final SharingOpinionService sharingOpinionService;
    private final BoardService boardService;

    @Autowired
    public WorkLoungeController(EvaluationPaperService evaluationPaperService, RegisterListService registerListService, EvaluationTaskListService evaluationTaskListService, SelectEvaluationService selectEvaluationService, SharingOpinionService sharingOpinionService, BoardService boardService) {
        this.evaluationPaperService = evaluationPaperService;
        this.registerListService = registerListService;
        this.evaluationTaskListService = evaluationTaskListService;
        this.selectEvaluationService = selectEvaluationService;
        this.sharingOpinionService = sharingOpinionService;
        this.boardService = boardService;
    }

    @GetMapping
    public String getWorkLoungePage() {
        return "work-lounge/work-lounge";
    }

    @GetMapping("/business-timeline")
    public String getWorkLoungeBusinessTimelinePage() {
        return "work-lounge/business-timeline";
    }

    @GetMapping("/evaluation-table")
    public String getWorkLoungeEvaluationTablePage() {
        return "work-lounge/evaluation-table";
    }

    @GetMapping("/evaluation-paper")
    public String getWorkLoungeEvaluationPaperPage() {
        return "work-lounge/evaluation-paper";
    }

    @GetMapping("/sharing-opinion")
    public String getWorkLoungeSharingOpinionPage() {
        return "work-lounge/sharing-opinion";
    }

    @GetMapping("/register-list")
    public String getWorkLoungeRegisterListPage() {
        return "work-lounge/register-list";
    }

    @GetMapping("/evaluation-task-list")
    public String getWorkLoungeEvaluationTaskListPage() {
        return "work-lounge/evaluation-task-list";
    }

    @GetMapping("/selection-evaluation")
    public String getWorkLoungeSelectionEvaluationPage() {
        return "work-lounge/selection-evaluation";
    }

    @GetMapping("/selection-evaluation-detail")
    public String getWorkLoungeSelectionEvaluationDetailPage() {
        return "work-lounge/selection-evaluation-detail";
    }

    @GetMapping("/radar-chart")
    public String getWorkLoungeRadarChartPage() {
        return "work-lounge/radar-chart";
    }

    @GetMapping("/bubble-chart")
    public String getWorkLoungeBubbleChartPage() {
        return "work-lounge/bubble-chart";
    }

    @GetMapping("/eval-compose")
    public String getWorkLoungeEvalComposePage() {
        return "work-lounge/eval-committee-compose";
    }

    @GetMapping("/evaluation-paper/{rndPlanNo}/{memNo}")
    public String getEvaluationPapersAndContentList(
            @PathVariable Integer rndPlanNo,
            @PathVariable Integer memNo,
            Model model) {

        List<EvaluationPaperDTO> paperList = evaluationPaperService.getEvaluationPapers(rndPlanNo, memNo);

        model.addAttribute("paperList", paperList);

        return "work-lounge/evaluation-paper";
    }

    @GetMapping("/register-list/{memNo}")
    public String getRegisterAndCompleteList(@PathVariable("memNo") Integer memNo, Model model) {
        List<RegisterListDTO> registerList = registerListService.getRegisterList(memNo);
        List<RegisterListDTO> completeList = registerListService.getCompleteList(memNo);

        model.addAttribute("registerList", registerList);
        model.addAttribute("completeList", completeList);

        return "work-lounge/register-list";
    }

    @GetMapping("/evaluation-task-lists")
    public ModelAndView getEvaluationTaskList() {
        List<EvaluationTaskListDTO> committeeList = evaluationTaskListService.getEvaluationCommitteeList();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("committeeList", committeeList);
        modelAndView.setViewName("work-lounge/evaluation-task-list");
        return modelAndView;
    }

    @GetMapping("/selection-evaluations")
    public ModelAndView getSelectEvaluationList() {
        List<SelectEvaluationDTO> selectEvaluationList = selectEvaluationService.getSelectEvaluationList();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("selectEvaluationList", selectEvaluationList);
        modelAndView.setViewName("work-lounge/selection-evaluation");
        return modelAndView;
    }

    @GetMapping("/sharing-opinion/{taskName}")
    public String getRegisterAndCompleteList(@PathVariable("taskName") String taskName, Model model) {
        List<SharingOpinionDTO> sharingOpinionList = sharingOpinionService.getSelectSharingOpinionList(taskName);
        List<SharingOpinionDTO> committeePersonList = sharingOpinionService.getSelectCommitteePersonList(taskName);

        model.addAttribute("sharingOpinionList", sharingOpinionList);
        model.addAttribute("committeePersonList", committeePersonList);

        return "work-lounge/sharing-opinion";
    }

    @GetMapping("/board-list")
    public String getBoardLists(Model model) {
        List<Board> boardList = boardService.getBoardLists();
        model.addAttribute("boardList", boardList);

        return "work-lounge/board-list";
    }

    @RequestMapping("/board_insert")
    public String boardInsert() {
        return "work-lounge/board_write";
    }

    @RequestMapping("/board_complete")
    public String getBoardInserts(Board board, RedirectAttributes rttr) {
        boardService.insertBoard(board);

        rttr.addFlashAttribute("board", board.getOpinionNo());

        return "redirect:/work-lounge/board-list";
    }

    @GetMapping("/board_detail/{opinionNo}")
    public String getBoardDetail(@PathVariable("opinionNo") Integer opinionNo, Model model) {
        Board board = boardService.getBoard(opinionNo);
        if (board == null) {
            return "redirect:/work-lounge/board-list";
        }

        boardService.updateBoard(opinionNo);

        model.addAttribute("board", board);

        return "/work-lounge/board_detail";
    }

    @RequestMapping("/board_reply")
    public String BoardReply() {
        return "/work-lounge/board_replywrite";
    }

    @RequestMapping("/board_replycomplete")
    public String getBoardReplys(Board board) {

        Board baseBoard = boardService.getBoard(board.getOpinionNo());

        if (baseBoard == null) {
            return "redirect:/work-lounge/board-list";
        }

        boardService.updateStep(baseBoard);

        board.setRef(baseBoard.getRef());
        board.setStep(baseBoard.getStep() + 1);
        board.setDepth(baseBoard.getDepth() + 1);

        boardService.insertReply(board);

        return "redirect:/work-lounge/board-list";
    }

    @PutMapping("/board_delete/{opinionNo}")
    public ModelAndView BoardDelete(@PathVariable Integer opinionNo) {
        ModelAndView mav = new ModelAndView();

        try {
            Board board = boardService.getBoard(opinionNo);
            if (board == null) {
                mav.setViewName("redirect:/work-lounge/board-list");
                return mav;
            }

            board.setContent("삭제된 게시글 입니다.");
            board.setMemNo(0);

            boardService.deleteBoard(board);

            mav.setViewName("redirect:/work-lounge/board-list");
        } catch (Exception e) {
            mav.setViewName("redirect:/work-lounge/board-list");
        }

        return mav;
    }


    @RequestMapping("/board_modify")
    public String BoardModify(@RequestParam Integer opinionNo, Model model) {
        Board board = boardService.getBoard(opinionNo);
        model.addAttribute("board", board);
        return "/work-lounge/board_modify";
    }


    @PutMapping("/board_modify/{opinionNo}")
    public ResponseEntity<String> modifyBoard(@PathVariable Integer opinionNo, @RequestBody Board board) {

        board.setOpinionNo(opinionNo);
        boolean isModified = boardService.modifyBoard(board);

        if (isModified) {
            return ResponseEntity.ok("게시글이 수정되었습니다.");
        } else {
            return ResponseEntity.status(400).body("수정 중 오류가 발생했습니다.");
        }
    }

}
