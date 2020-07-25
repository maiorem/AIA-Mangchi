package review.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.RequestWriting;
import jdbc.ConnectionProvider;
import member.model.Member;
import review.dao.ReviewDao;
import review.model.Review;
import review.model.Reviewjoin;
import service.Service;

public class ReviewListViewServiceImpl implements Service {

	
	ReviewDao dao;
	
	
	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
	
		
		Connection conn=null;
		HttpSession session=req.getSession();
		Member rv = (Member)session.getAttribute("loginInfo");
		int member_idx=rv.getIdx();
		//int b = Integer.parseInt(req.getParameter("req_idx"));
		int b = 9;
		
		
		try {
			
			conn=ConnectionProvider.getConnection();
			dao = ReviewDao.getInstance();
			
			
			
			List<Reviewjoin> reviewList = null;
			float score =0;
			List<Reviewjoin> writeList =null;
			
			
			
			
			reviewList = dao.getlist(conn,member_idx);
			score = dao.scoreAvg(conn, member_idx);
			writeList = dao.setlist(conn, member_idx);
			
			System.out.println("나한테쓴것들 : " +reviewList);
			System.out.println(" 평균 : " + score);
			System.out.println("내가쓴것들 : " +writeList);
			
			req.setAttribute("reviewList", reviewList);
			req.setAttribute("score", score);
			
			req.setAttribute("writerList", writeList);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			if(conn!=null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
		
		
		
		
		
		
		
		
		
		
		
		
		return "/WEB-INF/views/reviews/reviewListView.jsp";
		
	}

}
