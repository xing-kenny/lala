package org.kenny.drillmgt.web;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.kenny.drillmgt.domain.Account;
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
@At("/signup")
public class SignUpModule extends BaseModule {

	@At("/listCourse")
	@Ok("jsp:views.signUpCourses")
	public void listCourses(HttpServletRequest req) {

		Account acc = (Account) req.getSession().getAttribute("me");
		
		List<Course> courses = basicDao.search(Course.class,
				Cnd.where("status", "=", SystemContext.PLAN_STATUS_DOING).and(
						"startdate", "<", "sysdate"));
		
		for(Course course : courses )
		{
			SignUp signUp = basicDao.findByCondition(
					SignUp.class,
					Cnd.where("courseId", "=", course.getId()).and("signerId",
							"=", acc.getId()));
			if (signUp != null)
				course.setSignUp(signUp);
		}
		
		req.setAttribute("courses", courses);

	}

	@At("/signup/?")
	@Ok("redirect:/signup/listCourse")
	public void signup(int courseId, HttpServletRequest req) {

		Account acc = (Account) req.getSession().getAttribute("me");

		SignUp signUp = new SignUp();
		signUp.setCourseId(courseId);
		signUp.setSignUpDay(new Date());
		signUp.setSignerId(acc.getId());
		basicDao.save(signUp);
	}

	@At("/cancel/?")
	@Ok("redirect:/signup/listCourse")
	public void cancel(int id, HttpServletRequest req) {

		basicDao.delById(id, SignUp.class);

	}

}
