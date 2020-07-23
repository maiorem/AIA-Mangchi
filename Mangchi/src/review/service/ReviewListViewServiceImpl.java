package review.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jdbc.ConnectionProvider;
import review.dao.ReviewDao;
import review.model.Review;
import service.Service;

public class ReviewListViewServiceImpl implements Service {

	
	ReviewDao dao;
	
	
	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
	
		
		Connection conn=null;
		HttpSession session=req.getSession();
//		Member rv = (Member)session.getAttribute("loginInfo");
//		int a=rv.getMember_idx;
		int a = 1111;
		try {
			
			conn=ConnectionProvider.getConnection();
			dao = ReviewDao.getInstance();
			
			
			
			List<Review> reviewList = null;
			
			reviewList = dao.getlist(conn,a);
			
			System.out.println(reviewList);
			
			req.setAttribute("reviewList", reviewList);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
		
		
		
		
		return "/WEB-INF/views/reviews/reviewListView.jsp";
		
	}

}
