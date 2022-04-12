package product;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/OrderListServlet")

public class OrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String id = request.getParameter("id"); 
		ProductDAO dao = new ProductDAO();
		
		ArrayList<OrderDTO> orderlist = dao.orderlist(id);
	
		request.setAttribute("orderlist", orderlist);
		response.sendRedirect("product_orderlist.jsp?id=" + id); 
	}
}