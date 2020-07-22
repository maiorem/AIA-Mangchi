package board.service;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import board.dao.BoardDao;
import board.model.RequestWriting;
import jdbc.ConnectionProvider;
import service.Service;

public class ReqWriteServiceImpl implements Service {
	BoardDao dao;
	@Override
	public String getViewPage(HttpServletRequest request, HttpServletResponse response) {
		Connection conn=null;
		int req_idx;
		String req_title;	//글제목
		int req_price;		//금액
		Date req_term;		//반납일시
		String req_loc;		//주소
		String req_text;	//상세내용
		double req_latitude;//위도
		double req_longitude;//경도
		String req_img;		//참고이미지
		System.out.println(request.getParameter("req_term"));
		req_idx=Integer.parseInt(request.getParameter("req_idx"));
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		String term_str= request.getParameter("req_term");
		term_str = term_str.replace("T", " ");
		try {
			req_term=df.parse(term_str);
			System.out.println(req_term);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/WEB-INF/views/requestWriteForm.jsp";
	}

}
