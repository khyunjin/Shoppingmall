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
						if(rs !=null) conn.close();
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
						if(rs !=null) conn.close();
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
						if(rs !=null) conn.close();
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
						if(rs !=null) conn.close();
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
		String sql = "select * from shop_product_tbl where prodnum =?";
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
				if(rs !=null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return prod;
	}
	
	// 상품 옵션 받기(prodcolor)
	public ArrayList<ProductDTO> colorlist(int prodnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from shop_prodcolor_tbl where prodnum=?";
		ArrayList<ProductDTO> colorlist = new ArrayList<ProductDTO>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, prodnum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setProdcolor(rs.getString("prodcolor"));
				colorlist.add(dto);
				}
			} catch (Exception e) {
				e.printStackTrace();
				}finally {
					try {
						if(rs !=null) rs.close();
						if(rs !=null) pstmt.close();
						if(rs !=null) conn.close();
					}catch (Exception e) {
						e.printStackTrace();
					}
				} return colorlist;
			}
	
	
	// 상품 옵션 받기(prodsize)
	public ArrayList<ProductDTO> sizelist(int prodnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from shop_prodsize_tbl where prodnum=?";
		ArrayList<ProductDTO> sizelist = new ArrayList<ProductDTO>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, prodnum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setProdsize(rs.getString("prodsize"));
				sizelist.add(dto);
				}
			} catch (Exception e) {
				e.printStackTrace();
				}finally {
					try {
						if(rs !=null) rs.close();
						if(rs !=null) pstmt.close();
						if(rs !=null) conn.close();
					}catch (Exception e) {
						e.printStackTrace();
					}
				} return sizelist;
			}
	
	
	// 장바구니 담기
	public int cartin(String id, int prodnum, int quantity, String prodcolor, String prodsize) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into shop_cart_tbl(cartnum, id, prodnum, quantity, prodcolor, prodsize) values(cartseq.nextval,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, prodnum);
			pstmt.setInt(3, quantity);
			pstmt.setString(4, prodcolor);
			pstmt.setString(5, prodsize);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs !=null) rs.close();
				if(rs !=null) pstmt.close();
				if(rs !=null) conn.close();
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
				dto.setProdcolor(rs.getString("prodcolor"));
				dto.setProdsize(rs.getString("prodsize"));
				cartlist.add(dto);
				}
			} catch (Exception e) {
				e.printStackTrace();
				}finally {
					try {
						if(rs !=null) rs.close();
						if(rs !=null) pstmt.close();
						if(rs !=null) conn.close();
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
				if(rs !=null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;	// 데이터 베이스 오류
	}
	
	// 상품페이지에서 즉시 주문하기
	public int orderdirect(String ordernum, String id, int allquantity, int totalprice, String ordername, String orderadd, String orderphone, String orderreq, String ordernum2, int prodnum, int quantity, String prodcolor, String prodsize) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert all into shop_order_tbl(ordernum, id, allquantity, totalprice, ordername, orderadd, orderphone, orderreq) values(?,?,?,?,?,?,?,?) into shop_odetail_tbl(odetailnum, ordernum, prodnum, quantity, prodcolor, prodsize) values(odetailseq.nextval,?,?,?,?,?) select * from dual";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ordernum);
			pstmt.setString(2, id);
			pstmt.setInt(3, allquantity);
			pstmt.setInt(4, totalprice);
			pstmt.setString(5, ordername);
			pstmt.setString(6, orderadd);
			pstmt.setString(7, orderphone);
			pstmt.setString(8, orderreq);
			pstmt.setString(9, ordernum2);
			pstmt.setInt(10, prodnum);
			pstmt.setInt(11, quantity);
			pstmt.setString(12, prodcolor);
			pstmt.setString(13, prodsize);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs !=null) rs.close();
				if(rs !=null) pstmt.close();
				if(rs !=null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;	// 데이터 베이스 오류
	}

	
	// 장바구니에서 전체상품 주문하기 - shop_order_tbl에 값 저장
	public int orderin(String ordernum, String id, int allquantity, int totalprice, String ordername, String orderadd, String orderphone, String orderreq) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into shop_order_tbl(ordernum, id, allquantity, totalprice, ordername, orderadd, orderphone, orderreq) values(?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ordernum);
			pstmt.setString(2, id);
			pstmt.setInt(3, allquantity);
			pstmt.setInt(4, totalprice);
			pstmt.setString(5, ordername);
			pstmt.setString(6, orderadd);
			pstmt.setString(7, orderphone);
			pstmt.setString(8, orderreq);
			return pstmt.executeUpdate();
			} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs !=null) rs.close();
				if(rs !=null) pstmt.close();
				if(rs !=null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;	// 데이터 베이스 오류
	}
	

	// 장바구니에서 전체상품 주문하기 - shop_odetail_tbl 값 저장
	public int odetailin(String ordernum, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into shop_odetail_tbl(odetailnum, ordernum, prodnum, quantity, prodcolor, prodsize) select odetailseq.nextval, ?, prodnum, quantity, prodcolor, prodsize from shop_cart_tbl where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ordernum);
			pstmt.setString(2, id);
			return pstmt.executeUpdate();
			} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs !=null) rs.close();
				if(rs !=null) pstmt.close();
				if(rs !=null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;	// 데이터 베이스 오류
	}
	
	
	// 전체주문 완료 후 장바구니 비우기
		public int cartalldel(String id) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "delete from shop_cart_tbl where id=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
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
		
	
	// 받는 사람 정보
	public OrderDTO orderget(String ordernum) {
		OrderDTO order = new OrderDTO();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from shop_order_tbl where ordernum=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ordernum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				order.setOrdernum(ordernum);
				order.setOrdername(rs.getString("ordername"));
				order.setOrderadd(rs.getString("orderadd"));
				order.setOrderphone(rs.getString("orderphone"));
				order.setOrderreq(rs.getString("orderreq"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs !=null) rs.close();
				if(rs !=null) pstmt.close();
				if(rs !=null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return order;	// 데이터 베이스 오류
	}
	
	
	// 주문 조회(리스트)
	public ArrayList<OrderDTO> orderlist(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from order_view where id=?";
		ArrayList<OrderDTO> orderlist = new ArrayList<OrderDTO>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				OrderDTO dto = new OrderDTO();
				dto.setId(rs.getString("id"));
				dto.setOrdernum(rs.getString("ordernum"));
				dto.setOrderindate(rs.getString("orderindate"));
				dto.setProdnum(rs.getInt("prodnum"));
				dto.setImage(rs.getString("image"));
				dto.setName(rs.getString("name"));
				dto.setProdcolor(rs.getString("prodcolor"));
				dto.setProdsize(rs.getString("prodsize"));
				dto.setQuantity(rs.getInt("quantity"));
				dto.setPrice(rs.getInt("price"));
				dto.setDeliveryyn(rs.getString("deliveryyn"));
				orderlist.add(dto);
				}
			} catch (Exception e) {
				e.printStackTrace();
				}finally {
					try {
						if(rs !=null) rs.close();
						if(rs !=null) pstmt.close();
						if(rs !=null) conn.close();
					}catch (Exception e) {
						e.printStackTrace();
					}
				} return orderlist;
			}
	
	
	// 주문 상세 조회
	public ArrayList<OrderDTO> orderdetail(String ordernum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from order_detail_view where ordernum=?";
		ArrayList<OrderDTO> orderdetail = new ArrayList<OrderDTO>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ordernum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				OrderDTO dto = new OrderDTO();
				dto.setOrdernum(rs.getString("ordernum"));
				dto.setOrdername(rs.getString("ordername"));
				dto.setOrderadd(rs.getString("orderadd"));
				dto.setOrderphone(rs.getString("orderphone"));
				dto.setOrderreq(rs.getString("orderreq"));
				dto.setImage(rs.getString("image"));
				dto.setName(rs.getString("name"));
				dto.setProdnum(rs.getInt("prodnum"));
				dto.setProdcolor(rs.getString("prodcolor"));
				dto.setProdsize(rs.getString("prodsize"));
				dto.setQuantity(rs.getInt("quantity"));
				dto.setPrice(rs.getInt("price"));
				dto.setTotalprice(rs.getInt("totalprice"));
				dto.setAllquantity(rs.getInt("allquantity"));
				orderdetail.add(dto);
				}
			} catch (Exception e) {
				e.printStackTrace();
				}finally {
					try {
						if(rs !=null) rs.close();
						if(rs !=null) pstmt.close();
						if(rs !=null) conn.close();
					}catch (Exception e) {
						e.printStackTrace();
					}
				} return orderdetail;
			}
}
