<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <%@taglib uri="http://shiro.apache.org/tags" prefix="sec" %>
 <%@taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>后台管理-权限资源管理</title>
    <meta name="keywords" content="后台管理，权限资源管理">
    <meta name="description" content="后台管理权限资源管理">
 	<link href="<c:url value='/resources/hplus/css/bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/hplus/css/font-awesome.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/hplus/css/plugins/iCheck/custom.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/hplus/css/animate.min.css'/>" rel="stylesheet">
        <link href="<c:url value='/resources/hplus/js/plugins/zTree/css/zTreeStyle/metro.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/hplus/css/style.min.css'/>" rel="stylesheet">

</head>

<body class="gray-bg">
    <div class="row wrapper wrapper-content animated fadeInRight">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>权限资源管理</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
              
                <div class="ibox-content">
               <sec:hasPermission name="admin:resource:index">
                <div class="row">
  <div class="col-md-6">
    <div class="input-group">
     <sec:hasPermission name="admin:resource:addResource">
     <button id="_btnNewResource"  class="btn  btn-success btn-flat pull-center">新增权限资源</button> &nbsp; &nbsp; &nbsp; &nbsp;
      </sec:hasPermission>
      <sec:hasPermission name="admin:resource:editResource">
      <button id="_btnEditResource"  class="btn  btn-info btn-flat pull-center">修改权限资源</button> &nbsp; &nbsp; &nbsp; &nbsp;
      </sec:hasPermission>
      <sec:hasPermission name="admin:resource:deleteResource">
      <button id="_btnDeleteResource"  class="btn  btn-danger btn-flat pull-center">删除权限资源</button> 
   	</sec:hasPermission>
    </div><!-- /input-group -->
  </div><!-- /.col-lg-6 -->
  <div class="col-md-2">
    <div class="input-group">
    </div><!-- /input-group -->
  </div><!-- /.col-lg-6 -->
   <div class="col-md-4">
    <div class="input-group">
      <div class="alert alert-success">
                            只有选择对应级别才可以新增下级权限资源哦！ <a class="alert-link" href="javascript:void(0)">了解更多</a>.
                        </div>
    </div><!-- /input-group -->
  </div><!-- /.col-lg-6 -->
</div><!-- /.row -->

     <!-- 开始 -->
            	<div class="row">
            	
            		<div class="col-md-12">
            		<div class="center">
            		<ul id="resourceTree" class="ztree"  style="min-height: 400px;"></ul>
            		</div>
            		
            		
            		</div>
            	</div>
            	
            	<!-- 结束 -->
           </sec:hasPermission>
           
                
               
                </div>
            </div>
        </div>
    </div>

	<!-- 新增角色 -->
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
  
<!-- 角色设置权限资源 -->
	<div class="hide">
    <div id="settingResourcewrap">
      <div class="center">
      			<input type="hidden" id="_settingRoleId" >
            		<ul id="resourceTree" class="ztree"  style="min-height: 400px;"></ul>
          </div>
    </div>
  </div>
  

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


    <!-- 全局js -->
   <script src="<c:url value='/resources/hplus/js/jquery-2.1.1.min.js'/>"></script>
    <script src="<c:url value='/resources/hplus/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/resources/hplus/js/plugins/layer/layer.min.js'/>"></script>
    <script src="<c:url value='/resources/hplus/js/plugins/validate/jquery.validate.min.js'/>"></script>
    <script src="<c:url value='/resources/hplus/js/plugins/validate/messages_zh.min.js'/>"></script>
    <script src="<c:url value='/resources/hplus/js/plugins/bootstrap-jquery-plugin-master/js/jquery.bootstrap.js'/>"></script>
    <script src="<c:url value='/resources/hplus/js/plugins/layer/laydate/laydate.js'/>"></script>
    <script src="<c:url value='/resources/hplus/js/plugins/iCheck/icheck.min.js'/>"></script>
    <script src="<c:url value='/resources/hplus/js/plugins/zTree/js/jquery.ztree.all-3.5.min.js'/>"></script>

     <script type="text/javascript">
	var basePath = "<c:url value='/'/>";
	$(function(){
		
		 $('.i-checks').iCheck({
             checkboxClass: 'icheckbox_square-green',
             radioClass: 'iradio_square-green'
         });
		 
		
	});
</script>
    <script src="<c:url value='/resources/js/admin/resource/index.js'/>"></script>



    <!-- 自定义js -->
    <script src="<c:url value='/resources/hplus/js/content.min.js?v=1.0.0'/>"></script>


    
    <!--统计代码，可删除-->

</body>

</html>