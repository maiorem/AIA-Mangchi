package board.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDao;
import board.model.RequestWriting;
import jdbc.ConnectionProvider;
import service.Service;

public class DetailRequestInfoImpl implements Service {
	BoardDao dao;
	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
		Connection conn = null;
		RequestWriting rw = null;
//		int req_idx = Integer.parseInt(req.getParameter("req_idx"));
		int req_idx=7;
		try {
			conn = ConnectionProvider.getConnection();
			dao=BoardDao.getInstance();
			rw= dao.getDetailRequestInfo(conn,req_idx);
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
			req.setAttribute("choiceRequest", rw);
		}
		return "/WEB-INF/views/board/detailRequest.jsp";
	}

}
