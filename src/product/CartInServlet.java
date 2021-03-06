package product;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CartInServlet")

public class CartInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CartInServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String id = request.getParameter("id");
		int prodnum = Integer.parseInt(request.getParameter("prodnum"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		String prodcolor = request.getParameter("prodcolor");
		String prodsize = request.getParameter("prodsize");
		
		int result = new ProductDAO().cartin(id,prodnum,quantity,prodcolor,prodsize);
		if(result == 1) {
			PrintWriter out = response.getWriter();
			out.println("<script>if(confirm('장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?')){ location.href='product_cartlist.jsp'; } else { location.href='javascript:history.back()' } </script>");
			return;
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('장바구니 담기에 실패했습니다.'); location.href='javascript:history.back()'</script>");
			return;
		}
		
	}

}
