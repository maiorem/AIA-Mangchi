package request.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javafx.application.Application;
import jdbc.ConnectionProvider;
import member.model.Member;
import request.dao.RequestDao;
import request.model.Request;
import request.model.RequestListView;
import service.Service;

public class MemberRntHistoryFormServiceImpl implements Service {
	
	RequestDao dao;
	RequestListView listview = null;
	List<Request> rentalList = null;
	final int COUNT_PER_PAGE = 3;


	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
		
		Connection conn = null;
		
		try {
			
			conn = ConnectionProvider.getConnection();

			dao = RequestDao.getInstance();	
			
			// session 값가져오기
			// 나중에 logininfo model 사용해서 바꿔주기!!!!!!!!!!!!!!!!
			Member loginInfo = (Member)req.getSession().getAttribute("loginInfo");	
			System.out.println(loginInfo);
			int idx = loginInfo.getIdx();
			System.out.println("로그인한 사람 : "+idx);
			
			int requestTotalCount = dao.selectRntCount(conn, idx);
			
			int pageNumber = 1;
			String page = req.getParameter("page");
			
			if (page != null) {
				try {
					pageNumber = Integer.parseInt(page);
				} catch (NumberFormatException e) {
					System.out.println("���� Ÿ���� ���ڿ��� ���޵��� �ʾ� ���� �߻�");
				}
			}

			int startRow = 0;
			
			if (requestTotalCount > 0) {

				// ���� ��, ������ ��
				startRow = (pageNumber - 1) * COUNT_PER_PAGE ;
				

				rentalList = dao.selectRntHistory(conn, idx, startRow, COUNT_PER_PAGE);
				System.out.println("requestList: "+rentalList);

			} else {
				pageNumber = 0;
				rentalList = Collections.emptyList();
			}
			listview = new RequestListView(requestTotalCount, pageNumber, rentalList, COUNT_PER_PAGE, startRow); 

			
			

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
