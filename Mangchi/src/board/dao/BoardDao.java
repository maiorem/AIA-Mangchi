package board.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class BoardDao {
	private BoardDao() {}
	
	private static BoardDao dao = new BoardDao();
	public static BoardDao getInstance() {
		return dao;
	}
	public int getNextIdx(Connection conn) throws SQLException {
		int result=0;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt=conn.createStatement();
			String sql = "select ifnull(max(req_idx)+1,1)from project.request_list";
			rs=stmt.executeQuery(sql);
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}finally {
			if(stmt!=null) {
				stmt.close();
			}
			if(rs!=null) {
				rs.close();
			}
		}
		
		return result;
	}
	
	
}
