package board.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDao;
import jdbc.ConnectionProvider;
import member.model.Member;
import service.Service;

public class ChooseHelperServiceImpl implements Service {
	BoardDao dao;
	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
		int req_idx = Integer.parseInt(req.getParameter("req_idx"));
		int helper = Integer.parseInt(req.getParameter("req_helper"));
		int complete = Integer.parseInt(req.getParameter("complete"));
		Connection conn = null;
		int result =0;
		try {
			conn = ConnectionProvider.getConnection();
			dao=BoardDao.getInstance();
			if(complete==0) {
				result = dao.chooseHelperStatus(conn,req_idx,helper);				
			}else{
				result = dao.completeHelpStatus(conn,req_idx,helper);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
			
		req.setAttribute("updateResult", result);
//		req.setAttribute("requestHelpers", list);
		return "/WEB-INF/views/board/updateStatusResult.jsp";
	}

}
