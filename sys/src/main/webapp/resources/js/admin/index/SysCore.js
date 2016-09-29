/***
 * @author gaoyuandong
 * 后台管理系统核心模块
 */
var SysCore = {
		//相关配置信息
		config:{
			
		},
		/***
		 ** 初始化
		***/
		init:function(){
			
			
		},
		/******控制操作*******/
		ctrl:{
			
			
			/***
			 * 加载主内容
			 */
			loadMainContent:function(url,method,dat,element){
				$.ajax({
              	   url:url,
              	   type:method,
              	   data:dat,
              	   dataType:'html',
              	   success:function(data){
              		 element.empty();
              		 element.html(data);
              	   },
              	   error:function(){
              		   
              	   }
              	});
			}
		}
		
};

var LeftMenu = {
	
	
	  init:function(){
		  
		  LeftMenu.ctrl.initEvent();//初始化事件监听
		 // SysCore.ctrl.loadMainContent(path +"user/index.do", "GET", "", $(".content-wrapper"))
	  },
	  ctrl:{
		  
		  //初始化单机菜单事件
		  initEvent:function(){
			 
			  
		  }
		  
	  }
};


var HeadMenu = {
	
	 init:function(){
		 
		 
	 },
	 ctrl:{
		 
		  
	 }
};
/***文档加载完毕执行**/
$(function(){
	
	//初始化系统核心控制模块
	SysCore.init();
	LeftMenu.init();// 初始化左侧菜单
});