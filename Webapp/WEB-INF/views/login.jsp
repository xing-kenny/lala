<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="ctx2" value="${base}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>LALA | Sign In</title>
<link rel="stylesheet" href="${ctx2}/css/style.css" type="text/css" media="screen" />
</head>


<body id="login">
	<div id="login-wrapper" >
		<div id="login-top">
			<!-- Logo (221px width) -->
			<img id="logo" src="${ctx}/images/logo.png" alt="Simpla Admin logo" />
		</div>
		<!-- End #logn-top -->
		<div id="login-content">
			<form action="${ctx}/account/login" method="post">
				<div class="notification information">
					<div>
						<c:choose>
							<c:when test="${error eq null}">
								${msg.login_type_tip}
							</c:when>
							<c:otherwise>
								${error}
							</c:otherwise>
						</c:choose>	
					</div>
				</div>
				<p>
				<label>${msg.login_name}</label>
				<input class="text-input" type="text" name="loginName"/>
				</p>
				<div class="clear"></div>
				<p>
					<label>${msg.login_password}</label>
					<input class="text-input" type="password" name="password"/>
				</p>
				<div class="clear"></div>
				<p id="remember-password">
					<input type="checkbox" />
					记住我
				</p>
				<div class="clear"></div>
				<p>
					<input class="button" type="submit" value="${msg.login_submit}" />
				</p>
			</form>
		</div>
		<!-- End #login-content -->
	</div>
	<!-- End #login-wrapper -->
</body>
</html>
