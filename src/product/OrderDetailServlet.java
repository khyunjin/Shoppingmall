package product;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/OrderDetailServlet")

public class OrderDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String ordernum = request.getParameter("ordernum");
		ProductDAO dao = new ProductDAO();
		
		ArrayList<OrderDTO> orderdetail = dao.orderdetail(ordernum);
	
		request.setAttribute("orderdetail", orderdetail);
		response.sendRedirect("product_orderdetail.jsp?ordernum=" + ordernum); 
	}
}