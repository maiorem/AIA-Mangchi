package board.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.dao.BoardDao;
import board.model.RequestWriting;
import jdbc.ConnectionProvider;
import member.model.Member;
import service.Service;

public class WriteRequestResultServiceImpl implements Service {
	BoardDao dao;
	@Override
	public String getViewPage(HttpServletRequest request, HttpServletResponse response) {
		Connection conn = null;
		RequestWriting rw = null;
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginInfo");
		int member_idx=member.getIdx();
		try {
			conn = ConnectionProvider.getConnection();
			dao = BoardDao.getInstance();
			rw = dao.getCurrentRequest(conn,member_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(conn!=null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		if(rw!=null) {
			request.setAttribute("currentWriting", rw);
		}
		return "/WEB-INF/views/board/currentMyRequest.jsp";
	}

}
