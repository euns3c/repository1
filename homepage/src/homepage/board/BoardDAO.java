package homepage.board;

import java.sql.*;
import java.util.ArrayList;

public class BoardDAO {

	private Connection connect() throws Exception{ //DB 연결 메소드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
		String username = "jsp21";
		String password = "jsp21";
		Connection con = DriverManager.getConnection(url, username, password);
		
		return con;
	}
	
	public void write(BoardDTO bdto, String id) throws Exception{ //write 메소드
		Connection con = this.connect();
		String sql = "insert into board values(board_seq.nextval, ?, sysdate, ?, ?, ?, 0, 0)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, bdto.getHead());
		ps.setString(3, bdto.getTitle());
		ps.setString(4, bdto.getDetail(BoardDTO.textarea));
		ps.execute();
		con.close();
	}
	
	public ArrayList<BoardDTO> list(String type, String key, int sn, int en) throws Exception{ //글 목록을 불러오는 메소드 (검색과 페이징도 포함)
		Connection con = this.connect();
		String sql = "select * from (select rownum rn, A.* from (select * from board where "+type+" like ? order by no desc)A) where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, "%"+key+"%");
		ps.setInt(2, sn);
		ps.setInt(3, en);
		ResultSet rs = ps.executeQuery();
		
		ArrayList<BoardDTO> list = new ArrayList<>();
		while(rs.next()){
			BoardDTO bdto = new BoardDTO();
			bdto.setNo(rs.getInt("no"));
			bdto.setId(rs.getString("id"));
			bdto.setReg(rs.getString("reg"));
			bdto.setHead(rs.getString("head"));
			bdto.setTitle(rs.getString("title"));
			bdto.setDetail(rs.getString("detail"));
			bdto.setHit(rs.getInt("hit"));
			bdto.setReply(rs.getInt("reply"));
			
			list.add(bdto);
		}
		
		con.close();
		
		return list;
	}
	
	public BoardDTO detail(int no) throws Exception{ //글내용 보기 메소드
		Connection con = this.connect();
		String sql = "select * from board where no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, no);
		ResultSet rs = ps.executeQuery();
		
		BoardDTO bdto = new BoardDTO();
		
		while(rs.next()){
		bdto.setNo(rs.getInt("no"));
		bdto.setId(rs.getString("id"));
		bdto.setReg(rs.getString("reg"));
		bdto.setHead(rs.getString("head"));
		bdto.setTitle(rs.getString("title"));
		bdto.setDetail(rs.getString("detail"));
		bdto.setHit(rs.getInt("hit"));
		bdto.setReply(rs.getInt("reply"));
		}
		
		con.close();
		
		return bdto;
	}
	
	public void upHit(int no) throws Exception{ //조회수가 올라가는 메소드
		Connection con = this.connect();
		String sql = "update board set hit=hit+1 where no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, no);
		ps.execute();
		con.close();
	}
	
	public void upReply(int belong) throws Exception{ //댓글수가 올라가는 메소드
		Connection con = this.connect();
		String sql = "update board set reply=reply+1 where no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, belong);
		ps.execute();
		con.close();
	}
	
	public void modify(BoardDTO bdto, int no) throws Exception{ //글 수정 메소드
		Connection con = this.connect();
		String sql = "update board set head=?, title=?, detail=? where no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, bdto.getHead());
		ps.setString(2, bdto.getTitle());
		ps.setString(3, bdto.getDetail(BoardDTO.textarea));
		ps.setInt(4, no);
		ps.execute();
		con.close();
	}
	
	public void delete(int no) throws Exception{ //글 삭제 메소드
		Connection con = this.connect();
		String sql = "delete from board where no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, no);
		ps.execute();
		con.close();
	}
	
	public int count(String type, String key) throws Exception{
		Connection con = this.connect();
		
		String sql = "select count(*) from board where "+type+" like ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, "%"+key+"%");
		ResultSet rs = ps.executeQuery();
		rs.next(); //100% 있으므로 바로 이동. 0도 결과다.
		int count = rs.getInt(1); //rs.getInt("count(*)");
		
		con.close();
		return count;
	}
	
}

