package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import board.model.RequestWriting;
import member.model.Member;

public class BoardDao {
	private BoardDao() {}
	
	private static BoardDao dao = new BoardDao();
	public static BoardDao getInstance() {
		return dao;
	}
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

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
	public int insertRequest(Connection conn, RequestWriting rw) throws SQLException {
		int result=0;
		PreparedStatement pstmt=null;
		String sql="insert into project.request_list "
				 + "("
				 + "req_writer,"
				 + "req_title,"
				 + "req_price,"
				 + "req_loc,"
				 + "req_term,"
				 + "req_text,"
				 + "req_img) "
				 + "values(?,?,?,?,?,?,?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, rw.getReq_writer());
			pstmt.setString(2, rw.getReq_title());
			pstmt.setInt(3, rw.getReq_price());
			pstmt.setString(4, rw.getReq_loc());
			pstmt.setString(5, rw.getReq_term());
			pstmt.setString(6, rw.getReq_text());
			pstmt.setString(7, rw.getReq_img());
			
			result = pstmt.executeUpdate();
			
		} finally {
			if(pstmt!=null) {
				pstmt.close();
			}
		}
		
		return result;
	}
	public int getCurrentRequest(Connection conn, int member_idx) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int req_idx=-1;
		String sql= "select * "
				  + "from project.request_list rl join project.member m " + 
					"where rl.req_writer=m.member_idx and rl.req_regdate=(select max(req_regdate) from project.request_list where req_writer=?)";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, member_idx);
			
			rs= pstmt.executeQuery();
			while(rs.next()) {
//				Timestamp regdate = rs.getTimestamp("req_regdate");
//				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				
//				String req_regdate = sdf.format(date);
//				System.out.println(req_regdate);
//				regdate += " "+rs.getTime("req_regdate").toString();
//				LocalDateTime dateTime= LocalDateTime.parse(regdate,formatter);
//				String req_regdate = dateTime.format(formatter);
//				System.out.println("req_regdate: "+req_regdate);
				
//				rw.setReq_idx(rs.getInt("req_idx"));
//				rw.setReq_writer(rs.getInt("req_writer"));
//				rw.setWriter_nick(rs.getString("member_nick"));
//				rw.setReq_title(rs.getString("req_title"));
//				rw.setReq_helper(rs.getInt("req_helper"));
//				rw.setReq_price(rs.getInt("req_price"));
//				rw.setReq_regdate(sdf.format(regdate));
//				rw.setReq_term(rs.getString("req_term"));
//				rw.setReq_loc(rs.getString("req_loc"));
//				rw.setReq_text(rs.getString("req_text"));
//				rw.setReq_readcnt(rs.getInt("req_readcnt"));
//				rw.setReq_status(rs.getInt("req_status"));
//				rw.setReq_img(rs.getString("req_img"));
				req_idx= rs.getInt("req_idx");
			}
		} finally{
			if(pstmt!=null) {
				pstmt.close();
			}
			if(rs!=null) {
				rs.close();
			}
		};
		return req_idx;
	}
	public int selectTotalMyReqCnt(Connection conn, int member_idx) throws SQLException {
		int resultCnt = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select count(*) from project.request_list where req_writer=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_idx);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				resultCnt= rs.getInt(1);
			}
		} finally {
			if(pstmt!=null) {
				pstmt.close();
			}
			if(rs!=null) {
				rs.close();
			}
		}
		System.out.println("내가쓴 게시물 수 : "+resultCnt);
		return resultCnt;
	}
	
	public List<RequestWriting> selectMemberList(Connection conn, int startRaw,int member_idx, int mESSAGE_COUNT_PER_PAGE) throws SQLException {
		List<RequestWriting> list = new ArrayList<RequestWriting>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		RequestWriting rw=null;
		String sql="select * from project.member m join project.request_list rl where m.member_idx=rl.req_writer and rl.req_writer=? limit ?,?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, member_idx);
			pstmt.setInt(2, startRaw);
			pstmt.setInt(3, mESSAGE_COUNT_PER_PAGE);
			
			rs= pstmt.executeQuery();
			while(rs.next()) {
				Timestamp regdate = rs.getTimestamp("req_regdate");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				rw=new RequestWriting(
						rs.getInt("req_idx"), 
						rs.getInt("req_writer"),
						rs.getString("member_nick"), 
						rs.getString("req_title"),
						rs.getInt("req_helper"),
						rs.getInt("req_price"), 
						sdf.format(regdate),
						rs.getString("req_term"),
						rs.getString("req_loc"), 
						rs.getString("req_text"),
						rs.getInt("req_readcnt"),
						0,
						0,
						rs.getInt("req_status"),
						rs.getString("req_img"));
				list.add(rw);
			}
//			for(int i =0;i<list.size();i++) {
//			}
		} finally{
			if(pstmt!=null) {
				pstmt.close();
			}
			if(rs!=null) {
				rs.close();
			}
		};
		return list;
	}
	public RequestWriting getDetailRequestInfo(Connection conn, int req_idx) throws SQLException {
		RequestWriting rw=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * " + 
					 "FROM project.request_list r join project.member m " + 
					 "where req_idx=? and req_writer=member_idx";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, req_idx);
			rs= pstmt.executeQuery();
			while(rs.next()) {
				Timestamp regdate = rs.getTimestamp("req_regdate");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				rw=new RequestWriting(
						rs.getInt("req_idx"), 
						rs.getInt("req_writer"),
						rs.getString("member_nick"), 
						rs.getString("req_title"),
						rs.getInt("req_helper"),
						rs.getInt("req_price"), 
						sdf.format(regdate),
						rs.getString("req_term"),
						rs.getString("req_loc"), 
						rs.getString("req_text"),
						rs.getInt("req_readcnt"),
						0,
						0,
						rs.getInt("req_status"),
						rs.getString("req_img"));
			}
		}finally {
			if(pstmt!=null) {
				pstmt.close();
			}
			if(rs!=null) {
				rs.close();
			}
		}
		
		return rw;
	}
	public List<Member> getRequestHelpers(Connection conn, int loginIdx, int req_idx) throws SQLException {
		List<Member>list = new ArrayList<Member>();
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		String sql ="SELECT * FROM project.message ms join project.member mb " + 
					"where ms.msg_writer=mb.member_idx " + 
					"	and req_idx=? " + 
					"   and msg_writer != ? " + 
					"group by msg_writer";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, req_idx);
			pstmt.setInt(2, loginIdx);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				Member member = new Member();
				
				member.setIdx(rs.getInt("member_idx"));
				member.setNick(rs.getString("member_nick"));
				
				list.add(member);
			}
		} finally {
			if(pstmt!=null) {
				pstmt.close();
			}
			if(rs!=null) {
				rs.close();
			}
		}
		return list;
	}
	public int chooseHelperStatus(Connection conn, int req_idx, int helper) throws SQLException {
		
		int num = 1;
		PreparedStatement pstmt = null;
		if(helper==-1) {
			num=0;
		}
		String sql = "UPDATE `project`.`request_list` " + 
					 "SET " + 
					 "`req_helper` = ?, " + 
					 "`req_status` = "+num+" " + 
					 "WHERE `req_idx` = ?;";
		try {
			pstmt = conn.prepareStatement(sql);
			if(helper==-1) {
				pstmt.setNull(1, java.sql.Types.NULL);
				pstmt.setInt(2, req_idx);
			}else {
				pstmt.setInt(1, helper);
				pstmt.setInt(2, req_idx);				
			}
			pstmt.executeUpdate();
			
		} finally {
			if(pstmt!=null) {
				pstmt.close();
			}
		}
		return num;
	}
	
	
}
