<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>LALA | Manage System</title>
<%@include file="/common/common.jsp"%>   
<link rel="stylesheet" href="${ctx}/css/datePicker.css" type="text/css" media="screen" />
<script type="text/javascript" src="${ctx}/script/jquery.datePicker-min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	Date.format = 'yyyy-mm-dd';
	$('#startDate').datePicker({clickInput:true});
	$('#endDate').datePicker({clickInput:true});
});
</script>
<script>
function chk(){
	
	var name = $.trim($("#name").val());
	if(name == ""){
		alert("请填写项目名称！");
		$("#name").focus();
		return false;
	}
	var description = $.trim($("#description").val());
	if(description == ""){
		alert("请填写项目描述！");
		$("#description").focus();
		return false;
	}
	var startDate = $.trim($("#startDate").val());
	if(startDate == ""){
		alert("请填写项目开始时间");
		$("#startDate").focus();
		return false;
	}
	var endDate = $.trim($("#endDate").val());
	if(endDate == ""){
		alert("请填写项目结束时间");
		$("#endDate").focus();
		return false;
	}
	var mandays = $.trim($("#mandays").val());
	if(mandays == ""){
		alert("请填写项目人天");
		$("#mandays").focus();
		return false;
	}
	
	return true;
}


function addProject(){

	if(chk())
	{
		inputForm.status.value = "${msg.project_status_draft}";
		inputForm.submit();
	}
}
function pubProject(){

	if(chk())
	{
		inputForm.status.value = "${msg.project_status_doing}";
		inputForm.submit();
	}
}

</script>
</head>

<body style="background-image: none;">
<div id="main-content" style="width: 100%;height: 100%;margin-left: 0px;">
	<div class="content-box">
		<!-- Start Content Box -->
		<div class="content-box-header">
			<h3>
				项目信息
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
				</div>
				<c:if test="${error ne null}">
				<div>
					<b>${error}</b>
				</div>
				</c:if>
			</div>
			<form id="inputForm" method="post" action="${ctx}/project/save">
				<input type="hidden" name="project.id" value="${project.id}" id="id"/>
				<input type="hidden" name="project.status" value="" id="status"/>
				<fieldset>
					<p>
						<label>
							项目名称
						</label>
						<input class="text-input small-input" type="text" id="name" name="project.name" value="${project.name}"/> 
					</p>
					<p>
						<label>
							项目描述
						</label>
						<input class="text-input small-input" type="text" id="description" name="project.description" value="${project.description}"/> 
					</p>
					<p>
						<label>
							开始时间
						</label>
						<input class="text-input small-input" type="text" id="startDate" name="project.startDate" value='<fmt:formatDate value="${project.startDate}" pattern="yyyy-MM-dd"/>' /> 
					</p>
					<p>
						<label>
							结束时间
						</label>
						<input class="text-input small-input" type="text" id="endDate" name="project.endDate" value='<fmt:formatDate value="${project.endDate}" pattern="yyyy-MM-dd"/>' />
						 
					</p>
					<p>
						<label>
							计划人天
						</label>
						<input class="text-input small-input" type="text" id="mandays" name="project.mandays" value="${project.mandays}"/> 
					</p>
					<c:if test="${project.status ne null}">
						<c:if test="${project.status ne msg.project_status_draft}">
						<p>
							<label>
								执行人天
							</label>
							${project.actualMandays}
						</p>
						</c:if>
					</c:if>
					<p>
						<c:if test="${project.status eq msg.project_status_draft or project.status eq null }">
						<a class="button" href="#" onclick="addProject();">保存</a>
						<a class="button" href="#" onclick="pubProject();">发布</a>
						</c:if>								
						<c:if test="${project.status eq msg.project_status_doing}">
						<a class="button" href="${ctx}/project/done/${project.id}"  >完成</a>
						</c:if>								
					
					
						<a class="button" href="${ctx}/project">返回</a>
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