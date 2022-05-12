package product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/OrderInServlet")

public class OrderInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderInServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		/* 주문번호 생성  */
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int subNum = 0;
		for(int i=1; i<= 6 ; i++) {
			subNum += (int)(Math.random() * 1000);
		}
		
		String ordernum = year + "" + subNum;
		String id = request.getParameter("id");
		int allquantity = Integer.parseInt(request.getParameter("allquantity"));
		int totalprice = Integer.parseInt(request.getParameter("totalprice"));
		String ordername = request.getParameter("ordername");
		String orderadd = request.getParameter("orderadd");
		String orderphone = request.getParameter("orderphone");
		String orderreq = request.getParameter("orderreq");
		
		/* 주문 테이블, 주문 상세 테이블에 데이터 저장 후 사용자 장바구니 비우기 */
		int result = new ProductDAO().orderin(ordernum,id,allquantity,totalprice,ordername,orderadd,orderphone,orderreq);
		int result2 = new ProductDAO().odetailin(ordernum,id);
		int result3 = new ProductDAO().cartalldel(id);
		
		if(result >= 0 && result2 >= 0 && result3 >= 0) {
			PrintWriter out = response.getWriter();
			out.println("<script>if(confirm('주문에 성공하였습니다. 주문 조회 페이지로 이동하시겠습니까?')){ location.href='product_orderlist.jsp'; } else { location.href='javascript:history.back()' } </script>");
			return;
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('주문하기에 실패했습니다.'); location.href='javascript:history.back()'</script>");
			return;
		}
		
	}

}

