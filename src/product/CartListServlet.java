package product;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CartListServlet")

public class CartListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		HttpSession session = request.getSession();
		String sessionid = (String)session.getAttribute("id");
		ProductDAO dao = new ProductDAO();
		
		ArrayList<CartDTO> cartlist = dao.cartlist(sessionid);
	
		request.setAttribute("cartlist", cartlist);
		response.sendRedirect("product_cartlist.jsp?id=" + sessionid); 
	}
}