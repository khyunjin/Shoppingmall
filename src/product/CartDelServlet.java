package product;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CartDelServlet")

public class CartDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CartDelServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		int cartnum = Integer.parseInt(request.getParameter("cartnum")); 
				
		int result = new ProductDAO().cartdel(cartnum);
		if(result == 1) {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('해당 제품이 장바구니에서 삭제되었습니다.'); location.href='cart_list.jsp'</script>");
			return;
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('실패'); location.href='javascript:history.back()'</script>");
			return;
		}
	}

}
