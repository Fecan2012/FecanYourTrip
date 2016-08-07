package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bean.BoardDAO;
import bean.MemberDAO;
import bean.MemberDTO;

public class afterloginAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String mem_id = (String) request.getSession().getAttribute("mem_id");
		MemberDAO dao = new MemberDAO();
		MemberDTO mem = new MemberDTO();
		BoardDAO bdao = new BoardDAO();
		mem = dao.getMember(mem_id);
		int grade = bdao.getGrant(mem_id);
		request.setAttribute("mem", mem);
		request.setAttribute("grade", grade);
		return "/afterlogin.jsp";
	}
}