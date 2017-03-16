package homepage.board;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BoardDTO {
	private int no;
	private String id;
	private String reg;
	private String head;
	private String title;
	private String detail;
	private int hit;
	private int reply;
	
	public BoardDTO() {
		super();
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getReg() {
		return reg;
	}

	/* 시간 기능 추가 2017-02-23 13:35:05.0 */
	public String getDate(){
		return reg.substring(0, 10);
	}
	
	public String getTime(){
		return reg.substring(11, 16);
	}
	
	/* 자동으로 reg를 판별해주는 인공지능 메소드 */
	public String getAuto(){
		Date date = new Date();
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
		String today = simple.format(date);
		if(getDate().equals(today)){
			return getTime();
		}else{
			return getDate();
		}
	}
	
	public void setReg(String reg) {
		this.reg = reg;
	}

	public String getHead() {
		return head;
	}

	public void setHead(String head) {
		if(head == null){
			this.head = "";
		}else{
			this.head = head;
		}
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	/* textarea와 web에서는 enter가 다르게 먹힘. 이를 해결하기 위한 메소드 */
	public static final boolean textarea = true;
	public static final boolean web = false;
	
	public String getDetail(boolean enter) {
		if(enter){
			return detail; //textarea에서는 엔터가 \n인 상태로 반환
		}else{
			return detail.replace("\n", "<br>"); //web에서는 엔터가 <br>인 상태로 반환
		}
	}
	
	public void setDetail(String detail) {
		this.detail = detail;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getReply() {
		return reply;
	}

	public void setReply(int reply) {
		this.reply = reply;
	}
}
