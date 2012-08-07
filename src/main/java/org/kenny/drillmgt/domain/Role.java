package org.kenny.drillmgt.domain;

import java.io.Serializable;
import java.util.List;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.ManyMany;
import org.nutz.dao.entity.annotation.Table;

@Table("t_role")
public class Role implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7691885430810576284L;

	@Id
	private int id;

	@Column
	private String name;

	@ManyMany(target = Permission.class, from = "roleId", to = "permissionId", relation = "t_role_permission")
	private List<Permission> permissions;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Permission> getPermissions() {
		return permissions;
	}

	public void setPermissions(List<Permission> permissions) {
		this.permissions = permissions;
	}

}
