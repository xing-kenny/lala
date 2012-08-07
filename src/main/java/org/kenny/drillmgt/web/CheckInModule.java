package org.kenny.drillmgt.web;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.kenny.drillmgt.domain.CheckIn;
import org.kenny.drillmgt.domain.Course;
import org.kenny.drillmgt.domain.SignUp;
import org.kenny.drillmgt.util.SystemContext;
import org.nutz.dao.Cnd;
import org.nutz.ioc.annotation.InjectName;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;

@IocBean
@InjectName
@At("/checkIn")
public class CheckInModule extends BaseModule {

	@At("/listCourse")
	@Ok("jsp:views.checkInCourses")
	public void listCourses(HttpServletRequest req) {

		List<Course> courses = basicDao.search(Course.class,
				Cnd.where("status", "=", SystemContext.PLAN_STATUS_DOING));
		req.setAttribute("courses", courses);
	}

	@At("/listSignUp/?")
	@Ok("jsp:views.checkInSignUps")
	public void list(int courseId, HttpServletRequest req) {

		List<SignUp> signUps = basicDao.search(SignUp.class,
				Cnd.where("courseId", "=", courseId));
		for (SignUp s : signUps) {
			basicDao.findLink(s, "signer");
			CheckIn checkIn = basicDao.find(s.getCheckInId(), CheckIn.class);
			if (null != checkIn) {
				s.setCheckIn(checkIn);
			}
		}
		req.setAttribute("signUps", signUps);
	}

	@At("/checkIn/?/courseId/?")
	@Ok("redirect:/checkIn/listSignUp/${obj}")
	public int checkIn(int signUpId, int courseId, HttpServletRequest req) {

		SignUp signUp = basicDao.find(signUpId, SignUp.class);

		CheckIn checkIn = new CheckIn();
		checkIn.setCourseId(courseId);
		checkIn.setCheckInAccountId(signUp.getSignerId());
		checkIn.setCheckInDay(new Date());

		signUp.setCheckInId(basicDao.save(checkIn).getId());
		basicDao.update(signUp);
		return courseId;

	}
}
