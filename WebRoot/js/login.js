$(document).ready(function() {
	//使用 Ajax 的方式 判断登录  
	$("#btn_login").click(function() {
		if(!check(login)){
			return;
		}
		var url = 'user/checkLogin.action';

		//获取表单值，并以json的数据形式保存到params中  
		var params = {
			"username" : $("#username").val(),
			"password" : $("#password").val(),
		};
		//使用$.post方式      
		$.post(url, //服务器要接受的url                   
		params, //传递的参数                        
		function cbf(data) { //服务器返回后执行的函数 参数 data保存的就是服务器发送到客户端的数据                    
			var member = eval("(" + data + ")"); //包数据解析为json 格式    
			alert(member.name);
			//alert(member.admin);
			if(member.flag == "true"){
				if(member.admin == "yes"){
				    window.location.href="Admin/index.jsp";//管理员界面
				}
				else{
					window.location.href="User/index.jsp";//普通用户
				}
				
			}
	
		}, 'json' //数据传递的类型  json 
		).fail(function test(jqXHR, textStatus, errorThrown) {
			alert("error");
			alert(textStatus + "\n" + errorThrown);
		});

	});

});