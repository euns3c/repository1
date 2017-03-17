package homepage.member;

import java.sql.*;

public class MemberDAO {

	//DB connect와 signUp() 메소드
	
	private Connection connect() throws Exception{ //DB 연결 메소드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
		String username = "jsp21";
		String password = "jsp21";
		Connection con = DriverManager.getConnection(url, username, password);
		
		return con;
	}
	
	public void signUp(MemberDTO mdto) throws Exception{ //signUp 메소드
		Connection con = this.connect();
		
		String sql = "insert into member values(member_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, '사용자', sysdate)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, mdto.getId());
		ps.setString(2, mdto.getName());
		ps.setString(3, mdto.getPw());
		ps.setString(4, mdto.getBirth());
		ps.setString(5, mdto.getTel());
		ps.setString(6, mdto.getEmail());
		ps.setString(7, mdto.getPost());
		ps.setString(8, mdto.getAddr1());
		ps.setString(9, mdto.getAddr2());
		ps.execute();
		
		con.close();
	}
	
	public boolean login(String id, String pw) throws Exception{ //login 메소드
		Connection con = this.connect();
		String sql = "select * from member where id=? and pw=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, pw);
		ResultSet rs = ps.executeQuery();
		
		boolean result = rs.next();
		con.close();
		
		return result;
	}
	
	public MemberDTO mypage(String id) throws Exception{ //내정보 메소드
		Connection con = this.connect();
		String sql = "select * from member where id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();

		MemberDTO mdto = new MemberDTO();
		while(rs.next()){
			mdto.setId(rs.getString("id"));
			mdto.setName(rs.getString("name"));
			mdto.setPw(rs.getString("pw"));
			mdto.setBirth(rs.getString("birth"));
			mdto.setTel(rs.getString("tel"));
			mdto.setEmail(rs.getString("email"));
			mdto.setPost(rs.getString("post"));
			mdto.setAddr1(rs.getString("addr1"));
			mdto.setAddr2(rs.getString("addr2"));
		}
		
		con.close();
		return mdto;
	}
	
	public void edit(MemberDTO mdto, String id) throws Exception{ //내정보 수정 메소드
		Connection con = this.connect();
		String sql = "update member set pw=?, birth=?, tel=?, email=?, post=?, addr1=?, addr2=? where id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, mdto.getPw());
		ps.setString(2, mdto.getBirth());
		ps.setString(3, mdto.getTel());
		ps.setString(4, mdto.getEmail());
		ps.setString(5, mdto.getPost());
		ps.setString(6, mdto.getAddr1());
		ps.setString(7, mdto.getAddr2());
		ps.setString(8, id);
		ps.execute();
		con.close();
	}
	
	public void withdraw(String id) throws Exception{ //회원 탈퇴 메소드
		Connection con = this.connect();
		String sql = "delete from member where id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ps.execute();
		con.close();
	}
	
	public boolean idOverCheck(String id) throws Exception{ //아이디 중복 확인 메소드
		Connection con = this.connect();
		String sql = "select id from member where id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		boolean result = rs.next();
		con.close();
		return result;
	}
}

