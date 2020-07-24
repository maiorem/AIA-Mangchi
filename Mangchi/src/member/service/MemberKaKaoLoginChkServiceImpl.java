package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.Service;

public class MemberKaKaoLoginChkServiceImpl implements Service {

	@Override
	public String getViewPage(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("아이디: " + req.getParameter("id"));
		System.out.println("닉네임: " + req.getParameter("nick"));
		System.out.println("프로필사진주소: " + req.getParameter("photo"));
		
		
		
		return null;
	}
	
}
