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
/****
 * 权限资源管理
 * ***/

var ResourceManager = {
		zTree:null,
		addResourceValidate:null,
		editResourceValidate:null,
		saveSecondResourceValidate:null,
		editSecondResourceValidate:null,
		init:function(){
			
			ResourceManager.ctrl.initEvent();
			ResourceManager.ctrl.initFormValidate();
			ResourceManager.ctrl.dialog.initDialog();
			ResourceManager.ctrl.loadResourceList();
		},
		ctrl:{
			
			initEvent:function(){
				//新增系统资源
				$("#_btnNewResource").on('click',function(){
					$("#_addResourceForm")[0].reset();
					var zTree = $.fn.zTree.getZTreeObj("resourceTree");
					var nodes = zTree.getCheckedNodes(true);
					if(nodes.length == 0 ) {
						$("#saveResourcewrap").dialog("open");
					} else {
						var treeNode = nodes[0];
						$("#_addSecondResourceForm")[0].reset();
		        		$("#secondType").val(parseInt(treeNode.level) + 1);
		        		$("#secondSysType").val(treeNode.sysType);
		        		$("#secondParentId").val(treeNode.resourceId);
		        		$("#secondsysParentName").val(treeNode.resourceName);
		        		$("#saveSecondResourcewrap").dialog('open');
					}
					
				
					return false;
				});
				
				//修改系统资源
				$("#_btnEditResource").on('click',function(){
					
					var zTree = $.fn.zTree.getZTreeObj("resourceTree");
					var nodes = zTree.getCheckedNodes(true);
					if(nodes.length == 0 ) {
						layer.msg("请选择要修改的权限资源!",{icon: 8});
						return false;
					}
					var treeNode = nodes[0];
					
					  if(treeNode.level == 0) {
			        	   $("#editResourceId").val(treeNode.resourceId);
			        	   $("#editresourceName").val(treeNode.resourceName);
			        	   $("#editresourceUrl").val(treeNode.resourceUrl);
			        	   $("#editpermission").val(treeNode.permission);
			        	   $("#editicon").val(treeNode.icon);
			        	   $("#editType").val(parseInt(treeNode.level) + 1);
			        	   $("#editsysType").val(treeNode.sysType);
			        	   $("#editdescription").val(treeNode.description);
			        	   
			        	   if(treeNode.state == 0){
								$("#editstate1").iCheck('uncheck');
								$("#editstate0").iCheck('check');
							} else {
								$("#editstate1").iCheck('check');
								$("#editstate0").iCheck('uncheck');
							}
			        	   $("#editResourcewrap").dialog('open');
			        	   
			           } else {
			        	   $("#_editSecondResourceForm")[0].reset();
			        	   $("#editSecondResourceId").val(treeNode.resourceId);
			        	   
			        	   $("#editSecondresourceName").val(treeNode.resourceName);
			        	   $("#editSecondresourceUrl").val(treeNode.resourceUrl);
			        	   $("#editSecondpermission").val(treeNode.permission);
			        	   $("#editSecondicon").val(treeNode.icon);
			        	   $("#editSecondsysType").val(treeNode.sysType);
			        	   $("#editSecondParentId").val(treeNode.parentId);
			        	   $("#editSecondType").val(parseInt(treeNode.level) + 1);
			        	   $("#editSeconddescription").val(treeNode.description);
			        	   if(treeNode.state == 0){
								$("#editSecondstate1").iCheck('uncheck');
								$("#editSecondstate0").iCheck('check');
							} else {
								$("#editSecondstate1").iCheck('check');
								$("#editSecondstate0").iCheck('uncheck');
							}
			        	   
			        	   $("#editSecondResourcewrap").dialog("open");
			        	   
			           }
					return false;
				});
				
				//删除操作
				$("#_btnDeleteResource").on('click',function(){
					
					var zTree = $.fn.zTree.getZTreeObj("resourceTree");
					var nodes = zTree.getCheckedNodes(true);
					if(nodes.length == 0 ) {
						layer.msg("请选择想要删除的权限资源!",{icon: 8});
						return false;
					}
					var checkNode = nodes[0];
					layer.confirm('确认删除此权限资源吗？', {icon: 4}, function(index){
           			 layer.close(index);
           			 ResourceManager.ctrl.handler.deleteResource({"id":checkNode.resourceId});
           		 });
					
					return false;
				});
				
				
				
			},
			
			initFormValidate:function(){
				
				  Validator.init();
				  ResourceManager.addResourceValidate = $("#_addResourceForm").validate({
					rules:{
						resourceName:{
							required:true,
							minlength:3,
							maxlength:32
						},
						resourceUrl:{
							maxlength:255
						},
						permission:{
							required:true,
							minlength:3,
							maxlength:255
						},
						icon:{
							maxlength:32
						},
						sysType:{
							required:true,
							maxlength:32,
							minlength:3
						},
						description:{
							maxlength:150
						}
					},messages:{
						resourceName:{
							required:'资源名称不能为空',
							minlength:'资源名称不能小于3个字符',
							maxlength:'资源名称不能大于32个字符'
						},
						resourceUrl:{
							maxlength:'权限资源url不能大于255个字符'
						},
						permission:{
							required:'权限码不能为空',
							minlength:'权限码不能少于3个字符',
							maxlength:'权限码不能大于255个字符'
						},icon:{
							maxlength:'icon不能大于32个字符'
						},
						sysType:{
							required:'系统类型不能为空',
							maxlength:'系统类型不能大于32个字符',
							minlength:'系统类型不能小于3个字符'
						},
						description:{
							maxlength:'描述不能大于150个字符'
						}
						
					}
				});
				  //
				  ResourceManager.saveSecondResourceValidate = $("#_addSecondResourceForm").validate({
					  rules:{
						  resourceName:{
							  required:true,
							  minlength:3,
							  maxlength:32
						  },
						  resourceUrl:{
							  maxlength:255
						  },
						  permission:{
							  required:true,
							  minlength:3,
							  maxlength:255
						  },
						  icon:{
							  maxlength:32
						  },
						  sysType:{
							  required:true,
							  maxlength:32,
							  minlength:3
						  },
						  description:{
							  maxlength:150
						  }
					  },messages:{
						  resourceName:{
							  required:'资源名称不能为空',
							  minlength:'资源名称不能小于3个字符',
							  maxlength:'资源名称不能大于32个字符'
						  },
						  resourceUrl:{
							  maxlength:'权限资源url不能大于255个字符'
						  },
						  permission:{
							  required:'权限码不能为空',
							  minlength:'权限码不能少于3个字符',
							  maxlength:'权限码不能大于255个字符'
						  },icon:{
							  maxlength:'icon不能大于32个字符'
						  },
						  sysType:{
							  required:'系统类型不能为空',
							  maxlength:'系统类型不能大于32个字符',
							  minlength:'系统类型不能小于3个字符'
						  },
						  description:{
							  maxlength:'描述不能大于150个字符'
						  }
						  
					  }
				  });
				  //
				  ResourceManager.editResourceValidate = $("#_editResourceForm").validate({
					  rules:{
						  resourceName:{
							  required:true,
							  minlength:3,
							  maxlength:32
						  },
						  resourceUrl:{
							  maxlength:255
						  },
						  permission:{
							  required:true,
							  minlength:3,
							  maxlength:255
						  },
						  icon:{
							  maxlength:32
						  },
						  sysType:{
							  required:true,
							  maxlength:32,
							  minlength:3
						  },
						  description:{
							  maxlength:150
						  }
					  },messages:{
						  resourceName:{
							  required:'资源名称不能为空',
							  minlength:'资源名称不能小于3个字符',
							  maxlength:'资源名称不能大于32个字符'
						  },
						  resourceUrl:{
							  maxlength:'权限资源url不能大于255个字符'
						  },
						  permission:{
							  required:'权限码不能为空',
							  minlength:'权限码不能少于3个字符',
							  maxlength:'权限码不能大于255个字符'
						  },icon:{
							  maxlength:'icon不能大于32个字符'
						  },
						  sysType:{
							  required:'系统类型不能为空',
							  maxlength:'系统类型不能大于32个字符',
							  minlength:'系统类型不能小于3个字符'
						  },
						  description:{
							  maxlength:'描述不能大于150个字符'
						  }
						  
					  }
				  });
				  ResourceManager.editSecondResourceValidate = $("#_editSecondResourceForm").validate({
					  rules:{
						  resourceName:{
							  required:true,
							  minlength:3,
							  maxlength:32
						  },
						  resourceUrl:{
							  maxlength:255
						  },
						  permission:{
							  required:true,
							  minlength:3,
							  maxlength:255
						  },
						  icon:{
							  maxlength:32
						  },
						  sysType:{
							  required:true,
							  maxlength:32,
							  minlength:3
						  },
						  description:{
							  maxlength:150
						  }
					  },messages:{
						  resourceName:{
							  required:'资源名称不能为空',
							  minlength:'资源名称不能小于3个字符',
							  maxlength:'资源名称不能大于32个字符'
						  },
						  resourceUrl:{
							  maxlength:'权限资源url不能大于255个字符'
						  },
						  permission:{
							  required:'权限码不能为空',
							  minlength:'权限码不能少于3个字符',
							  maxlength:'权限码不能大于255个字符'
						  },icon:{
							  maxlength:'icon不能大于32个字符'
						  },
						  sysType:{
							  required:'系统类型不能为空',
							  maxlength:'系统类型不能大于32个字符',
							  minlength:'系统类型不能小于3个字符'
						  },
						  description:{
							  maxlength:'描述不能大于150个字符'
						  }
						  
					  }
				  });
			},
			
			dialog:{
				initDialog:function(){
					$("#saveResourcewrap").dialog({
				          title:    "新增权限资源",
				          'class':  "mydialog",
				          autoOpen: false,
				          backdrop: "static",
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
				                	if( ResourceManager.addResourceValidate.form() == true) {
				                		 layer.confirm('确认新增此权限资源吗？', {icon: 4}, function(index){
				                			 layer.close(index);
				                			 ResourceManager.ctrl.handler.addResource($("#_addResourceForm").serialize(),$("#saveResourcewrap"));
				                		 });
				                		
				                	}
				                }
				            }
				          ]
				      });
					$("#saveSecondResourcewrap").dialog({
						title:    "新增权限资源",
						'class':  "mydialog",
						autoOpen: false,
						backdrop: "static",
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
								if(  ResourceManager.saveSecondResourceValidate.form() == true) {
									layer.confirm('确认新增此权限资源吗？', {icon: 4}, function(index){
										layer.close(index);
										ResourceManager.ctrl.handler.addResource($("#_addSecondResourceForm").serialize(),$("#saveSecondResourcewrap"));
									});
									
								}
							}
						}
						]
					});
					
					$("#editResourcewrap").dialog({
				          title:    "修改权限资源",
				          'class':  "mydialog",
				          autoOpen: false,
				          backdrop: "static",
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
				                	if( ResourceManager.editResourceValidate.form() == true) {
				                		 layer.confirm('确认保存此权限资源吗？', {icon: 4}, function(index){
				                			 layer.close(index);
				                			 ResourceManager.ctrl.handler.updateResource($('#_editResourceForm').serialize(),$("#editResourcewrap"));
				                		 });
				                		
				                	}
				                }
				            }
				          ]
				      });
					//非一级
					$("#editSecondResourcewrap").dialog({
						title:    "修改权限资源",
						'class':  "mydialog",
						autoOpen: false,
						backdrop: "static",
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
								if( ResourceManager.editSecondResourceValidate.form() == true) {
									layer.confirm('确认保存此权限资源吗？', {icon: 4}, function(index){
										layer.close(index);
										ResourceManager.ctrl.handler.updateResource($('#_editSecondResourceForm').serialize(),$("#editSecondResourcewrap"));
									});
									
								}
							}
						}
						]
					});
					
				}
				
			},
			
			handler:{
				
				
				/***
				 * 
				 * */
				updateResource:function(formDat,dialogEle) {
					//开启进度
					layer.load(1);
					$.ajax({
						url:basePath +'admin/resource/updateResource.do',
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
								   dialogEle.dialog('close');
								   layer.msg(data.message,{icon: 1}, function(){
									 window.location.reload();
									});
							} else {
								layer.msg(data.message,{icon: 8});
							}
							
						}
					});
					
				},
				/******添加权限资源******/
				addResource:function(formDat,dialogEle){
					
					//开启进度
					layer.load(1);
					$.ajax({
						url:basePath +'admin/resource/addResource.do',
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
								dialogEle.dialog("close");
								   layer.msg(data.message,{icon: 1}, function(){
									 window.location.reload();
									});
							} else {
								layer.msg(data.message,{icon: 8});
							}
							
						}
					});
				},
				/**删除权限资源**/
				deleteResource:function(formDat){
					
					//开启进度
					layer.load(1);
					$.ajax({
						url:basePath +'admin/resource/deleteResourceById.do',
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
				}
				
			},
			loadResourceList:function(){
				
				//开启进度
				layer.load(2);
				$.ajax({
					url:basePath +'admin/resource/findAllResource.do',
					cache:false,
					dataType:'json',
					type:'POST',
					error:function(XMLHttpRequest, textStatus, errorThrown){
						//关闭进度
						layer.closeAll('loading');
						layer.msg('获取权限资源列表失败,请重试!',{icon: 8});
					},
					success:function(data, textStatus, jqXHR) {
						//关闭进度
						layer.closeAll('loading');
						if(data.success == true) {
							 ResourceManager.ctrl.initzTree(data.result);
						} else {
							layer.msg(data.message,{icon: 8});
						}
						
					}
				});
			},
			
			
			/**初始化ztree***/
			initzTree:function(treeDat){
				var setting = {
			            check: {
			                enable: true,
			                chkStyle: "radio",
			                radioType:'all',
			                chkboxType: { "Y": "", "N": "" }
			            },
			            view: {
			                dblClickExpand: false,
			                showLine: true,
			                selectedMulti: false
			            },
			            data: {
			            	key:{
			            		name:"fullResourceName"
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
				
		           $.fn.zTree.init($("#resourceTree"), setting, treeDat);
		           ResourceManager.zTree = $.fn.zTree.getZTreeObj("resourceTree");
		           //全部展开
		           ResourceManager.zTree.expandAll(true);
			}
			
			
			
		}
};
$(function(){
	
	ResourceManager.init();
});