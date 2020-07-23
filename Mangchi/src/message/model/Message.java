package message.model;
// 보낸 사람, 받는 사람 타입 수정해야함
import java.sql.Date;

public class Message {
	
	private int msg_idx;
	private int req_idx;
	private int msg_receiver;
	private int msg_writer;
	private String msg_text;
	private String msg_img;
	private Date msg_date;
	private int readcheck;
	
	String msg_receiverId;
	String msg_writerId;
	
		
	public Message() {
	}

	public Message(int msg_idx, int req_idx, int msg_receiver, int msg_writer, String msg_text, String msg_img,
			Date msg_date, int readcheck) {
		this.msg_idx = msg_idx;
		this.req_idx = req_idx;
		this.msg_receiver = msg_receiver;
		this.msg_writer = msg_writer;
		this.msg_text = msg_text;
		this.msg_img = msg_img;
		this.msg_date = msg_date;
		this.readcheck = readcheck;
	}
	
	

	public Message(int msg_idx, int req_idx, String msg_text, String msg_img, Date msg_date, int readcheck,
			String msg_receiverId, String msg_writerId) {
		this.msg_idx = msg_idx;
		this.req_idx = req_idx;
		this.msg_text = msg_text;
		this.msg_img = msg_img;
		this.msg_date = msg_date;
		this.readcheck = readcheck;
		this.msg_receiverId = msg_receiverId;
		this.msg_writerId = msg_writerId;
	}

	public int getMsg_idx() {
		return msg_idx;
	}

	public void setMsg_idx(int msg_idx) {
		this.msg_idx = msg_idx;
	}

	public int getReq_idx() {
		return req_idx;
	}

	public void setReq_idx(int req_idx) {
		this.req_idx = req_idx;
	}

	public int getMsg_receiver() {
		return msg_receiver;
	}

	public void setMsg_receiver(int msg_receiver) {
		this.msg_receiver = msg_receiver;
	}

	public int getMsg_writer() {
		return msg_writer;
	}

	public void setMsg_writer(int msg_writer) {
		this.msg_writer = msg_writer;
	}

	public String getMsg_text() {
		return msg_text;
	}

	public void setMsg_text(String msg_text) {
		this.msg_text = msg_text;
	}

	public String getMsg_img() {
		return msg_img;
	}

	public void setMsg_img(String msg_img) {
		this.msg_img = msg_img;
	}

	public Date getMsg_date() {
		return msg_date;
	}

	public void setMsg_date(Date msg_date) {
		this.msg_date = msg_date;
	}

	public int getReadcheck() {
		return readcheck;
	}

	public void setReadcheck(int readcheck) {
		this.readcheck = readcheck;
	}
	
	
	

	public String getMsg_receiverId() {
		return msg_receiverId;
	}

	public void setMsg_receiverId(String msg_receiverId) {
		this.msg_receiverId = msg_receiverId;
	}

	public String getMsg_writerId() {
		return msg_writerId;
	}

	public void setMsg_writerId(String msg_writerId) {
		this.msg_writerId = msg_writerId;
	}

	@Override
	public String toString() {
		return "Message [msg_idx=" + msg_idx + ", req_idx=" + req_idx + ", msg_receiver=" + msg_receiver
				+ ", msg_writer=" + msg_writer + ", msg_text=" + msg_text + ", msg_img=" + msg_img + ", msg_date="
				+ msg_date + ", readcheck=" + readcheck + "]";
	}
	
}
