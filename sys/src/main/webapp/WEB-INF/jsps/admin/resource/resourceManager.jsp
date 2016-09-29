<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="tags" %>
  <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
           	系统管理
            <small>权限资源管理</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> 系统管理</a></li>
            <li class="active">权限资源管理</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
		
          <!-- Default box -->
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">权限信息列表</h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                <button class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body table-responsive no-padding">
            <div class="row">
               <div class="box box-info">
                <div class="box-header">
                </div><!-- /.box-header -->
                  <div class="box-body">
                  <div class="pad margin no-print">
          <div class="callout callout-info" style="margin-bottom: 0!important;">
            <h4><i class="fa fa-info"></i> 友情提示:</h4>
            		只有选择对应级别才可以新增下级权限资源哦！
          </div>
        </div>
                  
                  <div class="row">
                  	
                   <div class="col-md-5">
                   <button id="_btnNewResource"  class="btn  btn-success btn-flat pull-center">新增权限资源</button>
                   <button id="_btnEditResource"  class="btn  btn-info btn-flat pull-center">修改权限资源</button>
                   <button id="_btnDeleteResource"  class="btn  btn-danger btn-flat pull-center">删除权限资源</button>
                   </div>
                   <div class="col-md-3"></div>
                  </div>
                  </div><!-- /.box-body -->
              </div>
                  </div>
            	<!-- 开始 -->
            	<div class="row">
            	
            		<div class="col-md-12">
            		<div class="center">
            		<ul id="resourceTree" class="ztree"  style="min-height: 400px;"></ul>
            		</div>
            		
            		
            		</div>
            	</div>
            	
            	<!-- 结束 -->
             
            </div><!-- /.box-body -->
            <div class="box-footer clearfix">
         			 
            </div><!-- /.box-footer-->
          </div><!-- /.box -->

		<!-- 新增权限资源 -->
	<div class="hide">
    <div id="saveResourcewrap">
      <form id="_addResourceForm" class="form-horizontal">
                  <div class="box-body">
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="resourceName">资源名称</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输入权限资源名称" id="resourceName" name="resourceName" class="form-control input-sm">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="resourceUrl">资源URL</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输入权限资源URL" id="resourceUrl" name="resourceUrl" class="form-control input-sm">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="permission">权限码</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输入权限资源码" id="permission" name="permission" class="form-control input-sm">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="icon">资源icon</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输入权限资源icon" id="icon" name="icon" class="form-control input-sm">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="sysType">系统类型</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输入资源系统类型" id="sysType" name="sysType" class="form-control input-sm">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="sex">状态</label>
                      <div class="col-sm-10">
                    <label>
                      <input type="radio" name="state" value="0" class="minimal" checked>
                      	有效
                    </label>
                    <label>
                      <input type="radio" name="state" value="1" class="minimal">
                      	无效
                    </label>
                      </div>
                    </div>
                    
                     <div class="form-group">
                      <label class="col-sm-2 control-label" for="description">资源描述</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输资源描述" name="description" id="description" class="form-control input-sm">
                      </div>
                    </div>
                  </div><!-- /.box-body -->
                </form>
    </div>
  </div>
  
  		<!-- 新增非一级权限资源 -->
	<div class="hide">
    <div id="saveSecondResourcewrap">
      <form id="_addSecondResourceForm" class="form-horizontal">
      <input type="hidden" name="type" id="secondType">
      <input type="hidden" name="parentId" id="secondParentId">
                  <div class="box-body">
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="resourceName">资源名称</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输入权限资源名称"  name="resourceName" class="form-control input-sm">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="resourceUrl">资源URL</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输入权限资源URL"  name="resourceUrl" class="form-control input-sm">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="permission">权限码</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输入权限资源码"  name="permission" class="form-control input-sm">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="icon">资源icon</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输入权限资源icon" id="icon" name="icon" class="form-control input-sm">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="sysType">系统类型</label>
                      <div class="col-sm-10">
                        <input type="text" id="secondSysType" name="sysType" readonly class="form-control input-sm">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="sysType">上级</label>
                      <div class="col-sm-10">
                      <input type="text" placeholder="" id="secondsysParentName" name="SecondsysParentName" readonly class="form-control input-sm">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="sex">状态</label>
                      <div class="col-sm-10">
                    <label>
                      <input type="radio" name="state" value="0" class="minimal" checked>
                      	有效
                    </label>
                    <label>
                      <input type="radio" name="state" value="1" class="minimal">
                      	无效
                    </label>
                      </div>
                    </div>
                    
                     <div class="form-group">
                      <label class="col-sm-2 control-label" for="description">资源描述</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输资源描述" name="description" id="description" class="form-control input-sm">
                      </div>
                    </div>
                  </div><!-- /.box-body -->
                </form>
    </div>
  </div>
  
  	<!-- 修改权限资源 -->
	<div class="hide">
    <div id="editResourcewrap">
      <form id="_editResourceForm" class="form-horizontal">
      <input type="hidden" name="type" id="editType">
      <input type="hidden" name="resourceId" id="editResourceId">
                  <div class="box-body">
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="editresourceName">资源名称</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输入权限资源名称" id="editresourceName" name="resourceName" class="form-control input-sm">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="editresourceUrl">资源URL</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输入权限资源URL" id="editresourceUrl" name="resourceUrl" class="form-control input-sm">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="editpermission">权限码</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输入权限资源码" id="editpermission" name="permission" class="form-control input-sm">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="editicon">资源icon</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输入权限资源icon" id="editicon" name="icon" class="form-control input-sm">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="editsysType">系统类型</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输入资源系统类型" id="editsysType" name="sysType" class="form-control input-sm">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="editsex">状态</label>
                      <div class="col-sm-10">
                    <label>
                      <input type="radio" id="editstate0" name="state" value="0" class="minimal" checked>
                      	有效
                    </label>
                    <label>
                      <input type="radio" id="editstate1" name="state" value="1" class="minimal">
                      	无效
                    </label>
                      </div>
                    </div>
                    
                     <div class="form-group">
                      <label class="col-sm-2 control-label" for="editdescription">资源描述</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输资源描述" name="description" id="editdescription" class="form-control input-sm">
                      </div>
                    </div>
                  </div><!-- /.box-body -->
                </form>
    </div>
  </div>
  
  
  
  <!-- 修改权限资源2 -->
	<div class="hide">
    <div id="editSecondResourcewrap">
      <form id="_editSecondResourceForm" class="form-horizontal">
      <input type="hidden" name="type" id="editSecondType">
      <input type="hidden" name="parentId" id="editSecondParentId">
      <input type="hidden" name="resourceId" id="editSecondResourceId">
                  <div class="box-body">
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="editSecondresourceName">资源名称</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输入权限资源名称" id="editSecondresourceName" name="resourceName" class="form-control input-sm">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="editSecondresourceUrl">资源URL</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输入权限资源URL" id="editSecondresourceUrl" name="resourceUrl" class="form-control input-sm">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="editSecondpermission">权限码</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输入权限资源码" id="editSecondpermission" name="permission" class="form-control input-sm">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="editSecondicon">资源icon</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输入权限资源icon" id="editSecondicon" name="icon" class="form-control input-sm">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="editSecondsysType">系统类型</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="" readonly id="editSecondsysType" name="sysType" class="form-control input-sm">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="editSecondsex">状态</label>
                      <div class="col-sm-10">
                    <label>
                      <input type="radio" id="editSecondstate0" name="state" value="0" class="minimal" checked>
                      	有效
                    </label>
                    <label>
                      <input type="radio" id="editSecondstate1" name="state" value="1" class="minimal">
                      	无效
                    </label>
                      </div>
                    </div>
                    
                     <div class="form-group">
                      <label class="col-sm-2 control-label" for="editSeconddescription">资源描述</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输资源描述" name="description" id="editSeconddescription" class="form-control input-sm">
                      </div>
                    </div>
                  </div><!-- /.box-body -->
                </form>
    </div>
  </div>
  
  
  
        </section><!-- /.content -->
        <%@ include file="/WEB-INF/common/jsLib.jsp"%>
        <script  type="text/javascript" src="<c:url value='/resources/lte/plugins/zTree/js/jquery.ztree.all-3.5.min.js'/>"></script>
        <script  type="text/javascript" src="<c:url value='/resources/js/admin/resource/resourceManager.js'/>"></script>
    