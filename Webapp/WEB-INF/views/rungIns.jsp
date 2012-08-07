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
							姓名
						</th>
						<c:forEach items="${labels}" var="label">
							<th>
								<fmt:formatDate value="${label.rungInDay}" pattern="yyyy-MM-dd"/> | 
								<c:if test="${label.forenoon ne 1}">
									下午
								</c:if>				
								<c:if test="${label.forenoon eq 1}">
									上午
								</c:if>				
							</th>
						</c:forEach>
					</tr>
				</thead>
				<tbody id="datalist">
					<c:forEach items="${blocks}" var="block">
						<tr>
							<td>
							${block.account.username}
							</td>
							<c:forEach items="${block.rungIns}" var="rungIn">
								<td>
									<c:if test="${rungIn.id eq 0}">
										<a  href="${ctx}/rungIn/rungIn/${rungIn.courseId}/rungInDay/<fmt:formatDate value="${rungIn.rungInDay}" pattern="yyyy-MM-dd"/>/forenoon/${rungIn.forenoon}/rungInAccountId/${rungIn.rungInAccountId}" >签到</a>
									</c:if>				
									<c:if test="${rungIn.id ne 0}">
										已签到
									</c:if>				
								</td>
							</c:forEach>
						</tr>					
					</c:forEach>
				</tbody>				
				<tfoot>
					<tr>
						<td colspan="8">
							<div class="bulk-actions align-left">
							<a class="button" href="${ctx}/rungIn/listCourse" >返回</a>
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
