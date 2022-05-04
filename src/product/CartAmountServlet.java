package product;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CartAmountServlet")

public class CartAmountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CartAmountServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		int cartnum = Integer.parseInt(request.getParameter("cartnum")); 
		int quantity = Integer.parseInt(request.getParameter("quantity")); 
				
		int result = new ProductDAO().cartamount(quantity, cartnum);
		if(result == 1) {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('해당 제품의 수량을 변경했습니다.'); location.href='product_cartlist.jsp'</script>");
			return;
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('에러'); location.href='javascript:history.back()'</script>");
			return;
		}

		
	}

}