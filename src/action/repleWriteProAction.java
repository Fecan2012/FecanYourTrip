package action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.RepleDAO;
import bean.RepleDTO;
import javafx.scene.input.DataFormat;

public class repleWriteProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		RepleDTO reple = new RepleDTO();
		reple.setNum(Integer.parseInt(request.getParameter("articlenum")));
		reple.setRepleNum(Integer.parseInt(request.getParameter("replenum")));
		reple.setRe_step(Integer.parseInt(request.getParameter("re_step")));
		reple.setRe_level(Integer.parseInt(request.getParameter("re_level")));
		reple.setRe_num(Integer.parseInt(request.getParameter("re_num")));
		reple.setRepleContent(request.getParameter("replecontent"));
		reple.setRegdate(new Timestamp(System.currentTimeMillis()));
		reple.setUserid(request.getParameter("userid"));
		RepleDAO dao = new RepleDAO();
		dao.insertReple(reple);
		request.setAttribute("articlenum", request.getParameter("articlenum"));
		request.setAttribute("pagenum", request.getParameter("pagenum"));
		return "/repleWritePro.jsp";
	}
}
