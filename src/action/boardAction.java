package action;

import java.util.Collections;
import java.util.Hashtable;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.BoardDAO;

public class boardAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String pageNum = request.getParameter("pageNum");
		String mem_id = (String) request.getSession().getAttribute("mem_id");
		BoardDAO bdPro = new BoardDAO();
		int count = bdPro.getArticleCount();
		int grant = bdPro.getGrant(mem_id);
		Hashtable<String, Integer> pgList = bdPro.pageList(pageNum, count);
		List articleList = null;

		if (count > 0) {
			System.out.println(pgList.get("startRow") + "," + pgList.get("endRow"));
			articleList = bdPro.getArticles(pgList.get("startRow"), pgList.get("endRow"), pgList.get("pageSize"));
		} else {
			articleList = Collections.EMPTY_LIST;
		}

		request.setAttribute("grant", grant);
		request.setAttribute("pgList", pgList);
		request.setAttribute("articleList", articleList);
		return "/board.jsp";
	}
}
