package message.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.ConnectionProvider;
import message.dao.MessageDao;
import message.model.Message;
import message.model.MessageListView;
import service.Service;

public class SearchNoteSelectServiceImpl implements Service {

	private MessageDao dao;
	private final int MESSAGE_COUNT_PER_PAGE=10;
	
	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
		
		MessageListView searchListView=null;
		Connection conn=null;
		int noteSort=Integer.parseInt(req.getParameter("noteSort"));
		System.out.println("noteSort : "+noteSort);
		int searchSort=Integer.parseInt(req.getParameter("searchSort"));
		System.out.println("searchSort : "+searchSort);
		String searchText=req.getParameter("noteSearch");
		System.out.println("searchText : " +searchText);
		
		try {
			conn=ConnectionProvider.getConnection();
			dao=MessageDao.getInstance();
			
			List<Message> msgList=null;
			
			int messageTotalCount=dao.selectTotalCount(conn);

			int startrow=0;
			int currentPage=1;
			String page=req.getParameter("page");
			
			if(messageTotalCount>0) {

				startrow=(currentPage-1)*MESSAGE_COUNT_PER_PAGE;
				
				if(noteSort==1) {
					if(searchSort==1) {
						msgList=dao.searchReceiveNoteById(conn, startrow, MESSAGE_COUNT_PER_PAGE, searchText);
	
					} else if (searchSort==2) {
						msgList=dao.searchReceiveNoteByTitle(conn, startrow, MESSAGE_COUNT_PER_PAGE, searchText);
					} else if(searchSort==3) {
						msgList=dao.searchReceiveNoteByText(conn, startrow, MESSAGE_COUNT_PER_PAGE, searchText);
					}
					
					
				} else {
					if(searchSort==1) {
						msgList=dao.searchSendNoteById(conn, startrow, MESSAGE_COUNT_PER_PAGE, searchText);
					} else if(searchSort==2) {
						msgList=dao.searchSendNoteByTitle(conn, startrow, MESSAGE_COUNT_PER_PAGE, searchText);
					} else if(searchSort==3) {
						msgList=dao.searchSendNoteByText(conn, startrow, MESSAGE_COUNT_PER_PAGE, searchText);
						
					}
				}
				
				System.out.println(msgList);

			} else {
				currentPage=0;
				msgList=Collections.emptyList();
			}

			
			searchListView=new MessageListView(messageTotalCount, currentPage, msgList, MESSAGE_COUNT_PER_PAGE, startrow);

			
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
		
		req.setAttribute("noteSort", noteSort);
		req.setAttribute("searchNoteList", searchListView);
		
		return "/WEB-INF/views/message/searchNoteResult.jsp";
	}

}
