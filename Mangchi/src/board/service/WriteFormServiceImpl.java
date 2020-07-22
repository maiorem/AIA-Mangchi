package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDao;
import service.Service;

public class WriteFormServiceImpl implements Service {

	BoardDao dao;
	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
		//dao 가서 
		return "/WEB-INF/views/board/requestWriteForm.jsp";
	}

}
