package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bean.BoardDAO;
import bean.BoardDTO;

public class boardUpdateProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String pageNum = request.getParameter("pageNum");
		BoardDTO article = new BoardDTO();
		article.setNum(Integer.parseInt(request.getParameter("num")));
		article.setUserid(request.getParameter("userid"));
		article.setSubject(request.getParameter("subject"));
		article.setContent(request.getParameter("content"));
		BoardDAO dao = new BoardDAO();
		int check = dao.updateArticle(article);
		request.setAttribute("pageNum", new Integer(pageNum));
		request.setAttribute("check", new Integer(check));
		return "/boardUpdatePro.jsp";
	}
}