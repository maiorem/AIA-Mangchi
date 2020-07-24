package request.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.ConnectionProvider;
import request.dao.RequestDao;
import request.model.Request;
import service.Service;

public class MemberRntHistoryFormServiceImpl implements Service {
	
	RequestDao dao;
	List<Request> rentalList = null;

	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
		
		Connection conn = null;
		
		try {

			conn = ConnectionProvider.getConnection();

			dao = RequestDao.getInstance();	
			
			rentalList = dao.selectRntHistory(conn, 2);
			System.out.println("requestList: "+rentalList);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		}

		req.setAttribute("rentalhistory", rentalList);
		
		return "/WEB-INF/views/member/rnthistory.jsp";
	}

}
