package board.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDao;
import board.model.RequestWriting;
import board.model.RequestWritingList;
import jdbc.ConnectionProvider;
import service.Service;

public class RequestBoardListServiceImpl implements Service {

	BoardDao dao = null;

	// 페이지 당 표현 할 정보 개수
	public int MEMBER_COUNT_PAGE = 5;

	@Override
	public String getViewPage(HttpServletRequest request, HttpServletResponse response) {

		Connection conn = null;
		int requestTotalCount = 0;
		List<RequestWriting> requestWriting = null;
		RequestWritingList requestWritingList=null;

		try {

			conn = ConnectionProvider.getConnection();
			dao = BoardDao.getInstance();

			// ---- 페이지 당 출력 할 회원 정보 리스트 구하기 ---- 
			requestTotalCount = dao.selectTotalCount(conn);

			
			// -----현재 페이지 계산 : 게시물 시작 행, 페지당 표현할 정보 개수 계산 -----
			int startRow = 0; // 게시물 시작 행
			String page = request.getParameter("page");
			int currentPageNumber = 1;
			
			// 현제 페이지 값
			if (page != null) {
				currentPageNumber = Integer.parseInt(page);
			}
			
			if (requestTotalCount > 0) {
				// 시작행 계산 식  
				startRow = (currentPageNumber - 1) * MEMBER_COUNT_PAGE;
				// 출력 할 리스트
				requestWriting = dao.selectMemberList(conn, startRow, MEMBER_COUNT_PAGE);

			} else { 
				requestWriting = Collections.emptyList();
			}
			
			
			requestWritingList = new RequestWritingList(requestTotalCount, 
					  MEMBER_COUNT_PAGE, 
					  currentPageNumber, requestWriting, startRow);
			  
			  
			System.out.println(requestWritingList);  
			
			  request.setAttribute("requestWritingList", requestWritingList);
			 

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return "/WEB-INF/views/board/requestList.jsp";
	}

}
