package org.kenny.drillmgt.domain;

import java.io.Serializable;
import java.util.Date;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Next;
import org.nutz.dao.entity.annotation.Prev;
import org.nutz.dao.entity.annotation.Readonly;
import org.nutz.dao.entity.annotation.SQL;
import org.nutz.dao.entity.annotation.Table;
import org.nutz.dao.entity.annotation.View;

@Table("t_Project")
@View("v_project")
public class Project implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3414818853868520836L;

	@Next(@SQL("select max(id) from t_project"))
	@Prev(@SQL("select max(id) + 1 from t_project"))
	@Id(auto = false)
	private int id;
	
	@Column
	private String name;
	
	@Column
	private String description;
	
	@Column
	private Date startDate;
	
	@Column
	private Date endDate;
	
	@Column
	private int status;

	@Column
	private int mandays;

	@Column
	@Readonly
	private float actualMandays = 0.0f;

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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getMandays() {
		return mandays;
	}

	public void setMandays(int mandays) {
		this.mandays = mandays;
	}

	public float getActualMandays() {
		return actualMandays;
	}

	public void setActualMandays(float actualMandays) {
		this.actualMandays = actualMandays;
	}

	@Override
	public String toString() {
		return "Project [id=" + id + ", name=" + name + ", description="
				+ description + ", startDate=" + startDate + ", endDate="
				+ endDate + ", status=" + status + ", mandays=" + mandays
				+ ", actualMandays=" + actualMandays + "]";
	}

	
}
