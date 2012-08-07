<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>LALA | Manage System</title>
<%@include file="/common/common.jsp"%>   
<script type="text/javascript" src="${ctx}/script/page.js"></script>
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
			<table>
				<thead>
					<tr>
						<th>
							计划名称
						</th>
						<th>
							课程名称
						</th>
						<th>
							开始时间
						</th>
						<th>
							结束时间
						</th>
						<th>
							学员数量
						</th>
						<th>
							操作
						</th>
					</tr>
				</thead>
				<!-- 数据展示 -->
				<tbody id="datalist">
					<c:forEach items="${courses}" var="course">
						<tr>
							<td>${plan.name}</td>
							<td>${course.name}</td>
							<td><fmt:formatDate value="${course.startDate}" pattern="yyyy-MM-dd"/></td>
							<td><fmt:formatDate value="${course.endDate}" pattern="yyyy-MM-dd"/></td>
							<td>${course.numbers}</td>
							<td>
								<c:if test="${plan.status eq '0'}">
			    				<a href="${ctx}/course/update/${course.id}" id="editLink-${course.id}">修改</a> 
			    				<a href="${ctx}/course/delete/${course.id}/planId/${plan.id}" >删除</a>
								</c:if>								
							</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="8">
							<div class="bulk-actions align-left">
								<c:if test="${plan.status eq '0'}">
								<a class="button" href="${ctx}/course/create/${plan.id}">创建课程</a>
								</c:if>
								<a class="button" href="${ctx}/plan/list/${plan.projectId}">返回</a>
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
		<!-- End .content-box-content -->
	</div>
	<!-- End .content-box -->
</div>
<!-- End #main-content -->


</body>
