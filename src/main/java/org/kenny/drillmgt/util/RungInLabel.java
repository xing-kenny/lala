package org.kenny.drillmgt.util;

import java.util.Date;

public class RungInLabel {

	private Date rungInDay;

	private int forenoon;

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

	@Override
	public String toString() {
		return "RungInLabel [rungInDay=" + rungInDay + ", forenoon=" + forenoon
				+ "]";
	}

}
