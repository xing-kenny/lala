package org.kenny.drillmgt.domain;

import java.io.Serializable;
import java.util.List;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Many;
import org.nutz.dao.entity.annotation.One;
import org.nutz.dao.entity.annotation.Table;

@Table("t_plan")
public class Plan implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6537196031309146931L;

	@Id
	private int id;

	@Column
	private String name;

	@Many(target = Course.class, field = "planId")
	private List<Course> lessions;

	@Column
	private int projectId;

	@One(target = Project.class, field = "projectId")
	private Project project;

	@Column
	private int status;

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

	public List<Course> getLessions() {
		return lessions;
	}

	public void setLessions(List<Course> lessions) {
		this.lessions = lessions;
	}

	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}
