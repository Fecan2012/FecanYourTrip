package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bean.MemberDAO;

public class userUpdateProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		String mem_id = request.getParameter("mem_id");
		String email = request.getParameter("email");
		String passwd = request.getParameter("mem_passwd");
		MemberDAO dao = new MemberDAO();
		int check = dao.changeMem(mem_id, passwd, email);
		request.setAttribute("check", check);
		return "/userUpdate.jsp";
	}
}