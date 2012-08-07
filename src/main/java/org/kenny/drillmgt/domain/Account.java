package org.kenny.drillmgt.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.ManyMany;
import org.nutz.dao.entity.annotation.One;
import org.nutz.dao.entity.annotation.Table;

@Table("t_account")
public class Account implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -6022585064079133996L;

	@Id
	private int id;

	@Column
	private String loginName;
	/*
	 * 密码
	 */
	@Column
	private String password;
	/*
	 * 用户名
	 */
	@Column
	private String username;

	@Column
	private String phoneNo;
	@Column
	private String email;

	@Column
	private int deptId;

	@One(target = Dept.class, field = "deptId")
	private Dept dept;

	/*
	 * 上次登录时间
	 */
	@Column
	private Date lastLoginTime;
	/*
	 * 本次登录时间
	 */
	@Column
	private Date loginTime;
	/*
	 * 上次登录IP
	 */
	@Column
	private String lastLoginIp;
	/*
	 * 本次登录IP
	 */
	@Column
	private String loginIp;

	/*
	 * 登录次数
	 */
	@Column
	private int logintimes;

	/*
	 * 管理员所拥有的角色信息
	 */
	@ManyMany(target = Role.class, from = "accountId", to = "roleId", relation = "t_account_role")
	private List<Role> roles;

	/*
	 * 管理员状态 ，启用和禁用
	 */
	@Column
	private boolean state;

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Dept getDept() {
		return dept;
	}

	public void setDept(Dept dept) {
		this.dept = dept;
	}

	public Date getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public Date getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}

	public String getLastLoginIp() {
		return lastLoginIp;
	}

	public void setLastLoginIp(String lastLoginIp) {
		this.lastLoginIp = lastLoginIp;
	}

	public String getLoginIp() {
		return loginIp;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}

	public int getLogintimes() {
		return logintimes;
	}

	public void setLogintimes(int logintimes) {
		this.logintimes = logintimes;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public boolean isState() {
		return state;
	}

	public void setState(boolean state) {
		this.state = state;
	}

	public int getDeptId() {
		return deptId;
	}

	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Account [id=" + id + ", loginName=" + loginName + ", password="
				+ password + ", username=" + username + ", phoneNo=" + phoneNo
				+ ", email=" + email + ", deptId=" + deptId + ", dept="
 + dept
				+ ", lastLoginTime=" + lastLoginTime
				+ ", loginTime=" + loginTime + ", lastLoginIp=" + lastLoginIp
				+ ", loginIp=" + loginIp + ", logintimes=" + logintimes
				+ ", roles=" + roles + ", state=" + state + "]";
	}

}
