<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>LALA | Manage System</title>
<%@include file="/common/common.jsp"%>
<script type="text/javascript" src="${ctx}/script/page.js"></script>
<script type="text/javascript">
		
/*
 * 根据id删除数据
 * @param {Object} id
 */
function delById(prefix,id){
	
	if(!window.confirm("你确定要删除这条数据吗？删除过后不可恢复")){
		return ;
	}

	var url=prefix+"/account/delete/" + id;
	window.location.href = url ;
	window.submit();
	
	
}
/*
 * 根据多个id删除数据
 * @param {Object} prefix
 */
function delByIds(prefix){
	
	var args = location.search;   
    var reg = new RegExp('[\?&]?currentPage=([^&]*)[&$]?', 'gi');   
    var chk = args.match(reg);   
   	var currentPage = RegExp.$1; 
   	
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
	
	if(!window.confirm("你确定要删除"+i+"条数据吗？删除后不可恢复！")){
		return;
	}
	
	var dot = str.lastIndexOf(",");
	if(dot==-1){
		alert("请先选择要删除的选项");
		return;
	}else{
		str = str.substring(0,dot);
	}
	
	var url=prefix+"/account/delByIds";
	window.location.href = url + "?ids=" + str;
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
				用户信息
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
					你可以编辑以下用户信息
				</div>
			</div>

			<table>
				<thead>
					<tr>
						<th>
							<input class="check-all" type="checkbox" />
						</th>
						<th>
							登录账号
						</th>
						<th>
							密码
						</th>
						<th>
							用户名
						</th>
						<th>
							登录时间
						</th>
						<th>
							登录次数
						</th>
						<th>
							状态
						</th>
						<th>
							操作
						</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<td colspan="8">
							<div class="bulk-actions align-left">
								<a class="button" href="javascript:delByIds('${ctx}');">删除选定</a>
								<a class="button" href="${ctx}/account/create">创建用户</a>
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
				
				<!-- 数据展示 -->
				<tbody id="datalist">
				<c:forEach var="user" items="${pm.result}" varStatus="status">
					<tr id="r${user.loginName}">
						<td><input type="checkbox" value="${user.id}"/></td>
						<td>${user.loginName}</td>
						<td>${user.password}</td>
						<td>${user.username}</td>
						<td>${user.lastLoginTime}</td>
						<td>${user.logintimes}</td>
						<td>${user.state}</td>
						<td>
							<!-- Icons -->
							<a href="${ctx}/account/update/${user.id}" id="editLink-${user.id}"><img src="${ctx}/images/icons/pencil.png" alt="修改用户信息" /></a>
							<a href="javascript:delById('${ctx}',${user.id});" title="删除"><img src="${ctx}/images/icons/cross.png" alt="删除用户" /></a>
		    				<a href="${ctx}/role/set/${user.id}" title="设置角色"><img src="${ctx}/images/icons/hammer_screwdriver.png" alt="设置角色" /></a> 
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- End .content-box-content -->
	</div>
	<!-- End .content-box -->
</div>
<!-- End #main-content -->
</body>
</html>
