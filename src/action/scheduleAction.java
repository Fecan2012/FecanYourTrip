package action;

import java.util.Collections;
import java.util.Hashtable;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bean.ScheduleDAO;

public class scheduleAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String pageNum = request.getParameter("pageNum");
		String mem_id = (String) request.getSession().getAttribute("mem_id");
		ScheduleDAO scDao = new ScheduleDAO();
		int count = scDao.getScheduleCountById(mem_id);
		int grant = scDao.getGrant(mem_id);
		Hashtable<String, Integer> pgList = scDao.pageList(pageNum, count);
		List scheduleList = null;

		if (count > 0) {
			System.out.println(pgList.get("startRow") + "," + pgList.get("endRow"));
			scheduleList = scDao.getSchedulesById(pgList.get("startRow"), pgList.get("endRow"), pgList.get("pageSize"),
					mem_id);
		} else {
			scheduleList = Collections.EMPTY_LIST;
		}

		request.setAttribute("grant", grant);
		request.setAttribute("pgList", pgList);
		request.setAttribute("scheduleList", scheduleList);
		return "/schedule.jsp";
	}
}
