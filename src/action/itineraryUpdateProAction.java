package action;

import java.util.Hashtable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bean.ItineraryDAO;
import bean.ItineraryDTO;
import bean.PostDAO;
import bean.PostDTO;
import bean.ScheduleDAO;
import bean.ScheduleDTO;

public class itineraryUpdateProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		Hashtable<Integer, ItineraryDTO> itineraryHash = new Hashtable<Integer, ItineraryDTO>();
		int chk = 0;
		int check = 0;
		ItineraryDTO itinerary = new ItineraryDTO();
		ItineraryDAO dao = new ItineraryDAO();
		Hashtable<Integer, String> dayIti = new Hashtable<Integer, String>();
		int sid = Integer.parseInt(request.getParameter("sid"));
		ScheduleDAO dbPro = new ScheduleDAO();
		ScheduleDTO schedule = dbPro.getScheduleBySid(sid);
		PostDAO poDao = new PostDAO();
		PostDTO poDto = poDao.getPost(schedule.getImgpath());
		String pageNum = request.getParameter("pageNum");
		int dayLen = Integer.parseInt(request.getParameter("daylen"));
		String dayList = request.getParameter("daylist");
		String[] dayNum = dayList.split(",");
		System.out.println(dayList);
		for (String s : dayNum) {
			String[] keyIti = s.split("/");
			if (keyIti.length == 2) {
				dayIti.put(Integer.parseInt(keyIti[0]), keyIti[1]);
			}
		}
		for (int i = 1; i <= dayLen; i++) {
			boolean dayExist = dayIti.containsKey(i);
			boolean itEx = dao.getItinerayCountByDay(sid, i);
			if (dayExist) {
				String places = dayIti.get(i);
				if (itEx) {
					itinerary = dao.getItinerary(sid, i);
					itinerary.setPlace(places);
					int updateNum = dao.updateItineray(itinerary);
					chk++;
				} else {
					itinerary.setDaynum(i);
					itinerary.setPlace(places);
					itinerary.setSid(sid);
					dao.insertItineray(itinerary);
					chk++;
				}
			} else {
				if (itEx) {
					int deleteNum = dao.deleteItineray(sid, i);
					chk++;
				}
			}
		}
		int itNum = dao.getItinerayCount(sid);
		if (itNum > 0) {
			itineraryHash = dao.getItineraies(sid);
		}
		if (chk == 0) {
			check = 1;
		}
		request.setAttribute("check", check);
		request.setAttribute("sid", new Integer(sid));
		request.setAttribute("pageNum", new Integer(pageNum));
		request.setAttribute("schedule", schedule);
		request.setAttribute("post", poDto);
		request.setAttribute("itHash", itineraryHash);
		return "/itineraryUpdatePro.jsp";
	}
}