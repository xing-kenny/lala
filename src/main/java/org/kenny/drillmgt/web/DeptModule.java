package org.kenny.drillmgt.web;

import javax.servlet.http.HttpServletRequest;

import org.kenny.drillmgt.domain.Dept;
import org.kenny.drillmgt.util.PageModel;
import org.kenny.drillmgt.util.Util;
import org.nutz.dao.DaoException;
import org.nutz.ioc.annotation.InjectName;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Fail;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

@IocBean
@InjectName
@At("/dept")
public class DeptModule extends BaseModule {

	private static final Log log = Logs.getLog(DeptModule.class);

	@At({ "", "/list" })
	@Ok("jsp:views.depts")
	public void list(@Param("currentPage") int currentPage,
			HttpServletRequest req) {

		if (currentPage == 0) {
			currentPage = 1;
		}

		// PageModel<Dept> pm = getPageModel(currentPage);
		PageModel<Dept> pm = Util.getPageModel(Dept.class, currentPage,
				basicDao);
		req.setAttribute("pm", pm);
	}

	// public <T> PageModel<T> searchByPage(Class<T> c, int currentPage) {
	//
	// List<T> t = basicDao.searchByPage(c, currentPage,
	// SystemContext.PAGE_SIZE, "id");
	// int count = basicDao.searchCount(c);
	// int maxPage = basicDao.maxPageSize(count, SystemContext.PAGE_SIZE);
	// PageModel<T> pm = new PageModel<T>(t, maxPage);
	// return pm;
	// }
	//
	//
	// private PageModel<Dept> getPageModel(int currentPage) {
	// List<Dept> t = basicDao.searchByPage(Dept.class, currentPage,
	// SystemContext.PAGE_SIZE, "id");
	// int count = basicDao.searchCount(Dept.class);
	// int maxPage = basicDao.maxPageSize(count, SystemContext.PAGE_SIZE);
	// PageModel<Dept> pm = new PageModel<Dept>(t, maxPage);
	// return pm;
	// }

	@At("/create")
	@Ok("jsp:views.deptForm")
	public void create() {

	}

	@At("/update/?")
	@Ok("jsp:views.deptForm")
	public void update(int id, HttpServletRequest req) {
		Dept d = basicDao.find(id, Dept.class);
		req.setAttribute("dept", d);
	}

	@At("/save")
	@Ok("redirect:/dept")
	@Fail("jsp:views.deptForm")
	public void save(@Param("::dept.") Dept d,
			HttpServletRequest req) throws Exception {

		try {
			if (d.getId() != 0) {
				basicDao.update(d);
			} else {
				basicDao.save(d);
			}
		} catch (DaoException e) {
			log.debug("e.toString() = " + e.toString());
			req.setAttribute("error", "Duplicated names!");
			req.setAttribute("dept", d);
			throw new Exception(" ");
		}

	}

	@At("/delete/?")
	@Ok("redirect:/dept")
	@Fail("jsp:views.depts")
	public void delete(int id, HttpServletRequest req) throws Exception {
		try {
			basicDao.delById(id, Dept.class);
		} catch (DaoException e) {
			log.debug("e.toString() = " + e.toString());
			req.setAttribute("error",
					"failed! maybe there are some accounts exist ");
			PageModel<Dept> pm = Util.getPageModel(Dept.class, 0, basicDao);
			req.setAttribute("pm", pm);
			throw new Exception(" ");
		}
	}

	@At("/delByIds")
	@Ok("redirect:/dept")
	@Fail("jsp:views.depts")
	public void delByIds(@Param("ids") String ids, HttpServletRequest req)
			throws Exception {

		try {
			for (String id : ids.split(",")) {
				basicDao.delById(Integer.valueOf(id), Dept.class);
			}
		} catch (DaoException e) {
			log.debug("e.toString() = " + e.toString());
			req.setAttribute("error",
					"failed! maybe there are some accounts exist ");
			PageModel<Dept> pm = Util.getPageModel(Dept.class, 0, basicDao);
			;
			req.setAttribute("pm", pm);
			throw new Exception(" ");
		}
	}
}
