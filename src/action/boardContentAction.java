package action;

import java.util.Collections;
import java.util.Hashtable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.BoardDAO;
import bean.BoardDTO;
import bean.RepleDAO;

public class boardContentAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		String mem_id = (String) request.getSession().getAttribute("mem_id");
		BoardDAO dbPro = new BoardDAO();
		BoardDTO article = dbPro.getArticle(num);
		request.setAttribute("num", new Integer(num));
		request.setAttribute("pageNum", new Integer(pageNum));
		request.setAttribute("article", article);
		int grant = dbPro.getGrant(mem_id);
		RepleDAO dao = new RepleDAO();
		int count = dao.getRepleCount(num);
		Hashtable<String, Integer> pgList = dao.pageList(pageNum, count);
		List RepleList = null;
		if (count > 0) {
			RepleList = dao.getReples(pgList.get("startRow"), pgList.get("endRow"), pgList.get("pageSize"), num);
		} else { // 데이터가 없다는 표시
			RepleList = Collections.EMPTY_LIST;
		}
		request.setAttribute("pgList", pgList);
		request.setAttribute("repleList", RepleList);
		request.setAttribute("grant", grant);
		return "/boardContent.jsp";
	}
}
