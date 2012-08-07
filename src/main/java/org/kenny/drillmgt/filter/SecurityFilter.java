package org.kenny.drillmgt.filter;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.nutz.lang.Strings;
import org.nutz.mvc.Mvcs;
import org.nutz.mvc.RequestPath;

public class SecurityFilter implements Filter {

	private static final String IGNORE = "^.+\\.(jsp|png|gif|jpg|js|css|jspx|jpeg|swf|ico)$";

	private Pattern ignorePtn;

	private String selfName;

	private String[] ignoreUrls = { "/", "/account/login"
	};

	public void init(FilterConfig conf) throws ServletException {
		Mvcs.setServletContext(conf.getServletContext());
		this.selfName = conf.getFilterName();
		String regx = Strings.sNull(conf.getInitParameter("ignore"), IGNORE);
		if (!"null".equalsIgnoreCase(regx)) {
			ignorePtn = Pattern.compile(regx, Pattern.CASE_INSENSITIVE);
		}
		System.out.println("ignorePtn = " + ignorePtn);
	}

	private boolean isNotPassedUrl(String url) {
		boolean b = true;
		for (String ig : ignoreUrls) {
			if (ig.equals(url)) {
				b = false;
				break;
			}
		}
		return b;
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {

		RequestPath path = Mvcs.getRequestPathObject((HttpServletRequest) req);

		if (null == ignorePtn || !ignorePtn.matcher(path.getUrl()).find()) {
			if (isNotPassedUrl(path.getUrl())) {
				HttpSession session = ((HttpServletRequest) req).getSession();
				if (session.getAttribute("me") == null) {
					System.out.println("[SecurityFilter] return from "
							+ path.toString());
					return;
				}
			}
		}
		chain.doFilter(req, resp);
	}


	@Override
	public void destroy() {
		Mvcs.resetALL();
		Mvcs.set(selfName, null, null);
		Mvcs.setServletContext(null);
	}

}
