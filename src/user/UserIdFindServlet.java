package user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserIdFindServlet")

public class UserIdFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		UserDTO dto = new UserDTO();
		dto.setName(request.getParameter("name"));
		dto.setEid(request.getParameter("eid"));
		dto.setEdomain(request.getParameter("edomain"));
		
		UserDAO dao = new UserDAO();
		
		String id = dao.useridfind(dto);

		if(id != null) {
            response.sendRedirect("user_findresult.jsp?id="+id);
			PrintWriter out = response.getWriter();
			out.println("<script>alert('아이디 찾기에 성공하였습니다'); location.href='user_findresult.jsp';</script>");
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('입력하신 정보로 가입된 회원 아이디는 존재 하지 않습니다'); location.href='index.jsp';</script>");
		} 
		
	}

}

