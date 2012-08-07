package org.kenny.drillmgt;

import javax.servlet.http.HttpServletRequest;

import org.kenny.drillmgt.web.AccountModule;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.By;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.IocBy;
import org.nutz.mvc.annotation.Localization;
import org.nutz.mvc.annotation.Modules;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.filter.CheckSession;
import org.nutz.mvc.ioc.provider.ComboIocProvider;

@Modules(value = { AccountModule.class }, scanPackage = true)
@IocBy(type = ComboIocProvider.class, args = {
		"*org.nutz.ioc.loader.json.JsonLoader", "ioc.js",
		"*org.nutz.ioc.loader.annotation.AnnotationIocLoader",
		"org.kenny.drillmgt" })
@Localization("msg")
@Filters(@By(type = CheckSession.class, args = { "me", "/" }))
public class MainModule {

	@At({ "/", "/logout" })
	@Ok("jsp:views.login")
	@Filters
	public String doIdx(HttpServletRequest req) {

		req.getSession().removeAttribute("me");
		return "Hello Every One!";

	}

}
