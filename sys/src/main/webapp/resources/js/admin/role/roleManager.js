var Validator = {
		
		init:function(){
			$.validator.setDefaults({
			    highlight: function (element, errorClass, validClass) {
			        var $element;
			        if (element.type === 'radio') {
			            $element = this.findByName(element.name);
			        } else {
			            $element = $(element);
			        }
			        $element.addClass(errorClass).removeClass(validClass);
			        // add the bootstrap error class
			        $element.closest("div.form-group").addClass("has-error");
			    },
			    unhighlight: function (element, errorClass, validClass) {
			        var $element;
			        if (element.type === 'radio') {
			            $element = this.findByName(element.name);
			        } else {
			            $element = $(element);
			        }
			        $element.removeClass(errorClass).addClass(validClass);
			        // remove the bootstrap error class
			        if ($element.closest("div.form-group").find(".has-error").length == 0) {
			            // Only remove the class if there are no other errors
			            $element.closest("div.form-group").removeClass("has-error");
			        }
			    }
			});
			
			//自定义校验
			
			/**手机号码*/
			$.validator.addMethod("isMobile", function(value, element) {  
			    var length = value.length;  
			    var regPhone = /^1([3578]\d|4[57])\d{8}$/;  
			    return this.optional(element) || ( length == 11 && regPhone.test( value ) );    
			}, "请正确填写您的手机号码"); 
			
			/**邮编**/
			$.validator.addMethod("isZipCode", function(value, element) {    
			    var tel = /^[0-9]{6}$/;  
			    return this.optional(element) || (tel.test(value));  
			}, "请正确填写您的邮政编码");  
			
		}
};
/***
 * 角色管理模块
 */
