/***
 * 后台用户管理模块
 */

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
var UserManager = {
		saveFormValidate:null,
		editFormValidate:null,
		searchFormValidate:null,
		//初始化
		init:function(){
			UserManager.ctrl.initEvent();
			UserManager.ctrl.initDateTimePicker();
			UserManager.ctrl.dialog.init.initSaveUserDialog();
			UserManager.ctrl.dialog.init.initEditDialog();
			UserManager.ctrl.dialog.init.initSettingRoleDialog();
			UserManager.ctrl.initValidate();
			
			
		},
		ctrl:{
			
			formatterDate:function(){
				
			},
			pageFunction:function(pageSize,pageNum) {
				if(UserManager.searchFormValidate.form() == true){
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
				$(".btn_updateUser").bind('click',function(){
					
					var va = $(this).attr("attVal");
					UserManager.ctrl.handler.loadUserInfoByUserId(va);
					return false;
				});
				
				$(".btn_deleteUser").bind('click',function(){
					
					var va = $(this).attr("attVal");
					 layer.confirm('确认要删除此用户吗？', {icon: 4}, function(index){
              		    layer.close(index);
              		  UserManager.ctrl.handler.deleteUserInfoByUserId(va);
              		});
					return false;
				});
				//设置角色
				$(".btn_authorUser").bind('click',function(){
					
					var va = $(this).attr("attVal");
					UserManager.ctrl.handler.findRoleListByUserId(va);
					return false;
				});
				
				/**搜索*/
				$("#_searchUser").bind("click",function(){
					if(UserManager.searchFormValidate.form() == true){
						$("#_pageNum").val(1);
						return true;
					}
					return false;
				});
			},
			/**初始化表单验证***/
			 initValidate:function(){
				 //表单验证全局初始化
				 Validator.init();
				 //新建用户表单验证初始化
				 UserManager.saveFormValidate = $("#_addUserForm").validate({
					rules:{
						nickName:{
							required:true,
							maxlength:32,
							minlength:4,
							remote:{
			                    url: basePath + "admin/user/checkNickName.do",
			                    type: "post",
			                    dataType: 'json',
			                    data: {
			                        
			                    	}
								}
						},
						userName:{
							required:true,
							maxlength:32,
							minlength:4,
							remote:{
			                    url: basePath + "admin/user/checkUserName.do",
			                    type: "post",
			                    dataType: 'json',
			                    data: {
			                        
			                    	}
								}
						},
						password:{
							required:true,
							maxlength:32,
							minlength:4,
						},
						comfromPassword:{
							required:true,
							equalTo:'#password'
						},
						email:{
							required:true,
							email:true,
							remote:{
			                    url: basePath + "admin/user/checkEmail.do",
			                    type: "post",
			                    dataType: 'json',
			                    data: {
			                        
			                    	}
								}
						},
						mobile:{
							required:true,
							isMobile:true,
							remote:{
			                    url: basePath + "admin/user/checkMobile.do",
			                    type: "post",
			                    dataType: 'json',
			                    data: {
			                        
			                    	}
								}
						},
						age:{
							digits:true,
							max:199,
							min:0
						},
						address:{
							maxlength:150
						}
					},
					messages:{
						nickName:{
							required:'昵称不能为空!',
							maxlength:'昵称最多32个字符',
							minlength:'昵称最少4个字符',
							remote:'此昵称已经存在,亲请换个吧'
							
						},
						userName:{
							required:'用户名不能为空',
							maxlength:'用户名最多32个字符',
							minlength:'用户名最少4个字符',
							remote:'用户名已存在,亲请换个吧!'
						},
						password:{
							required:"密码不能为空!",
							maxlength:'密码不能大于32个字符',
							minlength:'密码不能小于4个字符',
						},
						comfromPassword:{
							required:'确认密码不能为空',
							equalTo:'两次密码不一致'
						},
						email:{
							required:'邮箱不能为空',
							email:'请输入正确格式的邮箱',
							remote:'邮箱已经存在,亲请换个吧!'
						},
						mobile:{
							required:'手机号码不能为空!',
							isMobile:'请正确填写您的手机号码',
							remote:'手机号码已经存在,亲请换个吧'
						},
						age:{
							digits:'请输入有效的年龄',
							max:'年龄最大值不能超过200',
							min:'年龄最小不能小于0'
						},
						address:{
							maxlength:'地址最多150个字符'
						}
					}
				});
				 
				 /**编辑用户信息表单校验**/
				 UserManager.editFormValidate = $("#_editUserForm").validate({
						rules:{
								nickName:{
								required:true,
								maxlength:32,
								minlength:4,
								remote:{
				                    url: basePath + "admin/user/checkNickName.do",
				                    type: "post",
				                    dataType: 'json',
				                    data: {
				                    	'userId':function(){
				                        	  return $("#edituserId").val();
				                          }
				                    	}
									}
							},
							 	userName:{
								required:true,
								maxlength:32,
								minlength:4,
								remote:{
				                    url: basePath + "admin/user/checkUserName.do",
				                    type: "post",
				                    dataType: 'json',
				                    data: {
				                          'userId':function(){
				                        	  return $("#edituserId").val();
				                          }
				                    	}
									}
							},
								password:{
								required:true,
								maxlength:32,
								minlength:4,
							},
								comfromPassword:{
								required:true,
								equalTo:'#editpassword'
							},
								email:{
								required:true,
								email:true,
								remote:{
				                    url: basePath + "admin/user/checkEmail.do",
				                    type: "post",
				                    dataType: 'json',
				                    data: {
				                    	'userId':function(){
				                        	  return $("#edituserId").val();
				                          }
				                    	}
									}
							},
								mobile:{
								required:true,
								isMobile:true,
								remote:{
				                    url: basePath + "admin/user/checkMobile.do",
				                    type: "post",
				                    dataType: 'json',
				                    data: {
				                    	'userId':function(){
				                        	  return $("#edituserId").val();
				                          }
				                    	}
									}
							},
								age:{
								digits:true,
								max:199,
								min:0
							},
								address:{
								maxlength:150
							}
						},
						messages:{
								nickName:{
								required:'昵称不能为空!',
								maxlength:'昵称最多32个字符',
								minlength:'昵称最少4个字符',
								remote:'此昵称已经存在,亲请换个吧'
								
							},
								userName:{
								required:'用户名不能为空',
								maxlength:'用户名最多32个字符',
								minlength:'用户名最少4个字符',
								remote:'用户名已存在,亲请换个吧!'
							},
								password:{
								required:"密码不能为空!",
								maxlength:'密码不能大于32个字符',
								minlength:'密码不能小于4个字符',
							},
								comfromPassword:{
								required:'确认密码不能为空',
								equalTo:'两次密码不一致'
							},
								email:{
								required:'邮箱不能为空',
								email:'请输入正确格式的邮箱',
								remote:'邮箱已经存在,亲请换个吧!'
							},
								mobile:{
								required:'手机号码不能为空!',
								isMobile:'请正确填写您的手机号码',
								remote:'手机号码已经存在,亲请换个吧'
							},
								age:{
								digits:'请输入有效的年龄',
								max:'年龄最大值不能超过200',
								min:'年龄最小不能小于0'
							},
								address:{
								maxlength:'地址最多150个字符'
							}
						}
					});
				 
				UserManager.searchFormValidate =  $("#_searchForm").validate({
					 rules:{
						 nickName:{
							 maxlength:32
						 },
						 userName:{
							 maxlength:32
						 },
						 mobile:{
							 isMobile:true
						 },
						 email:{
							 email:true
						 }
					 },
					 messages:{
						 nickName:{
							 maxlength:'昵称最多32个字符'
						 },
						 userName:{
							 maxlength:'用户名最多32个字符'
						 },
						 mobile:{
							 isMobile:'请输入有效的手机号码'
						 },
						 email:{
							 email:'请输入有效的邮箱'
						 }
					 }
				 });
				 
				 
			},
			button:{
			
				openSaveDialog:function(){
					//重置校验
					$("#_addUserForm")[0].reset();
					UserManager.saveFormValidate.resetForm();
					
					$("#saveuserwrap").dialog("open");
					return false;
				}
			},
			dialog:{
				
				init:{
					
					initSaveUserDialog:function(){
					     $("#saveuserwrap").dialog({
					          title:    "新增用户",
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
					                	if(UserManager.saveFormValidate.form() == true) {
					                		
					                		 layer.confirm('确认保存吗？', {icon: 4}, function(index){
					                 		    layer.close(index);
					                 		    UserManager.ctrl.handler.addUser();
					                 		});
					                	}
					                
					                	
					                }
					            }
					          ]
					      });
					},
					initEditDialog:function(){
					     $("#editUserwrap").dialog({
					          title:    "修改用户信息",
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
					                	if(UserManager.editFormValidate.form() == true) {
					                		
					                		 layer.confirm('确认修改此用户信息吗？', {icon: 4}, function(index){
					                 		    layer.close(index);
					                 		    UserManager.ctrl.handler.updateUser();
					                 		});
					                	}
					                
					                	
					                }
					            }
					          ]
					      });
					},
					initSettingRoleDialog:function(){
						
						$("#settingRolewrap").dialog({
					          title:    "设置角色",
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
					                		
					                		 layer.confirm('确认为此用户设置角色？', {icon: 4}, function(index){
					                 		    layer.close(index);
					                 		   UserManager.ctrl.handler.settingRoles();
					                 		});
					                }
					            }
					          ]
					      });
					}
				}
			},
			handler:{
				
				//设置角色
				settingRoles:function(){
					
					
					
					var roleIds = [];
					$.each($("input[name='roleState']"),function(ind,va){
						if($(va).prop("checked") == true) {
							roleIds.push($(va).val());
						} 
					});
					
					var roleIdStr = roleIds.join(",");
					var formDat = {"userId":$("#settingUserId").val(),"roleIdStr":roleIdStr};
					//开启进度
					layer.load(1);
					$.ajax({
						url:basePath +'admin/role/settingRole.do',
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
								 $("#settingRolewrap").dialog("close");
								   layer.msg(data.message,{icon: 1}, function(){
									});
							} else {
								layer.msg(data.message,{icon: 8});
							}
							
						}
					});
					
					
					return false;
					
				},
				/**新增用户**/
				addUser:function() {
						var formDat = $("#_addUserForm").serialize();
						//开启进度
						layer.load(1);
						$.ajax({
							url:basePath +'admin/user/addUser.do',
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
									 $("#saveuserwrap").dialog("close");
									   layer.msg(data.message,{icon: 1}, function(){
										 window.location.reload();
										});
								} else {
									layer.msg(data.message,{icon: 8});
								}
								
							}
						});
				},
				/**更新用户信息**/
				updateUser:function(){

					var formDat = $("#_editUserForm").serialize();
					//开启进度
					layer.load(1);
					$.ajax({
						url:basePath +'admin/user/updateUser.do',
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
								 $("#editUserwrap").dialog("close");
								   layer.msg(data.message,{icon: 1}, function(){
									 window.location.reload();
									});
							} else {
								layer.msg(data.message,{icon: 8});
							}
							
						}
					});
					return false;
				},
				
				/**通过用户id查询用户信息**/
				loadUserInfoByUserId:function(userId){
					
					if(userId == ""){
						layer.msg('此用户不存在!',{icon: 8});
						return false;
					}
					var formDat = {"userId":userId};
					$.ajax({
						url:basePath +'admin/user/findUserByUserId.do',
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
									UserManager.ctrl.handler.putUserInfo2Form(data.result);
									
							} else {
								layer.msg("加载失败",{icon: 8});
							}
							
						}
					});
					
					return false;
				},
				putUserInfo2Form:function(user){
					$("#_editUserForm")[0].reset();
					$("#edituserId").val(user.userId);
					$("#editnickName").val(user.nickName);
					$("#edituserName").val(user.userName);
					$("#editpassword").val(user.password);
					$("#editemail").val(user.email);
					$("#editmobile").val(user.mobile);
					$("#editage").val(user.age);
					$("#editaddress").val(user.address);
					if(user.sex == 0) {
						$("#editSex1").iCheck('uncheck');
						$("#editSex0").iCheck('check');
					} else {
						$("#editSex0").iCheck('uncheck');
						$("#editSex1").iCheck('check');
					}
					
					if(user.state == 0) {
						$("#editstate1").iCheck('uncheck');
						$("#editstate0").iCheck('check');
					} else {
						$("#editstate0").iCheck('uncheck');
						$("#editstate1").iCheck('check');
					}
					
					$("#editUserwrap").dialog('open');
					
					
				},
				/**删除用户**/
				deleteUserInfoByUserId:function(userId){
					var formDat ={"userId":userId};
					//开启进度
					layer.load(1);
					$.ajax({
						url:basePath +'admin/user/deleteUserByUserId.do',
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
				findRoleListByUserId:function(userId){
					var formDat ={"userId":userId};
					$("#settingUserId").val(userId);
					//开启进度
					layer.load(1);
					$.ajax({
						url:basePath +'admin/role/findRoleListByUserId.do',
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
								UserManager.ctrl.handler.rend2Table(data.result); 
							} else {
								layer.msg(data.message,{icon: 8});
							}
							
						}
					});
					
				},
				rend2Table:function(result){
					
					if(result == null || result.length <1) {
						layer.msg("角色列表为空,请添加角色再来设置吧!",{icon: 8});
						return false;
					}
					var userId = $("#settingUserId").val();
					$("#settingRolewrap").empty();
					var str = "<input type=\"hidden\" id=\"settingUserId\" value=\"\"/><table id=\"settingRoleTable\" class=\"table table-hover\"> <tr><th width=\"50\">编号</th><th>角色名称</th><th>角色状态</th><th>角色创建时间</th><th>角色修改时间</th></tr>";
					
					$.each(result,function(ind,da){
						
						var state =  da.state;
						var stateStr = "";
						if(state == 0) {
							stateStr = "有效";
						} else {
							stateStr = "无效";
						}
						if(da.checked == true) {
							
							str +="<tr><td><label><input type=\"checkbox\" name=\"roleState\" value=\""+da.roleId+"\" class=\"minimal\" checked> </label></td><td>"+da.roleName+"</td><td>"+stateStr+"</td><td>"+da.createTime+"</td><td>"+da.updateTime+"</td></tr>";
						} else {
							
							str +="<tr><td><label><input type=\"checkbox\" name=\"roleState\" value=\""+da.roleId+"\" class=\"minimal\"> </label></td><td>"+da.roleName+"</td><td>"+stateStr+"</td><td>"+da.createTime+"</td><td>"+da.updateTime+"</td></tr>";
						}
					});
					str +="</table>";
					$("#settingRolewrap").append(str);
					$("#settingUserId").val(userId);
					$("input[name='roleState']").iCheck({ 
						  labelHover : false, 
						  cursor : true, 
						  checkboxClass : 'icheckbox_square-blue', 
						  radioClass : 'iradio_square-blue', 
						  increaseArea : '20%' 
						}); 
					$("#settingRolewrap").dialog('open');
				}
				
			}
		}
};


$(function(){
	UserManager.init();
});

