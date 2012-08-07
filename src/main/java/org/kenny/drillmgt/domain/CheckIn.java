package org.kenny.drillmgt.domain;

import java.io.Serializable;
import java.util.Date;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.One;
import org.nutz.dao.entity.annotation.Table;

@Table("t_checkin")
public class CheckIn implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 808371557619096171L;

	@Id
	private int id;

	@Column
	private int courseId;

	@Column
	private int checkInAccountId;

	@Column
	private Date checkInDay;

	@One(target = Account.class, field = "checkInAccountId")
	private Account checkInAccount;

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

	public int getCheckInAccountId() {
		return checkInAccountId;
	}

	public void setCheckInAccountId(int checkInAccountId) {
		this.checkInAccountId = checkInAccountId;
	}

	public Date getCheckInDay() {
		return checkInDay;
	}

	public void setCheckInDay(Date checkInDay) {
		this.checkInDay = checkInDay;
	}

	public Account getCheckInAccount() {
		return checkInAccount;
	}

	public void setCheckInAccount(Account checkInAccount) {
		this.checkInAccount = checkInAccount;
	}

}
