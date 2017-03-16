package homepage.board.reply;

import java.sql.*;
import java.util.ArrayList;

public class ReplyDAO {
	private Connection connect() throws Exception{ //DB ���� �޼ҵ�
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
		String username = "jsp21";
		String password = "jsp21";
		Connection con = DriverManager.getConnection(url, username, password);
		
		return con;
	}
	
	public void reply(ReplyDTO rdto) throws Exception{ //��� ��� �޼ҵ�
		Connection con = this.connect();
		String sql = "insert into reply values(reply_seq.nextval, ?, ?, ?, sysdate)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, rdto.getId());
		ps.setString(2, rdto.getDetail());
		ps.setInt(3, rdto.getBelong());
		ps.execute();
		con.close();
	}
	
	public ArrayList<ReplyDTO> list(int belong) throws Exception{ //��� ��� �ҷ����� �޼ҵ�
		Connection con = this.connect();
		String sql = "Select * from reply where belong=? order by reg asc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, belong);
		ResultSet rs = ps.executeQuery();
		
		ArrayList<ReplyDTO> list = new ArrayList<>();
		while(rs.next()){
			ReplyDTO rdto = new ReplyDTO();
			rdto.setNo(rs.getInt("no"));
			rdto.setId(rs.getString("id"));
			rdto.setDetail(rs.getString("detail"));
			rdto.setBelong(rs.getInt("belong"));
			rdto.setReg(rs.getString("reg"));
			list.add(rdto);
		}
		con.close();
		
		return list;
	}
}
