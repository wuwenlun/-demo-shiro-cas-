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

    <title>H+ 后台主题UI框架 - 按钮</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
 	<link href="<c:url value='/resources/hplus/css/bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/hplus/css/font-awesome.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/hplus/css/plugins/iCheck/custom.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/hplus/css/animate.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/hplus/css/style.min.css'/>" rel="stylesheet">

</head>

<body class="gray-bg">
    <div class="row wrapper wrapper-content animated fadeInRight">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>用户管理</h5>
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
                
                <sec:hasPermission name="admin:user:index">
                <form id="_searchForm" class="form-horizontal" action="<c:url value='/admin/user/index.do'/>" method="get">
                 <input type="hidden" name="pageSize" id="_pageSize" value="${page.pageSize}">
                 <input type="hidden" name="pageNum" id="_pageNum" value="${page.pageNum}">
                 
                 
                 <div class="row">
                 
		 <div class="col-md-4">
		    <div class="form-group">
		        <label class="col-sm-3 control-label">用户名</label>
		        <div class="col-sm-9">
		            <input type="text" placeholder="请输入用户名" id="userName" value="${user.userName}" name="userName" class="form-control">
		
		        </div>
		    </div>
		</div>
		<div class="col-md-4">
		    <div class="form-group">
		        <label class="col-sm-3 control-label">昵称</label>
		        <div class="col-sm-9">
		             <input type="text" placeholder="请输入昵称" id="nickName" name="nickName" value="${user.nickName}" class="form-control" >
		
		        </div>
		    </div>
		</div>
		<div class="col-md-4">
		    <div class="form-group">
		        <label class="col-sm-3 control-label">手机号码</label>
		        <div class="col-sm-9">
		             <input type="text" id="mobile" name="mobile" value="${user.mobile}" placeholder="请输入手机号码" class="form-control" >
		
		        </div>
		    </div>
		</div>
      </div>
              
                          
                 <div class="row">
                 
		 <div class="col-md-4">
		    <div class="form-group">
		        <label class="col-sm-3 control-label">邮箱</label>
		        <div class="col-sm-9">
		            <input type="text" class="form-control" placeholder="请输入邮箱"  id="email" name="email" value="${user.email}" >
		
		        </div>
		    </div>
		</div>
		<div class="col-md-4">
		    <div class="form-group">
		        <label class="col-sm-3 control-label">注册时间</label>
		        <div class="col-sm-9">
		             <input type="text" class="form-control" placeholder="请选择开始时间" id="startTime" value="<fmt:formatDate value='${startTime}' pattern='yyyy-MM-dd hh:mm:ss'/>" readonly="readonly"  name="startTime">
		
		        </div>
		    </div>
		</div>
		<div class="col-md-4">
		    <div class="form-group">
		        <label class="col-sm-3 control-label">&nbsp;&nbsp;至&nbsp;&nbsp;</label>
		        <div class="col-sm-9">
		             <input type="text" class="form-control" placeholder="请选择开始时间"  id="endTime" value="<fmt:formatDate value='${endTime}' pattern='yyyy-MM-dd hh:mm:ss' />" readonly="readonly" >
		
		        </div>
		    </div>
		</div>
      </div>
               
               <br> 
                <div class="row">
  <div class="col-md-4">
    <div class="input-group">
    <sec:hasPermission name="admin:user:addUser">
     <button class="btn btn-info" onclick="return UserManager.ctrl.button.openSaveDialog();"  type="button">新增用户</button>
    </sec:hasPermission>
    </div><!-- /input-group -->
  </div><!-- /.col-lg-6 -->
  <div class="col-md-4">
    <div class="input-group">
    </div><!-- /input-group -->
  </div><!-- /.col-lg-6 -->
   <div class="col-md-4">
    <div class="input-group pull-left">
      <button class="btn btn-primary" id="_searchUser" type="button">搜&nbsp;&nbsp;索</button>
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
			                      <th>昵称</th>
			                      <th>用户名</th>
			                      <th>密码</th>
			                      <th>邮箱</th>
			                      <th>手机号码</th>
			                      <th width="50">状态</th>
			                      <th>注册时间</th>
			                      <th>更新时间</th>
			                      <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${page.list}" var="user" varStatus="userStatus">
                                <tr>
                                 <td>${userStatus.index +1}</td>
				                      <td>${user.nickName }</td>
				                      <td>${user.userName }</td>
				                      <td>${user.password }</td>
				                      <td>${user.email }</td>
				                      <td>${user.mobile }</td>
				                      <td>
				                      <c:choose>
				                      	<c:when test="${user.state eq 0 }">
				                      	 <span class="label label-success">正常</span>
				                      	</c:when>
				                      	<c:otherwise>
				                      	<span class="label label-danger">无效</span>
				                      	</c:otherwise>
				                      </c:choose>
				                     </td>
				                      <td> <fmt:formatDate value="${user.regTime }" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
				                      <td><fmt:formatDate value="${user.updateTime}" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
                                    <td>
                                     <sec:hasPermission name="admin:user:editUser">
                                    <button class="btn  btn-primary btn-xs btn_updateUser" attVal ="${user.userId}"  >修改</button>
                      				</sec:hasPermission>
                      				 <sec:hasPermission name="admin:user:deleteUser">
                      				<button class="btn  btn-danger btn-xs btn_deleteUser"  attVal ="${user.userId}" >删除</button>
                      				</sec:hasPermission>
                      				 <sec:hasPermission name="admin:user:settingRole">
                      				<button class="btn  btn-info btn-xs btn_authorUser"  attVal ="${user.userId}"  >设置角色</button>
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





