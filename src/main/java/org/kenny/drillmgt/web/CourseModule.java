package org.kenny.drillmgt.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.kenny.drillmgt.domain.Course;
import org.kenny.drillmgt.domain.Plan;
import org.nutz.dao.Cnd;
import org.nutz.dao.DaoException;
import org.nutz.ioc.annotation.InjectName;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Fail;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

@IocBean
@InjectName
@At("/course")
public class CourseModule extends BaseModule {

	@At("/list/?")
	@Ok("jsp:views.courses")
	public void listProject(int planId, HttpServletRequest req) {

		List<Course> courses = basicDao.search(Course.class,
				Cnd.where("planId", "=", planId).desc("id"));
		req.setAttribute("courses", courses);
		req.setAttribute("plan", basicDao.find(planId, Plan.class));
	}

	@At("/create/?")
	@Ok("jsp:views.courseForm")
	public void create(int planId, HttpServletRequest req) {
		req.setAttribute("plan", basicDao.find(planId, Plan.class));
	}

	@At("/update/?")
	@Ok("jsp:views.courseForm")
	public void update(int id, HttpServletRequest req) {

		Course course = basicDao.find(id, Course.class);
		req.setAttribute("course", course);
		req.setAttribute("plan", basicDao.find(course.getPlanId(), Plan.class));
				
	}

	@At("/save")
	@Ok("jsp:views.courses")
	@Fail("jsp:views.courseForm")
	public void save(@Param("::course.") Course course, HttpServletRequest req)
			throws Exception {

		try {
			if (course.getId() != 0) {
				basicDao.update(course);
			} else {
				basicDao.save(course);
			}
			List<Course> courses = basicDao.search(Course.class,
					Cnd.where("planId", "=", course.getPlanId()).desc("id"));
			req.setAttribute("courses", courses);
		} catch (DaoException e) {
			req.setAttribute("error", "Duplicated names!");
			throw new Exception(" ");
		} finally {
			req.setAttribute("course", course);
			req.setAttribute("plan",
					basicDao.find(course.getPlanId(), Plan.class));
		}		
	}

	@At("/delete/?/planId/?")
	@Ok("jsp:views.courses")
	@Fail("jsp:views.courses")
	public void delete(int id, int planId, HttpServletRequest req) {
		try {
			basicDao.delById(id, Course.class);
		} catch (DaoException e) {
			req.setAttribute("error", "failed!  " + e.toString());
		} finally {
			List<Course> courses = basicDao.search(Course.class,
					Cnd.where("planId", "=", planId).desc("id"));
			req.setAttribute("courses", courses);
			req.setAttribute("plan", basicDao.find(planId, Plan.class));
		}
	}
}
