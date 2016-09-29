<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>Insert title here</title>
<%@ include file="/WEB-INF/common/cssLib.jsp" %>
</head>
<body class="hold-transition login-page">
    <div class="login-box">
      <div class="login-logo">
        <a href="javascript:void(0);"><b>大平台管理</b>系统</a>
      </div><!-- /.login-logo -->
      <div class="login-box-body">
        <p class="login-box-msg">
        <c:set var="userNameError" value="0"/>
        <c:set var="passwordError" value="0"/>
          <c:choose>
          		<c:when test="${sysloginErrorAttribute == 'org.dongtian.sys.exception.UserNameNullException'}">
          			<font color="red">用户名不能为空!</font>
          			 <c:set var="userNameError" value="1"/>
          		</c:when>
          		<c:when test="${sysloginErrorAttribute == 'org.dongtian.sys.exception.PasswordNullException'}">
          			 <c:set var="passwordError" value="1"/>
          			<font color="red">密码不能为空!</font>
          		</c:when>
          		<c:when test="${sysloginErrorAttribute == 'org.apache.shiro.authc.UnknownAccountException'}">
          			<font color="red">此用户不存在!</font>
          			 <c:set var="userNameError" value="1"/>
          		</c:when>
          		<c:when test="${sysloginErrorAttribute == 'org.apache.shiro.authc.DisabledAccountException'}">
          			<font color="red">此用户已经被锁定!</font>
          		</c:when>
          		<c:otherwise>
          			请登录
          		</c:otherwise>
          </c:choose>
        
        </p>
        <form  method="post">
          <div class="form-group has-feedback <c:if test='${userNameError == 1 }'> has-error</c:if>">
            <input name="userName"  class="form-control" placeholder="用户名">
            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback  <c:if test='${passwordError == 1 }'>has-error</c:if>">
            <input type="password" name="password" class="form-control" placeholder="密码">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          <div class="row">
            <div class="col-xs-8">
              <div class="checkbox icheck">
                <label>
                  <input type="checkbox"> 记住我
                </label>
              </div>
            </div><!-- /.col -->
            <div class="col-xs-4">
              <button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
            </div><!-- /.col -->
          </div>
        </form>

        <div class="social-auth-links text-center">
          <p>- 其他登录方式 -</p>
          <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-weibo"></i> 新浪微博登录</a>
          <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-qq"></i>腾讯QQ登录</a>
        </div><!-- /.social-auth-links -->

        <a href="#">忘记密码?</a><br>
        <a href="register.html" class="text-center">注册新用户</a>

      </div><!-- /.login-box-body -->
    </div><!-- /.login-box -->
          
          <%@ include file="/WEB-INF/common/jsLib.jsp" %>
</body>
</html>