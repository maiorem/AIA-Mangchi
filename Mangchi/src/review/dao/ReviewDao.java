package review.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.swing.text.html.HTMLDocument.HTMLReader.PreAction;

import jdbc.ConnectionProvider;

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

	
	
	//public List<Review> getlist(Connection conn, Member member) throws SQLException {
		public List<Review> getlist(Connection conn, int a) throws SQLException {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<Review> reviewList = new ArrayList<>();
		
		
		
		try {
			
			
			String sql = "select * from project.review_list where review_receiver=?";
			
			pstmt =conn.prepareStatement(sql);
			//pstmt.setInt(1, member.getmember_idx());
			pstmt.setInt(1, a);
			
			rs=pstmt.executeQuery();
			
		
			while(rs.next()) {
				
				reviewList.add(new Review(rs.getInt("review_idx"),rs.getInt("req_idx"),rs.getInt("review_receiver"),
						rs.getInt("review_writer"),rs.getInt("review_score"),rs.getString("review_text"),rs.getDate("review_regdate")));
			}
			
			
		} finally {
			if(rs != null) {
				rs.close();
			}
			if(pstmt !=null) {
				pstmt.close();
			}
		}
		
		return reviewList;
	}
	
	
	
	
	
	
	
	public List<Review> listReview(Connection conn, int req_idx) throws SQLException{
		
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<Review> reviewList = new ArrayList<>();
		
		
		String sql = "select *, avg(review_score) from project.review_list group by req_idx having req_idx=?";
		
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, req_idx);
			
			
			rs=pstmt.executeQuery();
			
		while(rs.next()) {
			Review review = new Review();
			review.setReview_idx(rs.getInt("review_idx"));
			review.setReq_idx(rs.getInt("req_idx"));
			review.setReview_receiver(rs.getInt("review_receiver"));
			review.setReview_writer(rs.getInt("review_writer"));
			review.setReview_score(rs.getInt("review_score"));
			review.setReview_text(rs.getString("review_text"));
			review.setReview_regdate(rs.getDate("review_regdate"));
			
			reviewList.add(review);
		}
		
		}finally {
			if(pstmt!=null) {
				pstmt.close();
			}
			
		}
		
		
		return reviewList;
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	}
