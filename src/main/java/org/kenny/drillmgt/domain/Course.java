package org.kenny.drillmgt.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Many;
import org.nutz.dao.entity.annotation.Table;

@Table("t_course")
public class Course implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8120760600534682221L;

	@Id
	private int id;

	@Column
	private String name;

	@Column
	private Date startDate;

	@Column
	private Date endDate;

	@Column
	private int numbers;

	@Column
	private int planId;

	@Column
	private int status;

	@Many(target = SignUp.class, field = "signerId")
	private List<SignUp> SignUps;

	private SignUp signUp;

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

	public int getNumbers() {
		return numbers;
	}

	public void setNumbers(int numbers) {
		this.numbers = numbers;
	}

	public int getPlanId() {
		return planId;
	}

	public void setPlanId(int planId) {
		this.planId = planId;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public List<SignUp> getSignUps() {
		return SignUps;
	}

	public void setSignUps(List<SignUp> signUps) {
		SignUps = signUps;
	}

	public SignUp getSignUp() {
		return signUp;
	}

	public void setSignUp(SignUp signUp) {
		this.signUp = signUp;
	}

	
}
