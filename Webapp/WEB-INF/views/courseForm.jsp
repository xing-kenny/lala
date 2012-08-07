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
		alert("请填写课程名称！");
		$("#name").focus();
		return false;
	}
	var startDate = $.trim($("#startDate").val());
	if(startDate == ""){
		alert("请填写开始时间");
		$("#startDate").focus();
		return false;
	}
	var endDate = $.trim($("#endDate").val());
	if(endDate == ""){
		alert("请填写结束时间");
		$("#endDate").focus();
		return false;
	}
	var numbers = $.trim($("#numbers").val());
	if(numbers == ""){
		alert("请填写学员数量");
		$("#numbers").focus();
		return false;
	}
	
	return true;
}


function addCourse(){

	if(chk())
	{
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
				课程信息
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
			<form id="inputForm" method="post" action="${ctx}/course/save">
				<input type="hidden" name="course.planId" value="${plan.id}" id="planid"/>
				<input type="hidden" name="course.id" value="${course.id}" id="id"/>
				<fieldset>
					<p>
						<label>
							计划名称
						</label>
						${plan.name}
					</p>
					<p>
						<label>
							课程名称
						</label>
						<input class="text-input small-input" type="text" id="name" name="course.name" value="${course.name}"/> 
					</p>
					<p>
						<label>
							开始时间
						</label>
						<input class="text-input small-input" type="text" id="startDate" name="course.startDate" value='<fmt:formatDate value="${course.startDate}" pattern="yyyy-MM-dd"/>' /> 
					</p>
					<p>
						<label>
							结束时间
						</label>
						<input class="text-input small-input" type="text" id="endDate" name="course.endDate" value='<fmt:formatDate value="${course.endDate}" pattern="yyyy-MM-dd"/>' />
						 
					</p>
					<p>
						<label>
							学员数量
						</label>
						<input class="text-input small-input" type="text" id="numbers" name="course.numbers" value="${course.numbers}"/> 
					</p>

					<p>
						<a class="button" href="#" onclick="addCourse();">保存</a>
						<a class="button" href="${ctx}/course/list/${plan.id}">返回</a>
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