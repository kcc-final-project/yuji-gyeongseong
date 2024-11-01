package com.yujigyeongseong.api.domain.work_lounge.service;


import com.yujigyeongseong.api.domain.work_lounge.dao.BoardMapper;
import com.yujigyeongseong.api.domain.work_lounge.dto.Board;
import com.yujigyeongseong.api.domain.work_lounge.dto.EvaluationTaskListDTO;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
@NoArgsConstructor
public class BoardServiceImpl implements BoardService {

    @Autowired
    private BoardMapper boardMapper;

    @Override
    public List<Board> getBoardLists() {
        return boardMapper.selectBoardList();
    }

    @Override
    public void insertBoard(Board board) {
        board.setEvalCommitteeNo(1);
        board.setRndPlanNo(1);
        board.setBucketNo(1);
        boardMapper.insertBoardList(board);
    }

    @Override
    public Board selectBoardId(int opinionNo) {
        return boardMapper.selectBoardId(opinionNo);
    }

    @Override
    public void updateBoard(int opinionNo) {
        boardMapper.updateBoard(opinionNo);
    }

    @Override
    public void updateStep(Board board) {
        boardMapper.updateStep(board);
    }

    @Override
    public int insertReply(Board board) {
        board.setEvalCommitteeNo(1);
        board.setRndPlanNo(1);
        board.setBucketNo(1);
        return boardMapper.insertReplyList(board);
    }

    @Override
    public int deleteBoard(Board board) {
        return boardMapper.deleteReplyList(board);
    }


    @Override
    public boolean modifyBoard(Board board) {
        return boardMapper.modifyBoard(board) == 1;
    }
}
