package org.kenny.drillmgt.domain;

import java.io.Serializable;
import java.util.Date;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.One;
import org.nutz.dao.entity.annotation.Prev;
import org.nutz.dao.entity.annotation.SQL;
import org.nutz.dao.entity.annotation.Table;

@Table("t_rungin")
public class RungIn implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7642537377372277208L;

	@Id
	private int id;

	@Column
	private int courseId;

	@Column
	private Date rungInDay;

	@Column
	private int forenoon;

	@Column
	private int rungInAccountId;

	@Prev(@SQL("select planId from t_course where id = '$courseId'"))
	@Column
	private int planId;

	@Prev(@SQL("select p.projectId from t_course c,t_plan p where c.planid = p.id and c.id = '$courseId'"))
	@Column
	private int projectId;

	@One(target = Account.class, field = "rungInAccountId")
	private Account rungInAccount;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public Date getRungInDay() {
		return rungInDay;
	}

	public void setRungInDay(Date rungInDay) {
		this.rungInDay = rungInDay;
	}

	public int getForenoon() {
		return forenoon;
	}

	public void setForenoon(int forenoon) {
		this.forenoon = forenoon;
	}

	public int getRungInAccountId() {
		return rungInAccountId;
	}

	public void setRungInAccountId(int rungInAccountId) {
		this.rungInAccountId = rungInAccountId;
	}

	public Account getRungInAccount() {
		return rungInAccount;
	}

	public void setRungInAccount(Account rungInAccount) {
		this.rungInAccount = rungInAccount;
	}

	public int getPlanId() {
		return planId;
	}

	public void setPlanId(int planId) {
		this.planId = planId;
	}

	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	@Override
	public String toString() {
		return "RungIn [id=" + id + ", courseId=" + courseId + ", rungInDay="
				+ rungInDay + ", forenoon=" + forenoon + ", rungInAccountId="
				+ rungInAccountId + ", planId=" + planId + ", projectId="
				+ projectId + ", rungInAccount=" + rungInAccount + "]";
	}


}
