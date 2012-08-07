package org.kenny.drillmgt.util.tag;

import java.util.ArrayList;
import java.util.List;

import org.kenny.drillmgt.domain.Account;
import org.kenny.drillmgt.domain.RungIn;
import org.kenny.drillmgt.util.RungInLabel;

public class RungInBlock {

	private Account account;

	private RungInLabel rungInLabel;

	private List<RungIn> rungIns = new ArrayList<RungIn>();

	public void addRungIn(RungIn r) {
		rungIns.add(r);
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public RungInLabel getRungInLabel() {
		return rungInLabel;
	}

	public void setRungInLabel(RungInLabel rungInLabel) {
		this.rungInLabel = rungInLabel;
	}

	public List<RungIn> getRungIns() {
		return rungIns;
	}

	public void setRungIns(List<RungIn> rungIns) {
		this.rungIns = rungIns;
	}

}
