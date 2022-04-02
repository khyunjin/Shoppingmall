package user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserPwdFindServlet")

public class UserPwdFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		UserDTO dto = new UserDTO();
		dto.setName(request.getParameter("name"));
		dto.setId(request.getParameter("id"));
		dto.setEid(request.getParameter("eid"));
		dto.setEdomain(request.getParameter("edomain"));
		
		UserDAO dao = new UserDAO();
		String pwd = dao.userpwdfind(dto);

		if(pwd != null) {
			response.sendRedirect("user_findresult.jsp?pwd="+pwd);
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비밀번호 찾기에 성공하였습니다'); location.href='user_findresult.jsp';</script>");
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비밀번호 찾기에 실패하였습니다.'); location.href='index.jsp';</script>");
		} 
		
	}

}

