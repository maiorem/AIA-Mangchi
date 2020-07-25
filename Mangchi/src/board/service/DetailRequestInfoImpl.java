package board.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDao;
import board.model.RequestWriting;
import jdbc.ConnectionProvider;
import member.model.Member;
import service.Service;

public class DetailRequestInfoImpl implements Service {
	BoardDao dao;
	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
		Connection conn = null;
		RequestWriting rw = null;
		List<Member> list=null;
		int loginIdx = 0;
		if((Member)req.getSession().getAttribute("loginInfo")!=null) {
			Member loginMember = (Member)req.getSession().getAttribute("loginInfo");
			loginIdx=loginMember.getIdx();
		}
		System.out.println(req.getParameter("req_idx"));
		// int req_idx = Integer.parseInt(req.getParameter("req_idx"));

		int req_idx = Integer.parseInt(req.getParameter("req_idx"));
		
//		int req_idx=77; 

		try {
			conn = ConnectionProvider.getConnection();
			dao=BoardDao.getInstance();
			rw= dao.getDetailRequestInfo(conn,req_idx);
			if(rw.getReq_writer()==loginIdx) {
				list = dao.getRequestHelpers(conn,loginIdx,req_idx);				
			}else {
				list = dao.getRequestHelpers(conn,rw.getReq_writer(),req_idx);								
			}
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
			req.setAttribute("requestHelpers", list);
		}
		return "/WEB-INF/views/board/detailRequest.jsp";
	}

}
