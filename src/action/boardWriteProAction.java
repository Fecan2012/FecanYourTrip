package action;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bean.BoardDAO;
import bean.BoardDTO;

public class boardWriteProAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		BoardDTO article = new BoardDTO();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yy");
		Timestamp tsp = new Timestamp(System.currentTimeMillis());
		article.setUserid(request.getParameter("userid"));
		article.setSubject(request.getParameter("subject"));
		article.setRegdate(tsp);
		article.setContent(request.getParameter("content"));
		BoardDAO dbPro = new BoardDAO();
		int grant = dbPro.getGrant(request.getParameter("userid")); 
		int check = dbPro.insertArticle(article, grant);
		request.setAttribute("check", check);
		return "/boardWritePro.jsp";
	}
}