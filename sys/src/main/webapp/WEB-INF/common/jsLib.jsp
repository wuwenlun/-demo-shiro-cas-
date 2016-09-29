<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- jQuery 2.1.4 -->
    <script src="<c:url value='/resources/lte/plugins/jQuery/jQuery-2.1.4.min.js'/>" type="text/javascript"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="<c:url value='/resources/bootstrap/js/bootstrap.min.js'/>" type="text/javascript"></script>
    
    <!-- datables -->
    <script src="<c:url value='/resources/lte/plugins/datatables/jquery.dataTables.min.js'/>" type="text/javascript"></script>
    <script src="<c:url value='/resources/lte/plugins/datatables/dataTables.bootstrap.min.js'/>" type="text/javascript"></script>
    <!-- iCheck -->
    <script src="<c:url value='/resources/lte/plugins/iCheck/icheck.min.js'/>" type="text/javascript"></script>
    <!-- bootstrap validator -->
     <script src="<c:url value='/resources/lte/plugins/TwitterBootstrapjQueryValidate-master/Scripts/jquery.validate.js'/>" type="text/javascript"></script>
       <script src="<c:url value='/resources/lte/plugins/TwitterBootstrapjQueryValidate-master/Scripts/jquery.validate.js'/>" type="text/javascript"></script>
     <!-- SlimScroll -->
     <script src="<c:url value='/resources/lte/plugins/slimScroll/jquery.slimscroll.min.js'/>" type="text/javascript"></script>
    <!-- FastClick -->
    <script src="<c:url value='/resources/lte/plugins/fastclick/fastclick.min.js'/>" type="text/javascript"></script>
    <!-- layer -->
    <script src="<c:url value='/resources/lte/plugins/layer/layer.js'/>" type="text/javascript"></script>
    <!-- datetimepicker -->
    <script src="<c:url value='/resources/lte/plugins/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js'/>" type="text/javascript"></script>
     <script src="<c:url value='/resources/lte/plugins/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js'/>" charset="UTF-8" type="text/javascript"></script>
    
    <script src="<c:url value='/resources/lte/plugins/bootstrap-jquery-plugin-master/src/jquery.dialog.js'/>" type="text/javascript"></script>
    <script src="<c:url value='/resources/lte/plugins/bootstrap-jquery-plugin-master/src/jquery.messager.js'/>" type="text/javascript"></script>
    <script src="<c:url value='/resources/lte/js/app.js'/>" type="text/javascript"></script>
   
    <script>
     
    var basePath ="<c:url value='/'/>";
      $(function () {
    	  
    	  layer.config({
              skin:'layer-ext-espresso',
              extend:'skin/espresso/style.css'
          });
        $('input').iCheck({
          checkboxClass: 'icheckbox_square-blue',
          radioClass: 'iradio_square-blue',
          increaseArea: '20%' // optional
        });
      });
      
      var menuId = "${menuId}";
      
      $(function(){
    	  
    	  if($.trim(menuId) !='') {
    		  $('#treeview_' + menuId).addClass('active');
    		  $('#treeview_' + menuId).next('.treeview-menu').addClass('menu-open');
    		  $('#treeview_' + menuId).next('.treeview-menu').show(1000);
    		  
    	  }else {
    		  $('#treeview').eq(0).addClass('active');
    		  $('#treeview').eq(0).next('.treeview-menu').addClass('menu-open');
    		  $('#treeview').eq(0).next('.treeview-menu').show(1000);
    	  }
      });
    </script>