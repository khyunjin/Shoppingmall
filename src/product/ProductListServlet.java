package product;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProductListServlet")

public class ProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String kind = request.getParameter("kind");
		String subkind = request.getParameter("subkind");
		String bestyn = request.getParameter("bestyn");
		String newyn = request.getParameter("newyn");
		
		if(bestyn != null) {
			ProductDAO dao = new ProductDAO();
			ArrayList<ProductDTO> bestlist = dao.bestlist(bestyn);
			request.setAttribute("bestlist", bestlist);
			response.sendRedirect("product_list.jsp?bestyn=" + bestyn); 
			}
		if(newyn != null) {
			ProductDAO dao = new ProductDAO();
			ArrayList<ProductDTO> newlist = dao.newlist(newyn);
			request.setAttribute("newlist", newlist);
			response.sendRedirect("product_list.jsp?newyn=" + newyn); 
			}
		if(kind != null) {
			ProductDAO dao = new ProductDAO();
			ArrayList<ProductDTO> kindlist = dao.kindlist(kind);
			request.setAttribute("kindlist", kindlist);
			response.sendRedirect("product_list.jsp?kind=" + kind); 
			}
		if(subkind != null) {
			ProductDAO dao = new ProductDAO();
			ArrayList<ProductDTO> subkindlist = dao.subkindlist(subkind);
			request.setAttribute("subkindlist", subkindlist);
			response.sendRedirect("product_list.jsp?subkind=" + subkind); 
			}
	}
}