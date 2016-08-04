package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bean.MemberDAO;
import bean.MemberDTO;

public class userDeleteProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String mem_id = (String) request.getSession().getAttribute("mem_id");
		String passwd = request.getParameter("passwd");
		boolean delChk = false;

		MemberDAO dao = new MemberDAO();
		MemberDTO mDto = dao.getMember(mem_id);
		if (passwd.equals(mDto.getUser_passwd())) {
			delChk = dao.deleteMember(mem_id);
		}
		request.setAttribute("delChk", delChk);
		return "/userDeletePro.jsp";
	}
}