package org.kenny.drillmgt.util;

import java.util.List;

import org.kenny.drillmgt.dao.BasicDao;

public class Util {

	// public static int maxPageSize(int count, int pageSize) {
	// if (pageSize > 0) {
	// if ((count % pageSize) != 0) {
	// return (count / pageSize) + 1;
	// } else {
	// return (count / pageSize);
	// }
	// }
	// return 0;
	// }

	public static <T> PageModel<T> getPageModel(Class<T> c, int currentPage,
			BasicDao basicDao) {
		if (currentPage == 0) {
			currentPage = 1;
		}

		List<T> t = basicDao.searchByPage(c, currentPage,
				SystemContext.PAGE_SIZE, "id");
		int count = basicDao.searchCount(c);
		int maxPage = basicDao.maxPageSize(count, SystemContext.PAGE_SIZE);
		PageModel<T> pm = new PageModel<T>(t, maxPage);
		return pm;
	}

}
