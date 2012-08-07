<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>LALA | Manage System</title>
<%@include file="/common/common.jsp"%>   
<script>
	function load(url){
		$("#main-content").html("");
		var iframe = document.createElement("iframe");
		iframe.src = url;
		iframe.setAttribute('frameborder', '0', 0);
		iframe.setAttribute('scrolling', 'no', 0);
		$("#main-content").html(iframe);
	}
	function addDept(){
		var sname = $.trim($("#sname").val());
		if(sname == ""){
			alert("部门简称不能为空！");
			$("#sname").focus();
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
				部门信息
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
					你可以编辑以下部门信息
				</div>
				<c:if test="${error ne null}">
				<div>
					<b>${error}</b>
				</div>
				</c:if>
			</div>
			<form id="inputForm" method="post" action="${ctx}/dept/save">
				<input type="hidden" name="dept.id" value="${dept.id}" id="id"/>
				<div id="messageBox" class="alert alert-error" style="display:none">输入有误，请先更正。</div>
				<fieldset>
					<p>
						<label>
							部门简称
						</label>
						<input class="text-input small-input" type="text" id="sname" name="dept.sname" value="${dept.sname}"/> 
					</p>
					<p>
						<a class="button" href="#" onclick="addDept();">保存</a>
						<a class="button" href="${ctx}/dept">返回</a>
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