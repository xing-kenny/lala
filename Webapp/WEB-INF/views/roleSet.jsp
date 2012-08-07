<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>LALA | Manage System</title>
<%@include file="/common/common.jsp"%>
<script type="text/javascript">
$(document).ready(function(){
});
</script>
<script type="text/javascript">
		
/*
 * 根据多个id删除数据
 * @param {Object} prefix
 */
function saveSet(prefix,accountId){
	
	var args = location.search;   
	var str="";
	var i=0;
	
	var arr = new Array();
	
	$("input[type='checkbox']").each(function(){
		if($(this).attr("checked")){
			if($(this).val()!="on"){
				str += $(this).val()+",";
				arr[i] = $(this).parent().parent();
				i++;
			}
		}
	});
	
	var dot = str.lastIndexOf(",");
	if(dot==-1){
	}else{
		str = str.substring(0,dot);
	}
	
	var url=prefix+"/role/saveSet";
	window.location.href = url + "?accountId=" + accountId + "&" + "roleIds=" + str;
	window.submit();
}		
</script>
</head>

<body style="background-image: none;">
<!-- Wrapper for the radial gradient background -->
<div id="main-content" style="width: 100%;height: 100%;margin-left: 0px;">
	<div class="content-box">
		<!-- Start Content Box -->
		<div class="content-box-header">
			<h3>
				角色分配
			</h3>
			<div class="clear"></div>
		</div>
		<!-- End .content-box-header -->

		<div class="content-box-content">
			<div class="notification attention png_bg">
				<a href="#" class="close"><img
						src="${ctx}/images/icons/cross_grey_small.png"
						title="Close this notification" alt="close" />
				</a>
				<div>
					你可以分配以下角色
				</div>
			</div>

			<table>
				<thead>
					<tr>
						<th>
							<input class="check-all" type="checkbox" />
						</th>
						<th>
							角色
						</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<td colspan="8">
							<div class="bulk-actions align-left">
								<a class="button" href="javascript:saveSet('${ctx}','${acc.id}');">保存</a>
			    				<a class="button" href="${ctx}/account/list?currentPage=1">返回</a>
							</div>
							<div class="clear"></div>
						</td>
					</tr>
				</tfoot>
				
				<!-- 数据展示 -->
				<tbody id="datalist">
				<c:forEach var="role" items="${roles}" >
					<tr id="${role.id}">
						<td><input type="checkbox" value="${role.id}"
							<c:forEach var="role2" items="${acc.roles}">
								<c:if test="${role.id eq role2.id }">
									checked
								</c:if>
								
							</c:forEach>
							/>
							</td>
						<td>${role.name}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- End .content-box-content -->
	</div>
	<!-- End .content-box -->

	<div id="footer">
	<small> <!-- Remove this notice or replace it with whatever you want -->
	</small>
	</div><!-- End #footer -->

</div>
<!-- End #main-content -->
</body>
</html>
