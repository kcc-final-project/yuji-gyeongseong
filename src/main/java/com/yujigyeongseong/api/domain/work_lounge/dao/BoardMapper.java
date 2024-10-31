package com.yujigyeongseong.api.domain.work_lounge.dao;

import com.yujigyeongseong.api.domain.work_lounge.dto.Board;
import com.yujigyeongseong.api.domain.work_lounge.dto.EvaluationTaskListDTO;
import com.yujigyeongseong.api.domain.work_lounge.dto.RegisterListDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BoardMapper {

    public List<Board> selectBoardList();

    public void insertBoardList(Board board);

    public Board selectBoardId(@Param("opinionNo") int opinionNo);

    public void updateBoard(Integer opinionNo);

    public void updateStep(Board board);

    public int insertReplyList(Board board);

    public int deleteReplyList(Board board);

    public int modifyBoard(Board board);
}
