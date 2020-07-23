package member.model;

import java.sql.Date;

public class Member {
	private int idx;
	private String id;
	private String pw;
	private String nick;
	private Double score;
	private Date regDate;
	private String addr;
	private String photo;
	
	
	public Member() {}
	
	public Member(int idx, String id, String pw, String nick, Double score, Date regDate, String addr,
			String photo) {
		this.idx = idx;
		this.id = id;
		this.pw = pw;
		this.nick = nick;
		this.score = score;
		this.regDate = regDate;
		this.addr = addr;
		this.photo = photo;
	}
	
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public Double getScore() {
		return score;
	}
	public void setScore(Double score) {
		this.score = score;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	@Override
	public String toString() {
		return "Member [idx=" + idx + ", id=" + id + ", pw=" + pw + ", nick=" + nick + ", score=" + score + ", regDate="
				+ regDate + ", addr=" + addr + ", photo=" + photo + "]";
	}

	
	
}
