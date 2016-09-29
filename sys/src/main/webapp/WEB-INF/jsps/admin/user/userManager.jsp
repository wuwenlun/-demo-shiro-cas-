<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="tags" %>
  <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
           	系统管理
            <small>用户管理</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> 系统管理</a></li>
            <li class="active">用户管理</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          <!-- Default box -->
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">用户信息列表</h3>
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
                <form id="_searchForm" class="form-horizontal" action="<c:url value='/admin/user/index.do'/>" method="get">
                 <input type="hidden" name="pageSize" id="_pageSize" value="${page.pageSize}">
                 <input type="hidden" name="pageNum" id="_pageNum" value="${page.pageNum}">
                  <div class="box-body">
                  
                  <div class="row">
                  <div class="col-md-4"> <div class="form-group">
                      <label class="col-sm-4 control-label" for="nickName">昵称</label>
                      <div class="col-sm-8">
                        <input type="text" placeholder="请输入用户昵称" id="nickName" name="nickName" value="${user.nickName}" class="form-control input-sm">
                      </div>
                    </div></div>
                  <div class="col-md-4"> <div class="form-group">
                      <label class="col-sm-4 control-label" for="userName">用户名</label>
                      <div class="col-sm-8">
                        <input type="text" name="userName" placeholder="请输入用户名" id="userName" value="${user.userName}" class="form-control input-sm">
                      </div>
                    </div></div>
                     <div class="col-md-4"> <div class="form-group">
                      <label class="col-sm-4 control-label" for="mobile">手机号码</label>
                      <div class="col-sm-8">
                        <input type="text" placeholder="请输入手机号码" id="mobile" name="mobile" value="${user.mobile}" class="form-control input-sm">
                      </div>
                    </div></div>
                    
                  </div>
                  
                    
                    <div class="row">
                  <div class="col-md-4"> <div class="form-group">
                      <label class="col-sm-4 control-label" for="inputEmail3">邮箱</label>
                      <div class="col-sm-8">
                        <input type="email" placeholder="请输入邮箱" id="email" name="email" value="${user.email}" class="form-control input-sm">
                      </div>
                    </div></div>
                  <div class="col-md-4"> <div class="form-group">
                      <label class="col-sm-4 control-label" for="startTime">注册时间</label>
                      <div class="col-sm-8">
                     
                        <input name="startTime" placeholder="请输入起始时间" id="startTime" value="<fmt:formatDate value='${startTime}' pattern='yyyy-MM-dd hh:mm:ss'/>" class="form-control input-sm" readonly="readonly">
                      </div>
                    </div></div>
                     <div class="col-md-4"> <div class="form-group">
                      <label class="col-sm-4 control-label" for="endTime" >至&nbsp;&nbsp;&nbsp;&nbsp;</label>
                      <div class="col-sm-8">
                        <input type="email" placeholder="请输入结束时间" id="endTime" value="<fmt:formatDate value='${endTime}' pattern='yyyy-MM-dd hh:mm:ss'/>" class="form-control input-sm" readonly="readonly">
                      </div>
                    </div></div>
                    
                  </div>
                  
                  
                  
                  <div class="row">
                   <div class="col-md-5"><button  onclick="return UserManager.ctrl.button.openSaveDialog();" class="btn  btn-success btn-flat pull-left">新增用户</button></div>
                  	<div class="col-md-5">
                  	<div class="form-group">
                     	 <button id="_searchUser" class="btn  btn-info btn-flat pull-right">搜&nbsp;&nbsp;&nbsp;索</button> 
                    </div>
                  	
                  	
                  	</div>
                  	<div class="col-md-1"></div>
                  </div>
                  
                  </div><!-- /.box-body -->
                </form>
              </div>
               
               <!--  -->
                    
                  </div>
            
            	<!-- 开始 -->  
            	<table class="table table-hover">
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
                      <button class="btn  btn-primary btn-xs btn_updateUser"  attVal ="${user.userId}">修改</button>
                      <button class="btn  btn-danger btn-xs btn_deleteUser"  attVal ="${user.userId}" >删除</button>
                      <button class="btn  btn-info btn-xs btn_authorUser"  attVal ="${user.userId}" >设置角色</button>
                      </td>
                    </tr>
                    </c:forEach>
                    
                  </table>
            	<!-- 结束 -->
             
            </div><!-- /.box-body -->
            <div class="box-footer clearfix">
         			 <ul class="pagination pagination-sm no-margin pull-right">
         			 <tags:pager pages="${page.totalPage }" pageSize="${page.pageSize }" pageNum="${page.pageNum }"  jumpFunction="UserManager.ctrl.pageFunction" pageRange="5"></tags:pager>
                  </ul>
            </div><!-- /.box-footer-->
          </div><!-- /.box -->

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
                      <input type="radio" name="sex" value="0" class="minimal" checked>
                      	男
                    </label>
                    <label>
                      <input type="radio" name="sex" value="1" class="minimal">
                      	女
                    </label>
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="state">状态</label>
                      <div class="col-sm-10">
                    <label>
                      <input type="radio" name="state" value="0" class="minimal" checked>
                      	正常
                    </label>
                    <label>
                      <input type="radio" name="state" value="1" class="minimal">
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
                      <input type="radio" id="editSex0" name="sex" value="0" class="minimal" >
                      	男
                    </label>
                    <label>
                      <input type="radio" id="editSex1" name="sex" value="1" class="minimal">
                      	女
                    </label>
                      </div>
                    </div>
                    
                      <div class="form-group">
                      <label class="col-sm-2 control-label" for="state">状态</label>
                      <div class="col-sm-10">
                    <label>
                      <input type="radio" id="editstate0" name="state" value="0" class="minimal" >
                      	正常
                    </label>
                    <label>
                      <input type="radio" id="editstate1" name="state" value="1" class="minimal">
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
  
  
  <!-- 用户设置角色 -->
  
  
  
  <!-- 开始 -->  
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
                      <input type="checkbox" name="roleState" value="0" class="minimal" checked>
                    </label></td>
                    	<td>角色名称</td>
                    	<td>角色名称</td>
                    	<td>角色名称</td>
                    	<td>角色名称</td>
                    </tr>
                    
                  </table>
                  </div>
                  </div>
            	<!-- 结束 -->
  
        </section><!-- /.content -->
        
<!--

//-->

        <%@ include file="/WEB-INF/common/jsLib.jsp"%>
        
        <script  type="text/javascript" src="<c:url value='/resources/js/admin/user/userManager.js'/>"></script>
        <script  type="text/javascript" >
         function jumpFunction(pageSize,pageNum) {
        	$("#_pageSize").val(pageSize);
        	$("#_pageNum").val(pageNum);
        	$("#_searchForm").form()[0].sumbit();
        }
        
        </script>