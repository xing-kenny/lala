package org.kenny.drillmgt.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.kenny.drillmgt.domain.Account;
import org.kenny.drillmgt.domain.Role;
import org.nutz.dao.Cnd;
import org.nutz.ioc.annotation.InjectName;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

@IocBean
@InjectName
@At("/role")
public class RoleModule extends BaseModule {

	private static final Log log = Logs.getLog(RoleModule.class);

	@At("/set/?")
	@Ok("jsp:views.roleSet")
	public void set(int accountId, HttpServletRequest req) {

		List<Role> roles = basicDao.search(Role.class, Cnd.orderBy().asc("id"));
		Account a = basicDao.find(accountId, Account.class);
		basicDao.findLink(a, "roles");

		req.setAttribute("acc", a);
		req.setAttribute("roles", roles);
	}

	@At("/saveSet")
	@Ok("jsp:views.roleSet")
	public void saveSet(@Param("accountId") int accountId,
			@Param("roleIds") String roleIds, HttpServletRequest req) {

		log.debug("accountId = " + accountId);
		log.debug("roleIds = " + roleIds);

		// -------------ok-----------
		// basicDao.delete( "t_account_role",
		// Cnd.where("accountId", "=", accountId));
		//
		// if (roleIds.length() > 0)
		// for (String roleId : roleIds.split(",")) {
		// basicDao.save("t_account_role",
		// Chain.make("accountId", accountId)
		// .add("roleId", roleId));
		// }
		// ------------------------
		
		// --------------ok----------
		basicDao.delete("t_account_role",
				Cnd.where("accountId", "=", accountId));

		Account a = basicDao.find(accountId, Account.class);
		List<Role> roles = new ArrayList<Role>();
		if (roleIds.length() > 0)
			for (String id : roleIds.split(",")) {
				roles.add(basicDao.find(Integer.parseInt(id), Role.class));
			}
		a.setRoles(roles);
		basicDao.saveRelation(a, "roles");
		// ------------------------

		req.setAttribute("acc", a);
		req.setAttribute("roles",
				basicDao.search(Role.class, Cnd.orderBy().asc("id")));


	}
}
