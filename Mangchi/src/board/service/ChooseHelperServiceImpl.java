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
		System.out.println(req_idx);
		System.out.println(helper);
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			dao=BoardDao.getInstance();
			
			if(helper>-1) {
				//대기중을 눌럿을때 상태를 대기로
			}else {
				//유저를 눌럿을때 상태를 렌탈중으로
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		
		
//		req.setAttribute("choiceRequest", rw);
//		req.setAttribute("requestHelpers", list);
		return "/WEB-INF/views/board/detailRequest.jsp";
	}

}
