package message.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.Service;

public class CheckReadingNoteServiceImpl implements Service {

	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
		String Check="N";
		int read
		
		
		
		
		req.setAttribute("checkNote", Check);
		return "/WEB-INF/views/message/readCheck.jsp";
	}

}
