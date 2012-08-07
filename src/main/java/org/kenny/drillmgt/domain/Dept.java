package org.kenny.drillmgt.domain;

import java.io.Serializable;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

@Table("t_dept")
public class Dept implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 357044513005429826L;

	@Id
	private int id;

	@Column
	private String sname;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	@Override
	public String toString() {
		return "Dept [id=" + id + ", sname=" + sname + "]";
	}


}
