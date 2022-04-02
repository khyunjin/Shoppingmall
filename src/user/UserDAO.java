package user;

import java.sql.*;

public class UserDAO {
	
	private Connection conn;
	
	public UserDAO() {
		try {
			String url="jdbc:oracle:thin:@localhost:1521:xe";
			String user="khyunjin";
			String pw="1234";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 아이디 중복 체크
	public int idCheck(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from shop_member_tbl where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next() || id.equals("")) {
				return 0;	// 이미 존재하는 id
			} else {
				return 1;	// 사용 가능 id
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs !=null) rs.close();
				if(rs !=null) pstmt.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;	// 데이터 베이스 오류
	}
	
	
	// 회원가입
	public int userinsert(String id, String pwd, String name, String gender, String phone1, String phone2, String phone3, String eid, String edomain, String postcode, String address, String detailAddress, String extraAddress) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into shop_member_tbl values(?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);
			pstmt.setString(4, gender);
			pstmt.setString(5, phone1);
			pstmt.setString(6, phone2);
			pstmt.setString(7, phone3);
			pstmt.setString(8, eid);
			pstmt.setString(9, edomain);
			pstmt.setString(10, postcode);
			pstmt.setString(11, address);
			pstmt.setString(12, detailAddress);
			pstmt.setString(13, extraAddress);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs !=null) rs.close();
				if(rs !=null) pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;	// 데이터 베이스 오류
	}
	

	// 회원정보 받기
	public UserDTO userget(String id) {
		UserDTO user = new UserDTO();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from shop_member_tbl where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				user.setId(id);
				user.setPwd(rs.getString("pwd"));
				user.setName(rs.getString("name"));
				user.setGender(rs.getString("gender"));
				user.setPhone1(rs.getString("phone1"));
				user.setPhone2(rs.getString("phone2"));
				user.setPhone3(rs.getString("phone3"));
				user.setEid(rs.getString("eid"));
				user.setEdomain(rs.getString("edomain"));
				user.setPostcode(rs.getString("postcode"));
				user.setAddress(rs.getString("address"));
				user.setDetailAddress(rs.getString("detailAddress"));
				user.setExtraAddress(rs.getString("extraAddress"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs !=null) rs.close();
				if(rs !=null) pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return user;	// 데이터 베이스 오류
	}
	
	
	// 회원정보 수정 
	public int userupdate(String id, String pwd, String name, String gender, String phone1, String phone2, String phone3, String eid, String edomain, String postcode, String address, String detailAddress, String extraAddress) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "update shop_member_tbl set pwd=?, name=?, gender=?, phone1=?, phone2=?, phone3=?, eid=?, edomain=?, postcode=?, address=?, detailAddress=?, extraAddress=? where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, name);
			pstmt.setString(3, gender);
			pstmt.setString(4, phone1);
			pstmt.setString(5, phone2);
			pstmt.setString(6, phone3);
			pstmt.setString(7, eid);
			pstmt.setString(8, edomain);
			pstmt.setString(9, postcode);
			pstmt.setString(10, address);
			pstmt.setString(11, detailAddress);
			pstmt.setString(12, extraAddress);
			pstmt.setString(13, id);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs !=null) rs.close();
				if(rs !=null) pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;	// 데이터 베이스 오류
	}

	// 회원 로그인
	public UserDTO userlogin(UserDTO dto) {
		UserDTO login = new UserDTO();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from shop_member_tbl where id=? and pwd=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				login.setId(rs.getString("id"));
				login.setPwd(rs.getString("pwd"));
			} 
		} catch (Exception e) {
			e.printStackTrace();
			}finally {
				try {
					if(rs !=null) rs.close();
					if(rs !=null) pstmt.close();
				}catch (Exception e) {
					e.printStackTrace();
				}
			} return login;
		}
	
	// 아이디 찾기
	public String useridfind(UserDTO dto) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String id = null;
		String sql = "select id from shop_member_tbl where name=? and eid=? and edomain=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getEid());
			pstmt.setString(3, dto.getEdomain());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				id = rs.getString("id");
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} return id;
	}
	
	// 비밀번호 찾기
	public String userpwdfind(UserDTO dto) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String pwd = null;
		String sql = "select pwd from shop_member_tbl where name=? and id=? and eid=? and edomain=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getEid());
			pstmt.setString(4, dto.getEdomain());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pwd = rs.getString("pwd");
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} return pwd;
	}
}
