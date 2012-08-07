package org.kenny.drillmgt.web;

import org.kenny.drillmgt.dao.BasicDao;
import org.nutz.ioc.loader.annotation.Inject;

public class BaseModule {

	@Inject
	protected BasicDao basicDao;

	public void setBasicDao(BasicDao basicDao) {
		this.basicDao = basicDao;
	}

}
