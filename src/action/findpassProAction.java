package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bean.MemberDAO;
import bean.MemberDTO;

public class findpassProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		boolean pwChk = false;
		String pwd = "";
		String chkEmail = "";
		String userId = request.getParameter("id");
		String email = request.getParameter("email");
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = mdao.getMember(userId);
		chkEmail = mdto.getUser_email();
		if (email.equals(chkEmail)) {
			pwd = mdto.getUser_passwd();
			pwChk = true;
		}
		request.setAttribute("pwMatch", pwChk);
		request.setAttribute("passWd", pwd);
		return "/findpassPro.jsp";
	}
}