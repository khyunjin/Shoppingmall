package product;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/OrderListServlet")

public class OrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		HttpSession session = request.getSession();
		String sessionid = (String)session.getAttribute("id");
		ProductDAO dao = new ProductDAO();
		
		ArrayList<OrderDTO> orderlist = dao.orderlist(sessionid);
	
		request.setAttribute("orderlist", orderlist);
		response.sendRedirect("product_orderlist.jsp?id=" + sessionid); 
	}
}