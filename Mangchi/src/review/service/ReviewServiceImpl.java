package review.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.RequestWriting;
import jdbc.ConnectionProvider;
import member.model.Member;
import review.dao.ReviewDao;
import review.model.Review;
import service.Service;

public class ReviewServiceImpl implements Service {

	
	
	ReviewDao dao;
	
	
	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
		
		
		int resultCnt =0;

		Connection conn = null;
		
		HttpSession session=req.getSession();
		Member rv = (Member)session.getAttribute("loginInfo");
		RequestWriting br = (RequestWriting)session.getAttribute("");

		
		//int req_idx=br.getReq_idx();
		//int review_receiver=br.getReq_helper();
		
		
		
		int req_idx =8; //test용
		int review_receiver=3; // test용
		int review_writer=rv.getIdx();
		
		
				
		
		int review_score = Integer.parseInt(req.getParameter("review_score"));
		String review_text = req.getParameter("review_text");
		
		
		
		
		try {
			conn = ConnectionProvider.getConnection();
			
			Review review = new Review();
			
			
			review.setReq_idx(req_idx); // 게시글번호 
			review.setReview_receiver(review_receiver);
			review.setReview_writer(review_writer);
			review.setReview_score(review_score);
			review.setReview_text(review_text);
			
			
			dao = ReviewDao.getInstance();
			

			resultCnt=dao.insertReview(conn,review);
			
			req.setAttribute("result", resultCnt);
			
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
		
		
		
		
		return "/WEB-INF/views/reviews/review.jsp";
	}

}
