package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.BoardDAO;
import bean.BoardDTO;

public class boardDeleteProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		BoardDTO dto = new BoardDTO();
		String pageNum = request.getParameter("pageNum");
		String userid = request.getParameter("userid");
		int num = Integer.parseInt(request.getParameter("num"));
		int check = -1;
		BoardDAO dao = new BoardDAO();
		int grant = dao.getGrant(userid);
		dto = dao.getArticle(num);
		if (userid.equals(dto.getUserid())) {
			check = dao.deleteArticle(num, grant);
		} else {
			check = 0;
		}
		dao.refresh();
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("check", check);
		return "/boardDeletePro.jsp";
	}
}
