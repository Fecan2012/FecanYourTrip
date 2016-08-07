package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.ScheduleDAO;
import bean.ScheduleDTO;

public class scheduleDeleteProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		ScheduleDAO dao = new ScheduleDAO();
		ScheduleDTO dto = new ScheduleDTO();
		String pageNum = request.getParameter("pageNum");
		String userid = request.getParameter("userid");
		int sid = Integer.parseInt(request.getParameter("sid"));
		int check = -1;

		System.out.println("pageNum=" + pageNum);
		System.out.println("userid=" + userid);
		System.out.println("sid=" + sid);

		int grant = dao.getGrant(userid);
		dto = dao.getSchedule(userid);
		if (userid.equals(dto.getUserid())) {
			check = dao.deleteSchedule(userid, sid);
		} else {
			check = 0;
		}
		request.setAttribute("pageNum", new Integer(pageNum));
		request.setAttribute("check", check);
		return "/scheduleDeletePro.jsp";
	}
}
