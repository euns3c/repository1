package homepage.member;

public class MemberDTO {

	private int no;
	private String id;
	private String name;
	private String pw;
	private String birth;
	private String tel;
	private String email;
	private String post;
	private String addr1;
	private String addr2;
	private String power;
	private String reg;
	
	public MemberDTO() {
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getBirth() {
		if(birth==null) birth="";
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		if(email==null) email="";
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPost() {
		if(post==null) post="";
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getAddr1() {
		if(addr1==null) addr1="";
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		if(addr2==null) addr2="";
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getPower() {
		return power;
	}

	public void setPower(String power) {
		this.power = power;
	}

	public String getReg() {
		return reg;
	}

	public void setReg(String reg) {
		this.reg = reg;
	}
	
}
