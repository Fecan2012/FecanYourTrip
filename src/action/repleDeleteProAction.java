package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bean.BoardDAO;
import bean.RepleDAO;

public class repleDeleteProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int articleNum = Integer.parseInt(request.getParameter("articleNum"));
		String userid = request.getParameter("userid");
		int repleNum = Integer.parseInt(request.getParameter("repleNum"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		RepleDAO dao = new RepleDAO();
		BoardDAO dao2 = new BoardDAO();
		int grant = dao2.getGrant(userid);
		int check = dao.deleteReple(repleNum, userid, articleNum, grant);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("check", check);
		request.setAttribute("num", articleNum);
		return "/repleDeletePro.jsp";
	}
}