var RoleManager = {
		 addRoleValidator:null,
		 editRoleValidator:null,
		 searchFormValidate:null,
		 resourceSetting:null,
		init:function(){
			Validator.init();//初始化全局
			RoleManager.ctrl.initZtree();//初始化事件监听
			RoleManager.ctrl.initEvent();//初始化事件监听
			RoleManager.ctrl.initFormValidate();//初始化表单验证
			RoleManager.ctrl.initDateTimePicker();//初始化日期选择器
			RoleManager.ctrl.dialog.initDialog();//初始化弹出框
		},
		ctrl:{
			/**初始化ztree*/
			initZtree:function(){
				RoleManager.resourceSetting = {
			            check: {
			                enable: true
			               // chkboxType:{ "Y" : "", "N" : ""}
			            },
			            view: {
			                addHoverDom: null,
			                removeHoverDom:null,
			                dblClickExpand: false,
			                showLine: true,
			                selectedMulti: false
			            },
			            data: {
			            	key:{
			            		name:"resourceName"
			            	},
			                simpleData: {
			                    enable:true,
			                    idKey: "resourceId",
			                    pIdKey: "parentId",
			                    rootPId: ""
			                }
			            },
			            callback: {
			            	onClick:function(){
			            		
			            		return false;
			            	}
			            }
			        };
		         
			},
			button:{
				
				openSaveDialog:function(){
					
					
				}
			},
			pageFunction:function(pageSize,pageNum){
				
				if(RoleManager.searchFormValidate.form() == true) {
					$("#_pageNum").val(pageNum);
					$("#_pageSize").val(pageSize);
					$("#_searchForm").trigger("submit");
					return true;
				}
				return false;
				
			},
			initDateTimePicker:function(){
				  $('#startTime').datetimepicker({
	   			        format: 'yyyy-mm-dd hh:ii:ss',
	   			     language:'zh-CN'
	   			    });
	   			 $('#endTime').datetimepicker({
				        format: 'yyyy-mm-dd hh:ii:ss',
				     language:'zh-CN'
				    });
			},
			initEvent:function(){
				//新建角色按钮
				$("#_btnNewRole").on('click',function(){
					 $("#saveRolewrap").dialog("open");
					return false;
				});
				//修改角色按钮
				$('.btn_editRole').on('click',function(){
					var va = $(this).attr("attVal");
					RoleManager.ctrl.handler.loadRoleInfoByRoleId(va);
					return false;
				});
				//角色授权
				$('.btn_settingResource').on('click',function(){
					var va = $(this).attr("attVal");
					RoleManager.ctrl.handler.findResourceListByRoleId(va);
					return false;
				});
				/*****删除角色按钮*****/
				$('.btn_deleteRole').on('click',function(){
					var va = $(this).attr("attVal");
					 layer.confirm('确认删除此角色吗？', {icon: 4}, function(index){
            			 layer.close(index);
            			 RoleManager.ctrl.handler.deleteUserInfoByRoleId(va);
            		 });
					return false;
				});
				
				$("#_searchRole").on('click',function(){
					if(RoleManager.searchFormValidate.form() == true) {
						$("#_searchForm").trigger("submit");
						return true;
					}
					
					
					return false;
				});
				
			},
			/**初始化表单校验**/
			initFormValidate:function(){
				//新增角色
				RoleManager.addRoleValidator =  $('#_addRoleForm').validate({
								rules:{
									roleName:{
										required:true,
										maxlength:32,
										minlength:3
									},
									description:{
										maxlength:150,
									}
								},
								messages:{
									roleName:{
										required:'请输入角色名称',
										maxlength:'角色名称不能大于32个字符',
										minlength:'角色名称不能小于3个字符'
									},
									description:{
										maxlength:'角色描述不能大于150个字符',
									}
								}
						});
				
				//修改角色
				RoleManager.editRoleValidator =  $('#_editRoleForm').validate({
					rules:{
						roleName:{
							required:true,
							maxlength:32,
							minlength:3
						},
						description:{
							maxlength:150,
						}
					},
					messages:{
						roleName:{
							required:'请输入角色名称',
							maxlength:'角色名称不能大于32个字符',
							minlength:'角色名称不能小于3个字符'
						},
						description:{
							maxlength:'角色描述不能大于150个字符',
						}
					}
				});
				
				
				
				RoleManager.searchFormValidate =  $("#_searchForm").validate({
					 rules:{
						 roleName:{
							 maxlength:32
						 }
						
					 },
					 messages:{
						 roleName:{
							 maxlength:'角色名称最多32个字符'
						 }
					 }
				 });
				
			},
			dialog:{
				
				initDialog:function(){
					
				    $("#saveRolewrap").dialog({
				          title:    "新增角色",
				          'class':  "mydialog",
				          backdrop: "static",
				          autoOpen: false,
				          onClose: function() { 
				        	  $(this).dialog("close"); 
				        	  },
				        	  buttons: [{
				                text: "取消",
				                'class': "btn-primary",
				                click: function() {
				                	$(this).dialog("close"); 
				                }
				            },
				            {
				                text: "新增",
				                'class': "btn-success",
				                click: function() {
				                	if(RoleManager.addRoleValidator.form() == true) {
				                		 layer.confirm('确认新增此角色吗？', {icon: 4}, function(index){
				                			 layer.close(index);
				                			 RoleManager.ctrl.handler.addUser();
				                		 });
				                		
				                	}
				                }
				            }
				          ]
				      });
				    $("#editRolewrap").dialog({
				    	title:    "修改角色",
				    	'class':  "mydialog",
				    	 backdrop: "static",
				    	autoOpen: false,
				    	onClose: function() { 
				    		$(this).dialog("close"); 
				    	},
				    	buttons: [{
				    		text: "取消",
				    		'class': "btn-primary",
				    		click: function() {
				    			$(this).dialog("close"); 
				    		}
				    	},
				    	{
				    		text: "保存",
				    		'class': "btn-success",
				    		click: function() {
				    			if(RoleManager.addRoleValidator.form() == true) {
			                		 layer.confirm('确认修改此角色吗？', {icon: 4}, function(index){
			                			 layer.close(index);
			                			 RoleManager.ctrl.handler.updateUser();
			                		 });
			                		
			                	}
				    		}
				    	}
				    	]
				    });
				    $("#settingResourcewrap").dialog({
				    	title:    "角色授权",
				    	'class':  "mydialog",
				    	backdrop: "static",
				    	autoOpen: false,
				    	onClose: function() { 
				    		$(this).dialog("close"); 
				    	},
				    	buttons: [{
				    		text: "取消",
				    		'class': "btn-primary",
				    		click: function() {
				    			$(this).dialog("close"); 
				    		}
				    	},
				    	{
				    		text: "保存",
				    		'class': "btn-success",
				    		click: function() {
				    			if(RoleManager.addRoleValidator.form() == true) {
				    				layer.confirm('确认为此角色设置授权吗？', {icon: 4}, function(index){
				    					layer.close(index);
				    					 RoleManager.ctrl.handler.settingResource();
				    				});
				    				
				    			}
				    		}
				    	}
				    	]
				    });
				}
			},
			handler:{
				
				settingResource:function(){
					
					var checkNodeList =  $.fn.zTree.getZTreeObj("resourceTree").getCheckedNodes(true);
					var resourceIdList =[];
					if(checkNodeList.length >0) {
						
						$.each(checkNodeList,function(ind,va){
							resourceIdList.push(va.resourceId);
						});
					}
					
					var resourceIdStr = resourceIdList.join(",");
					var formDat = {"roleId":$("#_settingRoleId").val(),"resourceIdStr":resourceIdStr};
					$.ajax({
						url:basePath +'admin/resource/settingResourceByRoleId.do',
						cache:false,
						data:formDat,
						dataType:'json',
						type:'POST',
						error:function(XMLHttpRequest, textStatus, errorThrown){
							//关闭进度
							layer.closeAll('loading');
							layer.msg('提交失败,请重试!',{icon: 8});
						},
						success:function(data, textStatus, jqXHR) {
							//关闭进度
							layer.closeAll('loading');
							if(data.success == true) {
								$("#settingResourcewrap").dialog("close");
								 layer.msg(data.message,{icon: 1}, function(){
									});
							} else {
								layer.msg(data.message,{icon: 8});
							}
							
						}
					});
				},
				updateUser:function(){
					if($('#editroleId').val() =="") {
						layer.msg("此角色不存在!",{icon: 8});
						return false;
					}
					
					var formDat = $("#_editRoleForm").serialize();
					//开启进度
					layer.load(1);
					$.ajax({
						url:basePath +'admin/role/updateRole.do',
						cache:false,
						data:formDat,
						dataType:'json',
						type:'POST',
						error:function(XMLHttpRequest, textStatus, errorThrown){
							//关闭进度
							layer.closeAll('loading');
							layer.msg('提交失败,请重试!',{icon: 8});
						},
						success:function(data, textStatus, jqXHR) {
							//关闭进度
							layer.closeAll('loading');
							if(data.success == true) {
								 $("#editRolewrap").dialog("close");
								   layer.msg(data.message,{icon: 1}, function(){
									 window.location.reload();
									});
							} else {
								layer.msg(data.message,{icon: 8});
							}
							
						}
					});
					
					
				},
				addUser:function(){
					var formDat = $("#_addRoleForm").serialize();
					//开启进度
					layer.load(1);
					$.ajax({
						url:basePath +'admin/role/addRole.do',
						cache:false,
						data:formDat,
						dataType:'json',
						type:'POST',
						error:function(XMLHttpRequest, textStatus, errorThrown){
							//关闭进度
							layer.closeAll('loading');
							layer.msg('提交失败,请重试!',{icon: 8});
						},
						success:function(data, textStatus, jqXHR) {
							//关闭进度
							layer.closeAll('loading');
							if(data.success == true) {
								 $("#saveRolewrap").dialog("close");
								   layer.msg(data.message,{icon: 1}, function(){
									 window.location.reload();
									});
							} else {
								layer.msg(data.message,{icon: 8});
							}
							
						}
					});
				},
				/**根据角色id获取角色信息**/
				loadRoleInfoByRoleId:function(roleId){
					
					if(roleId == ""){
						layer.msg('此角色不存在!',{icon: 8});
						return false;
					}
					var formDat = {"roleId":roleId};
					
					$.ajax({
						url:basePath +'admin/role/findRoleByRoleId.do',
						cache:false,
						data:formDat,
						dataType:'json',
						type:'POST',
						error:function(XMLHttpRequest, textStatus, errorThrown){
							//关闭进度
							layer.closeAll('loading');
							layer.msg('提交失败,请重试!',{icon: 8});
						},
						success:function(data, textStatus, jqXHR) {
							//关闭进度
							layer.closeAll('loading');
							if(data.success == true) {
									RoleManager.ctrl.handler.putRoleInfo2Form(data.result);
							} else {
								layer.msg("加载失败",{icon: 8});
							}
							
						}
					});
				},
				
				//根据角色id查询所拥有的权限资源集合
				findResourceListByRoleId:function(roleId){
					
					if(roleId == ""){
						layer.msg('此角色不存在!',{icon: 8});
						return false;
					}
					var formDat = {"roleId":roleId};
					$("#_settingRoleId").val(roleId);
					$.ajax({
						url:basePath +'admin/resource/findResourceByRoleId.do',
						cache:false,
						data:formDat,
						dataType:'json',
						type:'POST',
						error:function(XMLHttpRequest, textStatus, errorThrown){
							//关闭进度
							layer.closeAll('loading');
							layer.msg('提交失败,请重试!',{icon: 8});
						},
						success:function(data, textStatus, jqXHR) {
							//关闭进度
							layer.closeAll('loading');
							if(data.success == true) {
								RoleManager.ctrl.handler.rend2Tree(data.result);
							} else {
								layer.msg("加载失败",{icon: 8});
							}
							
						}
					});
				},
				
				rend2Tree:function(result){
					
					if(result ==null || result.length == 0) {
						layer.msg("权限资源列表为空,请添加权限资源再来设置吧!",{icon: 8});
						return false;
					}
					
					 $.fn.zTree.init($("#resourceTree"), RoleManager.resourceSetting, result);
					 //全部展开
			          $.fn.zTree.getZTreeObj("resourceTree").expandAll(true);
			          $("#settingResourcewrap").dialog('open');
					
				},
				/**删除用户**/
				deleteUserInfoByRoleId:function(roleId){
					var formDat ={"roleId":roleId};
					//开启进度
					layer.load(1);
					$.ajax({
						url:basePath +'admin/role/deleteRoleByRoleId.do',
						cache:false,
						data:formDat,
						dataType:'json',
						type:'POST',
						error:function(XMLHttpRequest, textStatus, errorThrown){
							//关闭进度
							layer.closeAll('loading');
							layer.msg('提交失败,请重试!',{icon: 8});
						},
						success:function(data, textStatus, jqXHR) {
							//关闭进度
							layer.closeAll('loading');
							if(data.success == true) {
								   layer.msg(data.message,{icon: 1}, function(){
									 window.location.reload();
									});
							} else {
								layer.msg(data.message,{icon: 8});
							}
							
						}
					});
					
				},
				putRoleInfo2Form:function(role){
					if(role == null) {
						layer.msg('此角色不存在!',{icon: 8});
						return false;
					}
					$('#editroleId').val(role.roleId);
					$('#editroleName').val(role.roleName);
					$('#editdescription').val(role.description);
					if(role.state == 0){
						$("#editstate1").iCheck('uncheck');
						$("#editstate0").iCheck('check');
					} else {
						$("#editstate1").iCheck('check');
						$("#editstate0").iCheck('uncheck');
					}
					$('#editRolewrap').dialog('open');
				}
				
			}
			
		}
};

$(function(){
	RoleManager.init();
});