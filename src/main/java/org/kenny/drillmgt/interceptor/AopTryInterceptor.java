package org.kenny.drillmgt.interceptor;

import java.lang.reflect.Method;

import org.nutz.aop.interceptor.AbstractMethodInterceptor;

public class AopTryInterceptor extends AbstractMethodInterceptor {


	@Override
	public boolean beforeInvoke(Object obj, Method method, Object... args) {

		System.out.println("AopTryInterceptor的beforeInvoke被调用");
		for (Object o : args) {

			Class<?>[] clzs = o.getClass().getInterfaces();
			for (Class<?> clz : clzs) {
				System.out.println(clz.toString());
			}

		}
		return true;
	}

	@Override
	public Object afterInvoke(Object obj, Object returnObj, Method method,
			Object... args) {
		return super.afterInvoke(obj, returnObj, method, args);
	}

}
