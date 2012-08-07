<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>LALA | Manage System</title>
<%@include file="/common/common.jsp"%>   
<script type="text/javascript" src="${ctx}/script/page.js"></script>
<script>
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
			if($(this).val()!="on"&&this.name=='deptchk'){
				str += $(this).val()+",";
				arr[i] = $(this).parent().parent();
				i++;
			}
		}
	});
	var dot = str.lastIndexOf(",");
	if(dot==-1){
		alert("请先选择要删除的选项");
		return;
	}
	
	if(!window.confirm("你确定要删除"+i+"条数据吗？删除后不可恢复！")){
		return;
	}

	str = str.substring(0,dot);
	var url=prefix+"/dept/delByIds";
//	$.post(url,{"ids":str,"currentPage":currentPage,"size":i});

	window.location.href = url + "?ids=" + str;
	window.submit();
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
			<table>
				<thead>
					<tr>
						<th>
							部门简称
						</th>
						<th>
							操作
						</th>
					</tr>
				</thead>
				<!-- 数据展示 -->
				<tbody id="datalist">
					<c:forEach items="${pm.result}" var="dept">
						<tr>
							<td>
							<input type="checkbox" name="deptchk" value="${dept.id}"/>
							${dept.sname}</td>
							<td>
			    				<a href="${ctx}/dept/update/${dept.id}" id="editLink-${dept.id}">修改</a> 
			    				<a href="${ctx}/dept/delete/${dept.id}" >删除</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="8">
							<div class="bulk-actions align-left">
								<a class="button" href="javascript:delByIds('${ctx}');">删除选定</a>
								<a class="button" href="${ctx}/dept/create">创建部门</a>
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
