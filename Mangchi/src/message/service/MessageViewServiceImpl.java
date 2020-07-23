package message.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.ConnectionProvider;
import message.dao.MessageDao;
import message.model.Message;
import service.Service;

public class MessageViewServiceImpl implements Service {
	
	MessageDao dao;

	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
		String note=req.getParameter("idx");
		
		int msgIdx=Integer.parseInt(note);
		Connection conn=null;
		Message msg=null;
		
		try {
			conn=ConnectionProvider.getConnection();
			msg=dao.selectMessageFromIdx(conn, msgIdx);
			
			req.setAttribute("viewNote", msg);
			
			
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
		

		return "/WEB-INF/views/message/messageview.jsp";
	}

}
