package user;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UserDelServlet")

public class UserDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserDelServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("id");
		
		int result = new UserDAO().userdel(id);
		if(result == 1) {
			session.invalidate();
			PrintWriter out = response.getWriter();
			out.println("<script>alert('회원탈퇴되었습니다.'); location.href='index.jsp';</script>");
			return;
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('실패'); location.href='index.jsp';</script>");
			return;
		}
	}

}
