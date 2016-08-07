package action;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.concurrent.TimeUnit;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bean.ScheduleDAO;
import bean.ScheduleDTO;

public class scheduleInsertProAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		ScheduleDTO schedule = new ScheduleDTO();
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		Timestamp tsp = new Timestamp(System.currentTimeMillis());
		int check = -1;
		String dps = request.getParameter("datePickerStart");
		String dpe = request.getParameter("datePickerEnd");
		Date startDate = new Date(sdf.parse(dps).getTime());
		Date endDate = new Date(sdf.parse(dpe).getTime());
		schedule.setTitle(request.getParameter("inputName"));
		schedule.setImgpath(request.getParameter("imgpath"));
		schedule.setStartdate(startDate);
		schedule.setEnddate(endDate);
		schedule.setUserid(request.getParameter("userid"));
		schedule.setRegdate(tsp);
		schedule.setDays((int) getDifferenceDays(startDate, endDate) + 1);
		schedule.setDescrip(request.getParameter("inputDesc"));
		ScheduleDAO dbPro = new ScheduleDAO();
		int grant = dbPro.getGrant(request.getParameter("userid"));
		if (grant == 2) {
			check = dbPro.insertSchedule(schedule);
		} else {
			check = 0;
		}
		request.setAttribute("check", check);
		return "/scheduleInsertPro.jsp";
	}

	private long getDifferenceDays(Date d1, Date d2) {
		long diff = d2.getTime() - d1.getTime();
		return TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
	}
}