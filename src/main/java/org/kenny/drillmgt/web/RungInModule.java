package org.kenny.drillmgt.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.kenny.drillmgt.domain.Account;
import org.kenny.drillmgt.domain.CheckIn;
import org.kenny.drillmgt.domain.Course;
import org.kenny.drillmgt.domain.RungIn;
import org.kenny.drillmgt.util.RungInLabel;
import org.kenny.drillmgt.util.SystemContext;
import org.kenny.drillmgt.util.tag.RungInBlock;
import org.nutz.dao.Cnd;
import org.nutz.ioc.annotation.InjectName;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;

@IocBean
@InjectName
@At("/rungIn")
public class RungInModule extends BaseModule {

	private static final Log log = Logs.getLog(RungInModule.class);

	@At("/listCourse")
	@Ok("jsp:views.rungInCourses")
	public void listCourses(HttpServletRequest req) {

		List<Course> courses = basicDao.search(Course.class,
				Cnd.where("status", "=", SystemContext.PLAN_STATUS_DOING));
		req.setAttribute("courses", courses);
	}

	@At("/list/?")
	@Ok("jsp:views.rungIns")
	public void list(int courseId, HttpServletRequest req) {

		Course course = basicDao.find(courseId, Course.class);

		List<RungInLabel> labels = initRungInLabels(course);

		List<CheckIn> checkIns = basicDao.search(CheckIn.class,
				Cnd.where("courseId", "=", courseId).asc("id"));
		List<RungInBlock> blocks = new ArrayList<RungInBlock>();
		for (CheckIn c : checkIns) {
			RungInBlock block = new RungInBlock();
			Account acc = basicDao.find(c.getCheckInAccountId(), Account.class);
			block.setAccount(acc);

			for (RungInLabel label : labels) {
				RungIn rungIn = basicDao.findByCondition(
						RungIn.class,
						Cnd.where("rungInAccountId", "=",
								c.getCheckInAccountId())
								.and("forenoon", "=", label.getForenoon())
								.and("rungInDay", "=", label.getRungInDay())
								.and("courseId", "=", courseId));
				if (null == rungIn) {
					rungIn = new RungIn();
					rungIn.setCourseId(courseId);
					rungIn.setForenoon(label.getForenoon());
					rungIn.setRungInDay(label.getRungInDay());
					rungIn.setRungInAccountId(c.getCheckInAccountId());
					block.addRungIn(rungIn);
				} else {
					block.addRungIn(rungIn);
				}
			}
			blocks.add(block);
		}
		req.setAttribute("course", course);
		req.setAttribute("labels", labels);
		req.setAttribute("blocks", blocks);

	}

	@At("/rungIn/?/rungInDay/?/forenoon/?/rungInAccountId/?")
	@Ok("redirect:/rungIn/list/${obj}")
	public int rungIn(int courseId, Date rungInDay, int forenoon,
			int rungInAccountId, HttpServletRequest req) {

		RungIn rungIn = new RungIn();
		rungIn.setCourseId(courseId);
		rungIn.setForenoon(forenoon);
		rungIn.setRungInDay(rungInDay);
		rungIn.setRungInAccountId(rungInAccountId);

		basicDao.save(rungIn);
		log.debug(rungIn);
		return courseId;
	}

	private List<RungInLabel> initRungInLabels(Course course) {

		List<RungInLabel> labels = new ArrayList<RungInLabel>();

		Calendar cStart = Calendar.getInstance();
		Calendar cEnd = Calendar.getInstance();
		cStart.setTime(course.getStartDate());
		cEnd.setTime(course.getEndDate());
		int loop = 0;
		while (!cStart.after(cEnd) && loop < 10) {
			loop++;
			RungInLabel r = new RungInLabel();
			r.setRungInDay(cStart.getTime());
			r.setForenoon(1);
			labels.add(r);
			r = new RungInLabel();
			r.setRungInDay(cStart.getTime());
			r.setForenoon(0);
			labels.add(r);
			cStart.add(Calendar.DAY_OF_MONTH, 1);
		}

		return labels;
	}

}
