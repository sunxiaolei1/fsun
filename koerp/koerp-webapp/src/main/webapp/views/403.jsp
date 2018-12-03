<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div id="navbar" class="navbar navbar-default  ace-save-state">
	<div class="navbar-container ace-save-state" id="navbar-container">
		<div class="navbar-header pull-left">
			<a href="index.html" class="navbar-brand">
				<small>
					<i class="fa fa-leaf"></i>
					权限管理系统
				</small>
			</a>
		</div>
	</div>
</div>

<div class="main-container ace-save-state" id="main-container">
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs ace-save-state" id="breadcrumbs">
				<ul class="breadcrumb">
					<li>
						<i class="ace-icon fa fa-home home-icon"></i>
						<a href="#">首页</a>
					</li>
					<li class="active">403错误</li>
				</ul><!-- /.breadcrumb -->
			</div>
			
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
						<!-- PAGE CONTENT BEGINS -->

						<div class="error-container">
							<div class="well">
								<h1 class="grey lighter smaller">
									<span class="blue bigger-125">
										<i class="ace-icon fa fa-sitemap"></i>
										403
									</span>
									权限错误
								</h1>

								<hr />
								<h3 class="lighter smaller">对不起，您没有权限访问此链接，请联系管理员！</h3>

								<div>
								<!-- 其他内容 -->
								</div>

								<hr />
								<div class="space"></div>

								<div class="center">
									<a href="<%=request.getContextPath()%>" class="btn btn-grey">
										<i class="ace-icon fa fa-arrow-left"></i>
										返回登录页
									</a>
								</div>
							</div>
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.page-content -->
		</div>	
	</div>

	<div class="footer">
		<div class="footer-inner">
			<div class="footer-content">
				<span class="bigger-120">
					<span class="blue bolder">版权所有</span>
					Application &copy; 2013-2014
				</span>
			</div>
		</div>
	</div>

	<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
		<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
	</a>
	
</div>
<%@ include file="footer.jsp" %>