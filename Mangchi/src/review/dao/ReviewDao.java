package review.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import review.model.Review;


public class ReviewDao {

	// 싱글톤처리 
	private ReviewDao() {};
	private static ReviewDao dao = new ReviewDao();
	
	public static ReviewDao getInstance() {
		return dao;
	}

	public int insertReview(Connection conn, Review review) throws SQLException {
		int resultCnt = 0;
		
		
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO project.review_list "
				+ "(req_idx,review_receiver,review_writer,review_score,review_text) "
				+ "VALUES ( ?,?,?,?,?)";
		
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, review.getReq_idx());
			pstmt.setInt(2, review.getReview_receiver());
			pstmt.setInt(3, review.getReview_writer());
			pstmt.setInt(4, review.getReview_score());
			pstmt.setString(5, review.getReview_text());
			
			resultCnt=pstmt.executeUpdate();
			
			
		}finally {
			
			if(pstmt !=null) {
				pstmt.close();
			}
			
		}
		
		
		
		
		return resultCnt;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	}
