<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>LALA | Manage System</title>
<%@include file="/common/common.jsp"%>   
<script type="text/javascript" src="${ctx}/script/facebox.js"></script>
<script>
	function load(url){
		$("#main-content").html("");
		var iframe = document.createElement("iframe");
		iframe.src = url;
		iframe.setAttribute('frameborder', '0', 0);
		iframe.setAttribute('scrolling', 'no', 0);
		$("#main-content").html(iframe);
	}
</script>

<style type="text/css">
	iframe{
		height:1500px;width:100%;
	}
</style>
</head>


<body>
<div id="body-wrapper"> <!-- Wrapper for the radial gradient background -->
	<div id="sidebar">
		<div id="sidebar-wrapper"> <!-- Sidebar with logo and menu -->
			<!-- Logo (221px wide) -->
			<a href="#"><img id="logo" src="${ctx}/images/logo.png" alt="Simpla Admin logo" /></a>
			  
			<!-- Sidebar Profile links -->
			<div id="profile-links">
				你好, <a href="#" title="编辑你的资料">${obj.username}</a>
				<br />
				<a href="${ctx}/logout" title="注销">注销</a>
			</div>        
				
			<ul id="main-nav">  <!-- Accordion Menu -->
			<li> 
				<a href="#" class="nav-top-item "> 
				签到管理
				</a>
				<ul>
					<li><a href="javascript:load('${ctx}/rungIn/listCourse?currentPage=1');">签到管理</a></li>
				</ul>
			</li>
			<li> 
				<a href="#" class="nav-top-item "> 
				报到管理
				</a>
				<ul>
					<li><a href="javascript:load('${ctx}/checkIn/listCourse?currentPage=1');">报到管理</a></li>
				</ul>
			</li>
			<li> 
				<a href="#" class="nav-top-item "> 
				报名管理
				</a>
				<ul>
					<li><a href="javascript:load('${ctx}/signup/listCourse?currentPage=1');">报名管理</a></li>
				</ul>
			</li>
			<li> 
				<a href="#" class="nav-top-item "> 
				计划管理
				</a>
				<ul>
					<li><a href="javascript:load('${ctx}/project/list?currentPage=1');">项目管理</a></li>
					<li><a href="javascript:load('${ctx}/plan/listProject?currentPage=1');">月计划管理</a></li>
				</ul>
			</li>
			<li>
				<a href="#" class="nav-top-item">
					系统设置
				</a>
				<ul>
				<security:check permission="2000"> 
					<li><a href="javascript:load('${ctx}/dept/list?currentPage=1');">部门管理</a></li>
				</security:check>
				<security:check permission="2001"> 
					<li><a href="javascript:load('${ctx}/account/list?currentPage=1');">人员管理</a></li>
				</security:check>
				</ul>
			</li>      
			</ul>
 			<!-- End #main-nav -->
		</div>
	</div> <!-- End #sidebar -->
		
	<!-- 内容显示区域 -->		
	<div id="main-content"> <!-- Main Content Section with everything -->
		<noscript> <!-- Show a notification if the user has disabled javascript -->
			<div class="notification error png_bg">
				<div>
					你的浏览器不支持JavaScript,请打开你的浏览器的脚本支持。或者下载firfox\ie7+\chrome等浏览器
				</div>
			</div>
		</noscript>
					
		<!-- Page Head -->
		<h2>欢迎!</h2>
		<p id="page-intro">你想做什么呢？</p>
					
		<ul class="shortcut-buttons-set">
			<li><a class="shortcut-button" href="#"><span>
				<img src="${ctx}/images/icons/pencil_48.png" alt="icon" /><br />
				发布文章
			</span></a></li>
			<li><a class="shortcut-button" href="#"><span>
				<img src="${ctx}/images/icons/paper_content_pencil_48.png" alt="icon" /><br />
				创建栏目
			</span></a></li>
			<li><a class="shortcut-button" href="#"><span>
				<img src="${ctx}/images/icons/image_add_48.png" alt="icon" /><br />
				上传资料
			</span></a></li>
			<li><a class="shortcut-button" href="#"><span>
				<img src="${ctx}/images/icons/clock_48.png" alt="icon" /><br />
				添加任务
			</span></a></li>
			<li><a class="shortcut-button" href="#messages" rel="modal"><span>
				<img src="${ctx}/images/icons/comment_48.png" alt="icon" /><br />
				查看帮助
			</span></a></li>
		</ul><!-- End .shortcut-buttons-set -->
					
		<div class="clear"></div> <!-- End .clear -->
		<div class="content-box"><!-- Start Content Box -->
			<div class="content-box-header">				
				<h3>我的资料</h3>
			</div> <!-- End .content-box-header -->
			<div class="content-box-content">
				<form action="#" method="post">
					<fieldset> <!-- Set class to "column-left" or "column-right" on fieldsets to divide the form into columns -->
						<p>
							<label>上次登录时间：</label>
							<input class="text-input medium-input" type="text" value='<fmt:formatDate value="${obj.lastLoginTime}" pattern="yyyy/MM/dd HH:mm:ss"/>' readonly="readonly"/> 
							<span class="input-notification information png_bg">这里记录了你上次登录的时间，如有不同请及时修改你的密码</span>
							<!-- Classes for input-notification: success, error, information, attention -->
							<br />
						</p>
						<p>
							<label>上次登录IP：</label>
							<input class="text-input medium-input" type="text" value="${obj.lastLoginIp}" readonly="readonly"/> 
							<span class="input-notification information png_bg">上次登录的IP地址信息</span>
						</p>
						<p>
							<label>登录次数</label>
							<input class="text-input medium-input" type="text" value="${obj.logintimes}" readonly="readonly"/>
							<span class="input-notification information png_bg">记录了你总共登录的次数</span>
						</p>
					</fieldset>
					<div class="clear"></div><!-- End .clear -->
				</form>
			</div> <!-- End .content-box-content -->
		</div> <!-- End .content-box -->
					
		<div id="footer">
			<small> <!-- Remove this notice or replace it with whatever you want -->
	
			</small>
		</div><!-- End #footer -->
	</div> <!-- End #main-content -->
</div>
</body>
</html>
