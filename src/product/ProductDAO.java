package product;

import java.sql.*;
import java.util.ArrayList;

public class ProductDAO {

	private Connection conn;
	
	public ProductDAO() {
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
	
	
	// BEST 상품 진열
	public ArrayList<ProductDTO> bestlist(String bestyn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from shop_product_tbl where bestyn=?";
		ArrayList<ProductDTO> bestlist = new ArrayList<ProductDTO>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bestyn);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setProdnum(rs.getInt("prodnum"));
				dto.setName(rs.getString("name"));
				dto.setKind(rs.getString("kind"));
				dto.setSubkind(rs.getString("subkind"));
				dto.setPrice1(rs.getInt("price1"));
				dto.setPrice2(rs.getInt("price2"));
				dto.setPrice3(rs.getInt("price3"));
				dto.setContent(rs.getString("content"));
				dto.setImage(rs.getString("image"));
				dto.setBestyn(rs.getString("bestyn"));
				dto.setNewyn(rs.getString("newyn"));
				dto.setRegdate(rs.getString("regdate"));
				bestlist.add(dto);
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
				} return bestlist;
			}
	
	// NEW IN 상품 진열
	public ArrayList<ProductDTO> newlist(String newyn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from shop_product_tbl where newyn=?";
		ArrayList<ProductDTO> newlist = new ArrayList<ProductDTO>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newyn);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setProdnum(rs.getInt("prodnum"));
				dto.setName(rs.getString("name"));
				dto.setKind(rs.getString("kind"));
				dto.setSubkind(rs.getString("subkind"));
				dto.setPrice1(rs.getInt("price1"));
				dto.setPrice2(rs.getInt("price2"));
				dto.setPrice3(rs.getInt("price3"));
				dto.setContent(rs.getString("content"));
				dto.setImage(rs.getString("image"));
				dto.setBestyn(rs.getString("bestyn"));
				dto.setNewyn(rs.getString("newyn"));
				dto.setRegdate(rs.getString("regdate"));
				newlist.add(dto);
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
				} return newlist;
			}
	
	
	// 상위그룹 상품 진열
	public ArrayList<ProductDTO> kindlist(String kind) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from shop_product_tbl where kind=?";
		ArrayList<ProductDTO> kindlist = new ArrayList<ProductDTO>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, kind);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setProdnum(rs.getInt("prodnum"));
				dto.setName(rs.getString("name"));
				dto.setKind(rs.getString("kind"));
				dto.setSubkind(rs.getString("subkind"));
				dto.setPrice1(rs.getInt("price1"));
				dto.setPrice2(rs.getInt("price2"));
				dto.setPrice3(rs.getInt("price3"));
				dto.setContent(rs.getString("content"));
				dto.setImage(rs.getString("image"));
				dto.setBestyn(rs.getString("bestyn"));
				dto.setNewyn(rs.getString("newyn"));
				dto.setRegdate(rs.getString("regdate"));
				kindlist.add(dto);
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
				} return kindlist;
			}

	// 하위그룹 상품 진열
	public ArrayList<ProductDTO> subkindlist(String subkind) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from shop_product_tbl where subkind=?";
		ArrayList<ProductDTO> subkindlist = new ArrayList<ProductDTO>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, subkind);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setProdnum(rs.getInt("prodnum"));
				dto.setName(rs.getString("name"));
				dto.setKind(rs.getString("kind"));
				dto.setSubkind(rs.getString("subkind"));
				dto.setPrice1(rs.getInt("price1"));
				dto.setPrice2(rs.getInt("price2"));
				dto.setPrice3(rs.getInt("price3"));
				dto.setContent(rs.getString("content"));
				dto.setImage(rs.getString("image"));
				dto.setBestyn(rs.getString("bestyn"));
				dto.setNewyn(rs.getString("newyn"));
				dto.setRegdate(rs.getString("regdate"));
				subkindlist.add(dto);
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
				} return subkindlist;
			}
	
	
	// 상품정보 받기
	public ProductDTO productget(int prodnum) {
		ProductDTO prod = new ProductDTO();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from shop_product_tbl where prodnum=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, prodnum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				prod.setProdnum(prodnum);
				prod.setName(rs.getString("name"));
				prod.setKind(rs.getString("kind"));
				prod.setSubkind(rs.getString("subkind"));
				prod.setPrice1(rs.getInt("price1"));
				prod.setPrice2(rs.getInt("price2"));
				prod.setPrice3(rs.getInt("price3"));
				prod.setContent(rs.getString("content"));
				prod.setOpcolor(rs.getString("opcolor"));
				prod.setOpsize(rs.getString("opsize"));
				prod.setImage(rs.getString("image"));
				prod.setBestyn(rs.getString("bestyn"));
				prod.setNewyn(rs.getString("newyn"));
				prod.setRegdate(rs.getString("regdate"));
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
		return prod;
	}
	

	// 장바구니 담기
	public int cartin(String id, int prodnum, int quantity) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into shop_cart_tbl(cartnum, id, prodnum, quantity) values(cartseq.nextval,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, prodnum);
			pstmt.setInt(3, quantity);
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
	
	
	// 장바구니 조회(리스트)
	public ArrayList<CartDTO> cartlist(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from cart_view where id=?";
		ArrayList<CartDTO> cartlist = new ArrayList<CartDTO>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CartDTO dto = new CartDTO();
				dto.setCartnum(rs.getInt("cartnum"));
				dto.setId(rs.getString("id"));
				dto.setProdnum(rs.getInt("prodnum"));
				dto.setQuantity(rs.getInt("quantity"));
				dto.setName(rs.getString("name"));
				dto.setImage(rs.getString("image"));
				dto.setPrice2(rs.getInt("price2"));
				dto.setOpcolor(rs.getString("opcolor"));
				dto.setOpsize(rs.getString("opsize"));
				cartlist.add(dto);
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
				} return cartlist;
			}
	
	// 장바구니 삭제
	public int cartdel(int cartnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "delete from shop_cart_tbl where cartnum=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cartnum);
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
	
	// 장바구니 수량 변경
	public int cartamount(int quantity, int cartnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "update shop_cart_tbl set quantity=? where cartnum=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, quantity);
			pstmt.setInt(2, cartnum);
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

	
}
