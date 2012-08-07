package org.kenny.drillmgt.web;

import javax.servlet.http.HttpServletRequest;

import org.kenny.drillmgt.domain.Project;
import org.kenny.drillmgt.util.SystemContext;
import org.kenny.drillmgt.util.Util;
import org.nutz.dao.DaoException;
import org.nutz.dao.FieldFilter;
import org.nutz.ioc.annotation.InjectName;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Fail;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;
import org.nutz.trans.Atom;

@IocBean
@InjectName
@At("/project")
public class ProjectModule extends BaseModule {

	private static final Log log = Logs.getLog(ProjectModule.class);

	@At({ "", "/list" })
	@Ok("jsp:views.projects")
	public void list(@Param("currentPage") int currentPage,
			HttpServletRequest req) {

		req.setAttribute("pm",
				Util.getPageModel(Project.class, currentPage, basicDao));
	}

	@At("/create")
	@Ok("jsp:views.projectForm")
	public void create() {

	}

	@At({ "/update/?", "/view/?" })
	@Ok("jsp:views.projectForm")
	public void view(int id, HttpServletRequest req) {
		Project p = basicDao.find(id, Project.class);
		req.setAttribute("project", p);
	}

	@At("/save")
	@Ok("redirect:/project")
	@Fail("jsp:views.projectForm")
	public void save(@Param("::project.") Project p, HttpServletRequest req)
			throws Exception {

		try {
			if (p.getId() != 0) {
				basicDao.update(p);
			} else {
				basicDao.save(p);
			}
		} catch (DaoException e) {
			log.debug("e.toString() = " + e.toString());
			req.setAttribute("error", "Duplicated names!");
			req.setAttribute("project", p);
			throw new Exception(" ");
		}
	}

	@At("/done/?")
	@Ok("redirect:/project")
	public void done(final int id, HttpServletRequest req) throws Exception {

		FieldFilter.create(Project.class, "^id|status$").run(new Atom() {
			public void run() {
				Project p = basicDao.find(id, Project.class);
				p.setStatus(SystemContext.PROJECT_STATUS_DONE);
				basicDao.update(p);

			}
		});

	}

	@At("/delete/?")
	@Ok("redirect:/project")
	@Fail("jsp:views.projectForm")
	public void delete(int id, HttpServletRequest req) throws Exception {
		try {
			basicDao.delById(id, Project.class);
		} catch (DaoException e) {
			log.debug("e.toString() = " + e.toString());
			req.setAttribute("error",
					"failed! maybe there are some plans exist ");
			req.setAttribute("pm",
					Util.getPageModel(Project.class, 0, basicDao));
			throw new Exception(" ");
		}
	}

}
