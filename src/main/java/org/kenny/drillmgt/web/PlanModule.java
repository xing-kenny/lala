package org.kenny.drillmgt.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.kenny.drillmgt.domain.Plan;
import org.kenny.drillmgt.domain.Project;
import org.kenny.drillmgt.util.SystemContext;
import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.dao.DaoException;
import org.nutz.dao.Sqls;
import org.nutz.dao.sql.Sql;
import org.nutz.ioc.annotation.InjectName;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Fail;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;
import org.nutz.trans.Atom;
import org.nutz.trans.Trans;

@IocBean
@InjectName
@At("/plan")
public class PlanModule extends BaseModule {

	@Inject
	protected Dao dao;

	@At("/listProject")
	@Ok("jsp:views.planProjects")
	public void listProject(HttpServletRequest req) {

		List<Project> projects = basicDao.search(Project.class,
				Cnd.where("status", "=", SystemContext.PROJECT_STATUS_DOING)
						.desc("id"));
		req.setAttribute("projects", projects);
	}

	@At("/list/?")
	@Ok("jsp:views.plans")
	public void list(int projectId, HttpServletRequest req) {

		List<Plan> plans = basicDao.search(Plan.class,
				Cnd.where("projectId", "=", "" + projectId));
		req.setAttribute("plans", plans);
		req.setAttribute("project", basicDao.find(projectId, Project.class));

	}

	@At("/create")
	@Ok("jsp:views.planForm")
	public void create(@Param("projectId") int projectId, HttpServletRequest req) {
		req.setAttribute("project", basicDao.find(projectId, Project.class));
	}

	@At("/update/?")
	@Ok("jsp:views.planForm")
	public void update(int id, HttpServletRequest req) {
		Plan o = basicDao.find(id, Plan.class);
		req.setAttribute("plan", o);
		req.setAttribute("project",
				basicDao.find(o.getProjectId(), Project.class));
	}

	@At("/save")
	@Ok("jsp:views.plans")
	@Fail("jsp:views.planForm")
	public void save(@Param("::plan.") Plan plan, HttpServletRequest req)
			throws Exception {

		try {
			if (plan.getId() != 0) {
				basicDao.update(plan);
			} else {
				dao.fastInsert(plan);// basicDao.save(plan);
			}

			List<Plan> plans = basicDao.search(Plan.class,
					Cnd.where("projectId", "=", "" + plan.getProjectId()));
			req.setAttribute("plans", plans);
		} catch (DaoException e) {
			req.setAttribute("error", "Duplicated names!");
			req.setAttribute("plan", plan);
			throw new Exception(" ");
		} finally {
			req.setAttribute("project",
					basicDao.find(plan.getProjectId(), Project.class));
		}
	}

	@At("/delete/?/projectId/?")
	@Ok("jsp:views.plans")
	@Fail("jsp:views.plans")
	public void delete(int id, int projectId,
			HttpServletRequest req) {
		try {
			basicDao.delById(id, Plan.class);
		} catch (DaoException e) {
			req.setAttribute("error",
					"failed! maybe there are some lessions exist ");
		} finally {
			req.setAttribute(
					"plans",
					basicDao.search(Plan.class,
							Cnd.where("projectId", "=", "" + projectId)));
			req.setAttribute("project", basicDao.find(projectId, Project.class));
		}
	}

	@At("/pub/?/projectId/?")
	@Ok("jsp:views.plans")
	@Fail("jsp:views.plans")
	public void pub(final int id, int projectId, final HttpServletRequest req)
			throws Exception {
		
		Trans.exec(new Atom(){

			@Override
			public void run() {
				
				Plan o = basicDao.find(id, Plan.class);
				o.setStatus(SystemContext.PLAN_STATUS_DOING);
				basicDao.update(o);

				// if (id > 0) {
				// req.setAttribute("error", "this is a Atom test error!");
				// throw new RuntimeException("this is a Atom test error");
				// }

				Sql sql = Sqls.create("update t_course set status = " + o.getStatus()
						+ " where planId = " + id);
				dao.execute(sql);
			}
		});

		req.setAttribute(
				"plans",
				basicDao.search(Plan.class,
						Cnd.where("projectId", "=", "" + projectId)));
		req.setAttribute("project", basicDao.find(projectId, Project.class));

	}

}
