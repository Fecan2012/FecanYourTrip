package action;

import java.util.Hashtable;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.ItineraryDAO;
import bean.ItineraryDTO;
import bean.PostDAO;
import bean.PostDTO;
import bean.ScheduleDAO;
import bean.ScheduleDTO;

public class scheduleContentAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Hashtable<Integer, ItineraryDTO> itineraryHash = new Hashtable<Integer, ItineraryDTO>();
		int sid = Integer.parseInt(request.getParameter("sid"));
		String pageNum = request.getParameter("pageNum");
		String userid = (String) request.getSession().getAttribute("mem_id");
		ItineraryDAO itDao = new ItineraryDAO();
		int itNum = itDao.getItinerayCount(sid);
		if (itNum > 0) {
			itineraryHash = itDao.getItineraies(sid);
		}
		ScheduleDAO dbPro = new ScheduleDAO();
		ScheduleDTO schedule = dbPro.getScheduleBySid(sid);
		PostDAO poDao = new PostDAO();
		PostDTO poDto = poDao.getPost(schedule.getImgpath());
		request.setAttribute("sid", new Integer(sid));
		request.setAttribute("pageNum", new Integer(pageNum));
		request.setAttribute("schedule", schedule);
		request.setAttribute("post", poDto);
		int grant = dbPro.getGrant(userid);
		request.setAttribute("itHash", itineraryHash);
		request.setAttribute("grant", grant);
		return "/scheduleContent.jsp";
	}
}