package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import member.model.Member;

public class MemberDao {

	private MemberDao() {
	};

	private static MemberDao member = new MemberDao();

	public static MemberDao getInstance() {
		return member;
	}

	public Member selectByMember(Connection conn, String id) throws SQLException {

		Member member = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			String sql = "SELECT * FROM project.member WHERE member_id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				member = new Member(rs.getInt("member_idx"), rs.getString("member_id"), rs.getString("member_pw"),
						rs.getString("member_nick"), rs.getDouble("member_score"), rs.getDate("member_regdate"),
						rs.getString("member_addr"), rs.getString("member_img"));
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

		String sql = "SELECT member_id, member_pw FROM project.member WHERE member_id=? and member_pw=?";
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

	// idCheck
	public int idCheck(Connection conn, String id) throws SQLException {

		int resultCnt = 0;

		PreparedStatement pstmt = null;

		ResultSet rs = null;

		try {

			String sql = "SELECT count(*) FROM project.member WHERE kakao_id = ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next())
				resultCnt = rs.getInt(1);

		} finally {
			if (pstmt != null)
				pstmt.close();
			if (rs != null)
				rs.close();
		}
		return resultCnt;
	}

	// idCheck
	public int addrCheck(Connection conn, String id) throws SQLException {

		int resultCnt = 0;

		PreparedStatement pstmt = null;

		ResultSet rs = null;

		try {

			String sql = "SELECT count(*) FROM project.member WHERE kakao_id = ? AND member_addr IS NOT NULL";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next())
				resultCnt = rs.getInt(1);

		} finally {
			if (pstmt != null)
				pstmt.close();
			if (rs != null)
				rs.close();
		}
		return resultCnt;
	}

	// kakao회원가입
	public int kakaoRegMember(Connection conn, String kid, String nick, String photo) throws SQLException {
		int resultCnt = 0;

		PreparedStatement pstmt = null;
		String sql = "INSERT INTO project.member (kakao_id,member_nick,member_img) VALUES (?,?,?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, kid);
			pstmt.setString(2, nick);
			pstmt.setString(3, photo);

			resultCnt = pstmt.executeUpdate();
		} finally {

			if (pstmt != null)
				pstmt.close();

		}

		return resultCnt;
	}

	// kakao 임시 회원가입
	public int kakaoAddRegMember(Connection conn, String kid, String nick, String photo) throws SQLException {
		int resultCnt = 0;

		PreparedStatement pstmt = null;
		String sql = "INSERT INTO project.member (kakao_id,member_nick,member_img) VALUES (?,?,?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, kid);
			pstmt.setString(2, nick);
			pstmt.setString(3, photo);

			resultCnt = pstmt.executeUpdate();
		} finally {

			if (pstmt != null)
				pstmt.close();

		}

		return resultCnt;
	}
	
	// kakao 추가 회원가입
	public int kakaoFinalRegMember(Connection conn, String id, String addr, String kid) throws SQLException {
		int resultCnt = 0;

		PreparedStatement pstmt = null;
		String sql = "UPDATE project.member SET member_id = ?, member_addr = ? WHERE kakao_id = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, addr);
			pstmt.setString(3, kid);

			resultCnt = pstmt.executeUpdate();
		} finally {

			if (pstmt != null)
				pstmt.close();

		}

		return resultCnt;
	}
	
	// kakao 로그인
	public Member selectByKakaoMember(Connection conn, String id) throws SQLException {

		Member member = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			String sql = "SELECT * FROM project.member WHERE kakao_id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				member = new Member(rs.getInt("member_idx"), rs.getString("kakao_id"),
						rs.getString("member_nick"), rs.getDouble("member_score"), rs.getDate("member_regdate"),
						rs.getString("member_addr"), rs.getString("member_img"));
			}

		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
		}
		return member;
	}
}
