<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>LALA | Manage System</title>
<%@include file="/common/common.jsp"%>   
<script>
	function addPlan(){
		var name = $.trim($("#name").val());
		if(name == ""){
			alert("计划名称不能为空！");
			$("#name").focus();
			return false;
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
				月计划管理
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
					你可以编辑以下项目信息
					<c:if test="${error ne null}">
						<b>${error}</b>
					</c:if>
				</div>
			</div>
			<form id="inputForm" method="post" action="${ctx}/plan/save">
				<input type="hidden" name="plan.id" value="${plan.id}" id="id"/>
				<input type="hidden" name="plan.projectId" value="${project.id}" id="projectId"/>
				<fieldset>
					<p>
						<label>
							项目名称
						</label>
						${project.name}
					</p>
					<p>
						<label>
							计划名称
						</label>
						<input class="text-input small-input" type="text" id="name" name="plan.name" value="${plan.name}"/> 
					</p>
					<p>
						<a class="button" href="#" onclick="addPlan();">保存</a>
						<a class="button" href="${ctx}/plan/list/${project.id}">返回</a>
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