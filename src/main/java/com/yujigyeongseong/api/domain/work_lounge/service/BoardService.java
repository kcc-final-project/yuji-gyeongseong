package com.yujigyeongseong.api.domain.work_lounge.service;

import com.yujigyeongseong.api.domain.work_lounge.dto.Board;

import java.util.List;

public interface BoardService {
    public List<Board> getBoardLists();

    public void insertBoard(Board board);

    public Board getBoard(Integer opinionNo);

    public void updateBoard(Integer opinionNo);

    public void updateStep(Board board);

    public int insertReply(Board board);

    public int deleteBoard(Board board);


    public boolean modifyBoard(Board board);
}