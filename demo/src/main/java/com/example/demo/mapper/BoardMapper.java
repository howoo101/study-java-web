package com.example.demo.mapper;

import com.example.demo.domain.Board;

import java.util.List;
import java.util.Map;


/**
 * 게시판 Dao
 * @author youtube
 *
 */
public interface BoardMapper {

	/**
	 * 게시물 목록 조회 리턴
	 *
	 * @return
	 * @
	 */
	@SuppressWarnings("unchecked")
	public List<Board> selectBoardList(Map<String, Object> paramMap)
			;

	/**
	 * 게시물 조회
	 *
	 * @param boardSeq
	 * @return
	 * @
	 */
	public Board selectBoard(int boardSeq) ;

	/**
	 * 게시물 등록
	 *
	 * @param board
	 * @
	 */
	public void insertBoard(Board board) ;


	/**
	 * 게시물 업데이트
	 *
	 * @param board
	 * @
	 */
	public void updateBoard(Board board) ;

	/**
	 * 게시물 삭제
	 *
	 * @
	 */
	public void deleteBoard(int boardSeq) ;

}