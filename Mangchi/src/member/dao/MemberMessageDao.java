package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MemberMessageDao {
	
	private MemberMessageDao() {};
	private static MemberMessageDao dao=new MemberMessageDao();
	public static MemberMessageDao getInstance() {
		return dao;
	}
	public boolean existId(Connection conn, String id) {
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
					rs.getString("uid"), 
					rs.getString("upw"), 
					rs.getString("uname"),
					rs.getString("uphoto"),
					rs.getDate("regdate")
					);
			list.add(member);
		}
		
		for(int i=0; i<list.size(); i++) {
			if(id.equals(list.get(i).getUid())) {
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