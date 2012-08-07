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
				项目管理
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
			<table>
				<thead>
					<tr>
						<th>
							项目名称
						</th>
						<th>
							项目描述
						</th>
						<th>
							开始时间
						</th>
						<th>
							结束时间
						</th>
						<th>
							计划人天
						</th>
						<th>
							状态
						</th>
						<th>
							操作
						</th>
					</tr>
				</thead>
				<!-- 数据展示 -->
				<tbody id="datalist">
					<c:forEach items="${pm.result}" var="project">
						<tr>
							<td><a href="${ctx}/project/view/${project.id}" >${project.name}</a></td>
							<td>${project.description}</td>
							<td><fmt:formatDate value="${project.startDate}" pattern="yyyy-MM-dd"/></td>
							<td><fmt:formatDate value="${project.endDate}" pattern="yyyy-MM-dd"/></td>
							<td>${project.mandays}</td>
							<td>
								<c:if test="${project.status eq msg.project_status_draft}">
								${msg.project_status_label_draft}
								</c:if>							
								<c:if test="${project.status eq msg.project_status_doing}">
								${msg.project_status_label_doing}
								</c:if>							
								<c:if test="${project.status eq msg.project_status_done}">
								${msg.project_status_label_done}
								</c:if>	
							</td>
							<td>
								<c:if test="${project.status eq msg.project_status_draft}">
			    				<a href="${ctx}/project/update/${project.id}" id="editLink-${project.id}">修改</a> 
			    				<a href="${ctx}/project/delete/${project.id}" >删除</a>
								</c:if>								
								<c:if test="${project.status eq msg.project_status_doing}">
			    				<a href="${ctx}/project/done/${project.id}" >完成</a> 
								</c:if>								
							</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="8">
							<div class="bulk-actions align-left">
								<a class="button" href="${ctx}/project/create">创建项目</a>
							</div>
							<!-- 分页信息 -->
							<div class="pagination"> 
								<c:if test="${pm.result ne null}">
								<script>
									var pg = new showPages('pg');
									pg.pageCount = ${pm.maxPage};
									pg.argName = 'currentPage';
									pg.printHtml();  
								</script>
								</c:if>
							</div>
							<!-- End .pagination -->
							<div class="clear"></div>
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
