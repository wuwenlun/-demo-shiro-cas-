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

    <title>后台管理-用户管理</title>
    <meta name="keywords" content="后台管理，角色管理">
    <meta name="description" content="后台管理-角色管理">
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
                    <h5>角色管理</h5>
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
                
                <sec:hasPermission name="admin:role:index">
                <form id="_searchForm" class="form-horizontal" action="<c:url value='/admin/user/index.do'/>" method="get">
                 <input type="hidden" name="pageSize" id="_pageSize" value="${page.pageSize}">
                 <input type="hidden" name="pageNum" id="_pageNum" value="${page.pageNum}">
                 
                 
                 <div class="row">
                 
		 <div class="col-md-4">
		    <div class="form-group">
		        <label class="col-sm-3 control-label">角色名称</label>
		        <div class="col-sm-9">
		              <input type="text" placeholder="请输入角色名称" id="roleName" name="roleName" value="${role.roleName}" class="form-control input-sm">
		
		        </div>
		    </div>
		</div>
		<div class="col-md-4">
		    <div class="form-group">
		        <label class="col-sm-3 control-label">创建时间</label>
		        <div class="col-sm-9">
		             <input type="text" name="startTime" placeholder="请输入开始时间" id="startTime" value="${startTime}" class="form-control input-sm" readonly="readonly">
		
		        </div>
		    </div>
		</div>
		<div class="col-md-4">
		    <div class="form-group">
		        <label class="col-sm-3 control-label">至&nbsp;&nbsp;&nbsp;&nbsp;</label>
		        <div class="col-sm-9">
		            <input type="text" placeholder="请输入结束时间" id="endTime" name="endTime" value="${endTime}" class="form-control input-sm" readonly="readonly">
		
		        </div>
		    </div>
		</div>
      </div>
              
            
                <div class="row">
  <div class="col-md-4">
    <div class="input-group">
    <sec:hasPermission name="admin:role:addRole">
     <button id="_btnNewRole"  class="btn  btn-success btn-flat pull-left">&nbsp;&nbsp;&nbsp;新增角色</button>
    </sec:hasPermission>
    </div><!-- /input-group -->
  </div><!-- /.col-lg-6 -->
  <div class="col-md-4">
    <div class="input-group">
    </div><!-- /input-group -->
  </div><!-- /.col-lg-6 -->
   <div class="col-md-4">
    <div class="input-group">
      <button id="_searchRole"  class="btn  btn-info btn-flat ">搜&nbsp;&nbsp;&nbsp;索</button>
    </div><!-- /input-group -->
  </div><!-- /.col-lg-6 -->
</div><!-- /.row -->
</form>
           <br>
           
           
           <div class="row">
           	<div class="col-lg-12">
           	
           		
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                  <th width="50">编号</th>
			                      <th>角色名称</th>
			                      <th width="50">状态</th>
			                      <th>创建时间</th>
			                      <th>更新时间</th>
			                      <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
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
				                      <sec:hasPermission name="admin:role:editRole">
				                      <button class="btn  btn-primary btn-xs btn_editRole" attVal ="${role.roleId}">修改</button>
				                      </sec:hasPermission>
				                      <sec:hasPermission name="admin:role:deleteRole">
				                      <button class="btn  btn-danger btn-xs btn_deleteRole" attVal ="${role.roleId}" >删除</button>
				                      </sec:hasPermission>
				                      <sec:hasPermission name="admin:role:settingResource">
				                      <button class="btn  btn-info btn-xs btn_settingResource" attVal ="${role.roleId}" >角色授权</button>
				                      </sec:hasPermission>
				                      </td>
				                   </tr>
                                </c:forEach>
                            </tbody>
                        </table>
           	</div>
           </div>     
                
                <div class="row">
                <div class="col-md-7"></div>
                	<div class="col-md-5 pull-rifht">
					<nav>
					  <ul class="pagination">
					  <tags:pager pages="${page.totalPage }" pageSize="${page.pageSize }" pageNum="${page.pageNum }"  jumpFunction="UserManager.ctrl.pageFunction" pageRange="5"></tags:pager>
					  </ul>
					</nav>
                	</div>
                </div>
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
    <script src="<c:url value='/resources/js/admin/role/index.js'/>"></script>



    <!-- 自定义js -->
    <script src="<c:url value='/resources/hplus/js/content.min.js?v=1.0.0'/>"></script>


    
    <!--统计代码，可删除-->

</body>

</html>