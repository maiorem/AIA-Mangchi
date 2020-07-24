package review.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		int review_writer=rv.getIdx();
		
		int req_idx =8; //test용
		int review_receiver=3; // test용
		//int review_writer =6; // test용
		
		//int req_idx =Integer.parseInt(req.getParameter("req_idx")); // 게시글 idx
		//int review_receiver = Integer.parseInt(req.getParameter("review_receiver")); // 리뷰당하는사람
		
		String a = req.getParameter("review_writer");
		//int review_writer = Integer.parseInt(a); // 리뷰쓰는사람[게시글올린사람]
		
		//int review_writer = (int)req.getSession().getAttribute("review_writer");
				
		
		int review_score = Integer.parseInt(req.getParameter("review_score"));
		String review_text = req.getParameter("review_text");
		//int review_score =3;
		
		
		
		
		try {
			conn = ConnectionProvider.getConnection();
			
			Review review = new Review();
			
			
			//review.setReview_idx(review_idx);
			review.setReq_idx(req_idx); // 게시글번호 
			//review.setReview_receiver(review_receiver);
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
