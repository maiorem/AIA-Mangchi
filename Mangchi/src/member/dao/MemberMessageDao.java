package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import member.model.Member;

public class MemberMessageDao {
	
	private MemberMessageDao() {};
	private static MemberMessageDao dao=new MemberMessageDao();
	public static MemberMessageDao getInstance() {
		return dao;
	}
	
	public boolean existId(Connection conn, String id) throws SQLException {
		boolean result=false;
		List<Member> list=new ArrayList<>();

		Statement stmt=null;
		ResultSet rs=null;
		
		String sql="select * from project.member";
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
		
		while(rs.next()) {
			Member member=new Member(
					rs.getInt("idx"), 
					rs.getString("id"), 
					rs.getString("pw"), 
					rs.getString("nick"),
					rs.getDouble("score"),
					rs.getDate("regDate"),
					rs.getString("addr"),
					rs.getString("photo")
					);
			list.add(member);
		}
		
		for(int i=0; i<list.size(); i++) {
			if(id.equals(list.get(i).getId())) {
				result=true;
			}
		}
		} finally {
			if(rs!=null) {
				rs.close();
			}
			if(stmt!=null) {
				stmt.close();
			}
			
		}
		return result;
	}


	
	
	
}
