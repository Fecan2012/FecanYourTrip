package action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.PostDAO;
import bean.PostDTO;
import bean.RepleDAO;
import bean.RepleDTO;

public class rateUpdateProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		PostDTO post = new PostDTO();
		PostDAO dao = new PostDAO();
		String path = request.getParameter("imgPath");
		String tab = request.getParameter("tab");
		int score = Integer.parseInt(request.getParameter("score"));
		float rate;
		int rateNum;
		float totalScore;

		post = dao.getPost(path);

		rate = post.getRaitings();
		rateNum = post.getRatenum();
		rate *= rateNum;

		totalScore = (float) (rate + score) / (++rateNum);
		rate = totalScore;

		dao.changeRaiting(path, rate, rateNum);

		request.setAttribute("postContent", post);
		request.setAttribute("tab", tab);

		return "/rateUpdatePro.jsp";
	}
}