<!-- 新增用户 -->
	<div class="hide">
    <div id="saveuserwrap">
      <form id="_addUserForm" class="form-horizontal">
                  <div class="box-body">

                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="nickName">昵称</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输入昵称" id="nickName" name="nickName" class="form-control input-sm">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="userName">用户名</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输入用户名" id="userName" name="userName" class="form-control input-sm" data-val="true">
                        
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="password">密码</label>
                      <div class="col-sm-10">
                        <input type="password" placeholder="请输入密码" id="password" name="password" class="form-control input-sm">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="comfromPassword">确认密码</label>
                      <div class="col-sm-10">
                        <input type="password" placeholder="请输入确认密码" name="comfromPassword" id="comfromPassword" class="form-control input-sm">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="email">邮箱</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输入邮箱" name="email" id="email" class="form-control input-sm">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="mobile">手机号码</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输入手机号码" name="mobile" id="mobile" class="form-control input-sm">
                      </div>
                    </div>
                    <div class="form-group">
                    
                    
                      <label class="col-sm-2 control-label" for="sex">性别</label>
                      <div class="col-sm-10">
                    <label>
                      <input type="radio" name="sex" value="0" class="i-checks" checked>
                      	男
                    </label>
                    <label>
                      <input type="radio" name="sex" value="1" class="i-checks">
                      	女
                    </label>
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="state">状态</label>
                      <div class="col-sm-10">
                    <label>
                      <input type="radio" name="state" value="0" class="i-checks" checked>
                      	正常
                    </label>
                    <label>
                      <input type="radio" name="state" value="1" class="i-checks">
                      	无效
                    </label>
                      </div>
                    </div>
                     <div class="form-group">
                      <label class="col-sm-2 control-label" for="age">年龄</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输入年龄" name="age" value="0" id="age" class="form-control input-sm">
                      </div>
                    </div>
                     <div class="form-group">
                      <label class="col-sm-2 control-label" for="address">地址</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输入地址" name="address" id="address" class="form-control input-sm">
                      </div>
                    </div>
                  </div><!-- /.box-body -->
                </form>
    </div>
  </div>
  


 <!-- 修改用户信息 -->
  
  	<!-- 修改用户 -->
        <div class="hide">
    <div id="editUserwrap">
      <form id="_editUserForm" class="form-horizontal">
      <input type="hidden" name="userId" id="edituserId">
                  <div class="box-body">

                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="editnickName">昵称</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输入昵称" id="editnickName" name="nickName" class="form-control input-sm">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="edituserName">用户名</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输入用户名" id="edituserName" name="userName" class="form-control input-sm">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="editpassword">密码</label>
                      <div class="col-sm-10">
                        <input type="password" placeholder="请输入密码" id="editpassword" name="password" class="form-control input-sm">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="editcomfromPassword">确认密码</label>
                      <div class="col-sm-10">
                        <input type="password" placeholder="请输入确认密码" name="comfromPassword" id="editcomfromPassword" class="form-control input-sm">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="editemail">邮箱</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输入邮箱" name="email" id="editemail" class="form-control input-sm">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="editmobile">手机号码</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输入手机号码" name="mobile" id="editmobile" class="form-control input-sm">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="sex">性别</label>
                      <div class="col-sm-10">
                    <label>
                      <input type="radio" id="editSex0" name="sex" value="0" class="i-checks" >
                      	男
                    </label>
                    <label>
                      <input type="radio" id="editSex1" name="sex" value="1" class="i-checks">
                      	女
                    </label>
                      </div>
                    </div>
                    
                      <div class="form-group">
                      <label class="col-sm-2 control-label" for="state">状态</label>
                      <div class="col-sm-10">
                    <label>
                      <input type="radio" id="editstate0" name="state" value="0" class="i-checks" >
                      	正常
                    </label>
                    <label>
                      <input type="radio" id="editstate1" name="state" value="1" class="i-checks">
                      	无效
                    </label>
                      </div>
                    </div>
                     <div class="form-group">
                      <label class="col-sm-2 control-label" for="editage">年龄</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输入年龄" name="age" id="editage" class="form-control input-sm">
                      </div>
                    </div>
                     <div class="form-group">
                      <label class="col-sm-2 control-label" for="editaddress">地址</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="请输入地址" name="address" id="editaddress" class="form-control input-sm">
                      </div>
                    </div>
                  </div><!-- /.box-body -->
             
                </form>
    </div>
  </div>

 <!-- 设置角色开始 -->  
       <div class="hide">
    			<div id="settingRolewrap">
    			<input type="hidden" id="settingUserId" value=""/>
            	<table id="settingRoleTable" class="table table-hover">
                    <tr>
                      <th width="50">编号</th>
                      <th>角色名称</th>
                      <th>角色状态</th>
                      <th>角色创建时间</th>
                      <th>角色修改时间</th>
                    </tr>
                    <tr>
                    	<td> <label>
                      <input type="checkbox" name="roleState" value="0" class="i-checks" checked>
                    </label></td>
                    	<td>角色名称</td>
                    	<td>角色名称</td>
                    	<td>角色名称</td>
                    	<td>角色名称</td>
                    </tr>
                    
                  </table>
                  </div>
                  </div>
            	<!-- 设置角色结束 -->



    <!-- 全局js -->
   <script src="<c:url value='/resources/hplus/js/jquery-2.1.1.min.js'/>"></script>
    <script src="<c:url value='/resources/hplus/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/resources/hplus/js/plugins/layer/layer.min.js'/>"></script>
    <script src="<c:url value='/resources/hplus/js/plugins/validate/jquery.validate.min.js'/>"></script>
    <script src="<c:url value='/resources/hplus/js/plugins/validate/messages_zh.min.js'/>"></script>
    <script src="<c:url value='/resources/hplus/js/plugins/bootstrap-jquery-plugin-master/js/jquery.bootstrap.js'/>"></script>
    <script src="<c:url value='/resources/hplus/js/plugins/layer/laydate/laydate.js'/>"></script>
    <script src="<c:url value='/resources/hplus/js/plugins/iCheck/icheck.min.js'/>"></script>
     <script type="text/javascript">
	var basePath = "<c:url value='/'/>";
	$(function(){
		
		 $('.i-checks').iCheck({
             checkboxClass: 'icheckbox_square-green',
             radioClass: 'iradio_square-green'
         });
		 
		 laydate({
			    elem: '#startTime', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
			    event: 'focus', //响应事件。如果没有传入event，则按照默认的click
			    format: 'YYYY-MM-DD hh:mm:ss',
			    istime: true,
			    festival: false
			});
		 laydate({
			    elem: '#endTime', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
			    event: 'focus', //响应事件。如果没有传入event，则按照默认的click
			    format: 'YYYY-MM-DD hh:mm:ss',
			    istime: true,
			    festival: false
			    
			});
	});
</script>
    <script src="<c:url value='/resources/js/admin/user/index.js'/>"></script>



    <!-- 自定义js -->
    <script src="<c:url value='/resources/hplus/js/content.min.js?v=1.0.0'/>"></script>


    
    <!--统计代码，可删除-->

</body>

</html>