<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="tags" %>
  <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
           	系统管理
            <small>角色管理</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> 系统管理</a></li>
            <li class="active">角色管理</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
		
          <!-- Default box -->
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">角色信息列表</h3>
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
                <!-- form start -->
                <form id="_searchForm" class="form-horizontal" action="<c:url value='/admin/role/index.do'/>" method="get" >
                <input type="hidden" name="pageSize" id="_pageSize" value="${page.pageSize}">
                 <input type="hidden" name="pageNum" id="_pageNum" value="${page.pageNum}">
                  <div class="box-body">
                  <div class="row">
                  <div class="col-md-4"> <div class="form-group">
                      <label class="col-sm-4 control-label" for="roleName">角色名称</label>
                      <div class="col-sm-8">
                        <input type="text" placeholder="请输入角色名称" id="roleName" name="roleName" value="${role.roleName}" class="form-control input-sm">
                      </div>
                    </div></div>
                  <div class="col-md-4"> <div class="form-group">
                      <label class="col-sm-4 control-label" for="startTime">创建时间</label>
                      <div class="col-sm-8">
                        <input type="text" name="startTime" placeholder="请输入开始时间" id="startTime" value="${startTime}" class="form-control input-sm">
                      </div>
                    </div></div>
                     <div class="col-md-4"> <div class="form-group">
                      <label class="col-sm-4 control-label" for="endTime">至&nbsp;&nbsp;&nbsp;&nbsp;</label>
                      <div class="col-sm-8">
                        <input type="text" placeholder="请输入结束时间" id="endTime" name="endTime" value="${endTime}" class="form-control input-sm">
                      </div>
                    </div></div>
                  </div>
                  <div class="row">
                   <div class="col-md-5"><button id="_btnNewRole"  class="btn  btn-success btn-flat pull-left">&nbsp;&nbsp;&nbsp;新增角色</button></div>
                  	<div class="col-md-5">
                  	<div class="form-group pull-right">
                     	 <button id="_searchRole"  class="btn  btn-info btn-flat ">搜&nbsp;&nbsp;&nbsp;索</button> 
                    </div>
                  	</div>
                  	<div class="col-md-1"></div>
                  </div>
                  
                  </div><!-- /.box-body -->
                </form>
              </div>
                  </div>
            	<table class="table table-hover">
                    <tr>
                      <th width="50">编号</th>
                      <th>角色名称</th>
                      <th width="50">状态</th>
                      <th>创建时间</th>
                      <th>更新时间</th>
                      <th>操作</th>
                    </tr>
                    
                    <c:forEach items="${page.list}" var="role" varStatus="roleStatus">
                    
                    <tr>
                      <td>${roleStatus.index +1}</td>
                      <td>${role.roleName }</td>
                      <td>
                      <c:choose>
                      	<c:when test="${role.state eq 0 }">
                      	 <span class="label label-success">正常</span>
                      	</c:when>
                      	<c:otherwise>
                      	<span class="label label-danger">无效</span>
                      	</c:otherwise>
                      </c:choose>
                     </td>
                      <td> <fmt:formatDate value="${role.createTime }" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
                      <td><fmt:formatDate value="${role.updateTime}" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
                      <td>
                      <button class="btn  btn-primary btn-xs btn_editRole" attVal ="${role.roleId}">修改</button>
                      <button class="btn  btn-danger btn-xs btn_deleteRole" attVal ="${role.roleId}" >删除</button>
                      <button class="btn  btn-info btn-xs btn_settingResource" attVal ="${role.roleId}" >角色授权</button>
                      </td>
                    </tr>
                    </c:forEach>
                    
                  </table>
            	<!-- 结束 -->
             
            </div><!-- /.box-body -->
            <div class="box-footer clearfix">
         			 <ul class="pagination pagination-sm no-margin pull-right">
         			 <tags:pager pages="${page.totalPage }" pageSize="${page.pageSize }" pageNum="${page.pageNum }"  jumpFunction="RoleManager.ctrl.pageFunction" pageRange="5"></tags:pager>
                  </ul>
            </div><!-- /.box-footer-->
          </div><!-- /.box -->

		<!-- 新增用户 -->
	<div class="hide">
    <div id="saveRolewrap">
      <form id="_addRoleForm" class="form-horizontal">
                  <div class="box-body">
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="nickName">昵称</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输入角色名称" id="roleName" name="roleName" class="form-control input-sm">
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
                      <label class="col-sm-2 control-label" for="address">角色描述</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输角色描述" name="description" id="description" class="form-control input-sm">
                      </div>
                    </div>
                  </div><!-- /.box-body -->
             
                </form>
    </div>
  </div>
  
  <!-- 修改角色信息 -->
	<div class="hide">
    <div id="editRolewrap">
      <form id="_editRoleForm" class="form-horizontal">
      <input type="hidden" name="roleId" id="editroleId">
                  <div class="box-body">
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="nickName">昵称</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输入角色名称" id="editroleName" name="roleName" class="form-control input-sm">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="sex">状态</label>
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
                      <label class="col-sm-2 control-label" for="address">角色描述</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输角色描述"  name="description" id="editdescription" class="form-control input-sm">
                      </div>
                    </div>
                  </div><!-- /.box-body -->
             
                </form>
    </div>
  </div>
  
  
  <!-- 修改角色信息 -->
	<div class="hide">
    <div id="settingResourcewrap">
      <div class="center">
      			<input type="hidden" id="_settingRoleId" >
            		<ul id="resourceTree" class="ztree"  style="min-height: 400px;"></ul>
          </div>
    </div>
  </div>
  
  
        </section><!-- /.content -->
        <%@ include file="/WEB-INF/common/jsLib.jsp"%>
        <script  type="text/javascript" src="<c:url value='/resources/lte/plugins/zTree/js/jquery.ztree.all-3.5.min.js'/>"></script>
        <script  type="text/javascript" src="<c:url value='/resources/js/admin/role/roleManager.js'/>"></script>