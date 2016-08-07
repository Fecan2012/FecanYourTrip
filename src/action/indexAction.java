package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class indexAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		if (request.getParameter("sectl") != null) {
			int sectl = Integer.parseInt(request.getParameter("sectl"));
			if (sectl == 1) {
				request.getSession().removeAttribute("mem_id");
				request.getSession().removeAttribute("grade");
			}
		}
		return "/index.jsp";
	}
}