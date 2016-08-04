package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bean.PostDAO;
import bean.PostDTO;

public class predetailAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String path = request.getParameter("imgPath");
		String tab = request.getParameter("tab");
		PostDAO poDao = new PostDAO();
		PostDTO poDto = new PostDTO();
		boolean exist = poDao.postCheck(path);
		if (exist == true) {
			poDto = poDao.getPost(path);
		} else {
			System.out.println("System Error!!!");
		}
		request.setAttribute("postContent", poDto);
		request.setAttribute("tab", tab);
		return "/predetail.jsp";
	}
}
