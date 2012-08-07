package org.kenny.drillmgt.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.kenny.drillmgt.domain.Account;
import org.kenny.drillmgt.domain.Dept;
import org.kenny.drillmgt.domain.Role;
import org.kenny.drillmgt.util.PageModel;
import org.kenny.drillmgt.util.Util;
import org.nutz.dao.Cnd;
import org.nutz.dao.DaoException;
import org.nutz.ioc.annotation.InjectName;
import org.nutz.ioc.aop.Aop;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Fail;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

@IocBean
@InjectName
@At("/account")
public class AccountModule extends BaseModule {

	private static final Log log = Logs.getLog(AccountModule.class);

	@At("/login")
	@Ok("jsp:views.main")
	@Fail("jsp:views.login")
	@Aop({ "log" })
	@Filters
	public Account doLogin(@Param("loginName") String loginName,
			@Param("password") String password, HttpServletRequest req)
			throws Exception {

		Account a = basicDao.findByCondition(Account.class,
				Cnd.where("loginName", "=", loginName));
		if (null == a) {
			req.setAttribute("error", "loginName error£¡");
			throw new Exception("loginName error£¡");
		}
		if (!a.getPassword().equals(password)) {
			req.setAttribute("error", "password error£¡");
			throw new Exception("password error£¡");
		}

		basicDao.findLink(a, "dept");
		basicDao.findLink(a, "roles");
		List<Role> temp = new ArrayList<Role>();
		if (null != a.getRoles()) {
			for (Role r : a.getRoles()) {
				r = basicDao.findLink(r, "permissions");
				temp.add(r);
			}
			a.setRoles(temp);
		}
		req.getSession().setAttribute("me", a);
		log.debug(a.toString());
		return a;
	}

	@At({ "", "/list" })
	@Ok("jsp:views.accounts")
	public void list(@Param("currentPage") int currentPage,
			HttpServletRequest req) {


		PageModel<Account> pm = Util.getPageModel(Account.class, 0, basicDao);
		req.setAttribute("pm", pm);
	}

	@At("/create")
	@Ok("jsp:views.accountForm")
	public void create(HttpServletRequest req) {

		List<Dept> depts = basicDao.search(Dept.class,
				Cnd.orderBy().asc("sname"));
		req.setAttribute("depts", depts);
	}

	@At("/update/?")
	@Ok("jsp:views.accountForm")
	public void update(int id, HttpServletRequest req) {

		Account a = basicDao.find(id, Account.class);
		List<Dept> depts = basicDao.search(Dept.class,
				Cnd.orderBy().asc("sname"));

		req.setAttribute("account", a);
		req.setAttribute("depts", depts);
	}

	@At("/save")
	@Ok("redirect:/account")
	@Fail("jsp:views.accountForm")
	public void save(@Param("::acc.") Account acc, HttpServletRequest req)
			throws Exception {

		try {
			if (0 == acc.getId()) {
				basicDao.save(acc);
			} else {
				basicDao.update(acc);
			}
		} catch (DaoException e) {
			log.debug(e);
			req.setAttribute("error", "Duplicated names!");
			List<Dept> depts = basicDao.search(Dept.class,
					Cnd.orderBy().asc("sname"));

			req.setAttribute("account", acc);
			req.setAttribute("depts", depts);
			throw new Exception(" ");
		}
	}

	@At("/delete/?")
	@Ok("redirect:/account")
	public void delete(int id) {
		basicDao.delById(id, Account.class);
	}

	@At("/delByIds")
	@Ok("redirect:/account")
	public void delByIds(@Param("ids") String ids) {

		basicDao.deleteByIds(Account.class, ids);
	}

}
