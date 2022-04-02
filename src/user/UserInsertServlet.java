package user;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserInsertServlet")

public class UserInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserInsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd1");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String eid = request.getParameter("eid");
		String edomain = request.getParameter("edomain");
		String postcode = request.getParameter("postcode");
		String address = request.getParameter("address");
		String detailAddress = request.getParameter("detailAddress");
		String extraAddress = request.getParameter("extraAddress");
		
		int result = new UserDAO().userinsert(id,pwd,name,gender,phone1,phone2,phone3,eid,edomain,postcode,address,detailAddress,extraAddress);
		if(result == 1) {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('회원가입에 성공하였습니다'); location.href='index.jsp';</script>");
			return;
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('회원가입에 실패하였습니다'); location.href='index.jsp';</script>");
			return;
		}
	}

}
