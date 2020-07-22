package review.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class ReviewDao {

	// 싱글톤처리 
	private ReviewDao() {};
	private static ReviewDao dao = new ReviewDao();
	
	public static ReviewDao getInstance() {
		return dao;
	}

	}
