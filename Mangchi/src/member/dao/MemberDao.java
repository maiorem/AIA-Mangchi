package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import member.model.Member;

public class MemberDao {
	
	private MemberDao() {};
	
	private static MemberDao member = new MemberDao();
	
	public static MemberDao getInstance() {
		return member;
	}

	public Member selectByMember(Connection conn, String id) throws SQLException {

		Member member = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			String sql = "select * from project.member where member_id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				member = new Member(rs.getInt("member_idx"), rs.getString("member_id"), rs.getString("member_pw"), rs.getString("member_nick"),
						rs.getDouble("member_score"), rs.getDate("member_regdate"), rs.getString("member_addr"), rs.getString("member_img"));
			}

		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
		}
		return member;
	}

	// LoginCheck
	public int loginCheck(Connection conn, String id, String pw) throws SQLException {

		int resultCnt = 0;

		PreparedStatement pstmt = null;

		ResultSet rs;

		String sql = "select member_id, member_pw from project.member where member_id=? and member_pw=?";
		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, pw);

			rs = pstmt.executeQuery();

			if (rs.next())
				resultCnt = 1;

		} finally {
			if (pstmt != null)
				pstmt.close();
		}

		return resultCnt;
	}
}
