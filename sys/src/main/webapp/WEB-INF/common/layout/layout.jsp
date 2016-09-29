<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib tagdir="/WEB-INF/tags" prefix="tags" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><tiles:getAsString name="title" defaultValue="后台"/> </title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

<tiles:insertAttribute name="cssLib"/>
  </head>
  
  <body class="hold-transition skin-blue sidebar-mini">
  
  	 <!-- Site wrapper -->
    <div class="wrapper">
    
    
     <!-- ===================header begin ======================== -->
   	  <tiles:insertAttribute name="header"/>
      <!-- ===================header end ============================ -->

<!-- ==================menu begin ================================================= -->
		<tiles:insertAttribute name="menu"/>
		<!-- ===================menu end================================ -->
      <!-- =================content start ============================== -->

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper" style="min-height: 1090px;">
      
       <tiles:insertAttribute name="content"/>
      </div><!-- /.content-wrapper -->

	<!-- =================content end ============================== -->

	<!-- =====================footer begin==============================  -->
	<tiles:insertAttribute name="footer"/>
	<!-- =====================footer end==============================  -->

	<!-- =====================control sidebar begin=========================================== -->
    <tiles:insertAttribute name="controlSidebar"/>
     <!-- =======control sidebar end ========================== -->
    </div>
     <script src="<c:url value='/resources/js/admin/index/SysCore.js'/>" type="text/javascript"></script>
  </body>
  
  </html>