<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>LALA | Manage System</title>
<%@include file="/common/common.jsp"%>   
<script>
function addAccount(){

	var loginName = $.trim($("#loginName").val());
	if(loginName == ""){
		alert("请填写登录账号！");
		$("#loginName").focus();
		return;
	}
	var password = $.trim($("#password").val());
	if(password == ""){
		alert("请填写密码！");
		$("#password").focus();
		return;
	}
	var password2 = $.trim($("#password2").val());
	if(password2 == ""){
		alert("请填写密码确认！");
		$("#password2").focus();
		return;
	}
	if (password2 != password){
		alert("密码确认不正确！");
		$("#password2").focus();
		return;
	}
	var username = $.trim($("#username").val());
	if(username == ""){
		alert("请填写用户名称！");
		$("#username").focus();
		return;
	}
	var deptId = $.trim($("#deptId").val());
	if(deptId == "0"){
		alert("请选择部门！");
		$("#deptId").focus();
		return;
	}
	inputForm.submit();
}
</script>
</head>

<body style="background-image: none;">
<div id="main-content" style="width: 100%;height: 100%;margin-left: 0px;">
	<div class="content-box">
		<!-- Start Content Box -->
		<div class="content-box-header">
			<h3>
				用户信息
			</h3>
		</div>
		<!-- End .content-box-header -->

		<div class="content-box-content">
			<!-- This is the target div. id must match the href of this div's tab -->
			<div class="notification attention png_bg">
				<a href="#" class="close"><img
						src="${ctx}/images/icons/cross_grey_small.png"
						title="Close this notification" alt="close" />
				</a>
				<div>
					你可以编辑以下用户信息
				</div>
				<c:if test="${error ne null}">
				<div>
					<b>${error}</b>
				</div>
				</c:if>
			</div>
			<form id="inputForm" method="post" action="${ctx}/account/save">
				<input type="hidden" name="acc.id" value="${account.id}" id="id"/>
				<fieldset>
					<p>
						<label>
							登录账号
						</label>
						<input class="text-input small-input" type="text" id="loginName" name="acc.loginName" value="${account.loginName}"/> 
					</p>
					<p>
						<label>
							密码
						</label>
						<input class="text-input small-input" type="text" id="password" name="acc.password" value="${account.password}"/> 
					</p>
					<p>
						<label>
							密码确认
						</label>
						<input class="text-input small-input" type="text" id="password2" name="password2" value="${account.password}"/> 
					</p>
					<p>
						<label>
							用户名称
						</label>
						<input class="text-input small-input" type="text" id="username" name="acc.username" value="${account.username}"/> 
					</p>

					<p>
						<label>
							电话号码
						</label>
						<input class="text-input small-input" type="text" id="phoneNo" name="acc.phoneNo" value="${account.phoneNo}"/> 
					</p>
					<p>
						<label>
							电子邮件
						</label>
						<input class="text-input small-input" type="text" id="email" name="acc.email" value="${account.email}"/> 
					</p>
					<p>
						<label>
							所属部门
						</label>
						<select name="acc.deptId" id="deptId">
							<option value="0">---请选择---</option>
							<c:forEach var="dept" items="${depts}">
								<option value="${dept.id}"
							<c:if test="${dept.id eq account.deptId}">
								selected
							</c:if>
								
								>${dept.sname}</option>
							
							</c:forEach>
						</select>
					</p>

					<p>
						<a class="button" href="#" onclick="addAccount();">保存</a>
						<a class="button" href="${ctx}/account">返回</a>
					</p>
				</fieldset>
				<div class="clear"></div>
			</form>
		</div>
		<!-- End .content-box-content -->
	</div>
	<!-- End .content-box -->
</div>
<!-- End #main-content -->

</body>