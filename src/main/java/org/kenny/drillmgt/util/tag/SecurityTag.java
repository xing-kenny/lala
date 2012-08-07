package org.kenny.drillmgt.util.tag;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.kenny.drillmgt.domain.Account;
import org.kenny.drillmgt.domain.Permission;
import org.kenny.drillmgt.domain.Role;

public class SecurityTag extends TagSupport {

	private static final long serialVersionUID = 4278921641967421270L;

	private int permission;

	@Override
	public int doStartTag() throws JspException {

		HttpSession session = pageContext.getSession();
		Object o = session.getAttribute("me");
		if (o != null) {
			List<Role> roles = ((Account) o).getRoles();
			if (check(roles)) {
				return EVAL_PAGE;
			}
		}
		return SKIP_BODY;
	}

	/*
	 * 检测用户执行权限
	 * 
	 * @param roles
	 * 
	 * @return
	 */
	private boolean check(List<Role> roles) {

		boolean flag = false;

		if (roles != null && roles.size() > 0) {
			for (Role r : roles) {
				if (r.getPermissions() == null)
					continue;
				for (Permission p : r.getPermissions()) {
					if (p.getId() == this.permission) {
						return true;
					}
				}
			}
		}
		return flag;
	}

	public int getPermission() {
		return permission;
	}

	public void setPermission(int permission) {
		this.permission = permission;
	}


}
