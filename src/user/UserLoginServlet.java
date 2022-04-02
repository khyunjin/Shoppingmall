package user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UserLoginServlet")

public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=UTF-8");
	
		UserDAO dao = new UserDAO();
		UserDTO dto = new UserDTO();
		dto.setId(request.getParameter("id"));
		dto.setPwd(request.getParameter("pwd1"));
		
		UserDTO result = dao.userlogin(dto);

		if(result != null && result.getId()!=null) {
			session.setAttribute("id", result.getId());
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인에 성공하였습니다'); location.href='index.jsp';</script>");
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('아이디 또는 비밀번호가 틀립니다'); location.href='index.jsp';</script>");
		} 
		
	}

}

