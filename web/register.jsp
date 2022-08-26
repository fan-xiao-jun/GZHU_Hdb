<%@ page contentType="text/html; charset=gb2312" pageEncoding="UTF-8"%>

<html lang="en">
	<head>
        <meta charset="UTF-8">
        <meta name="Generator" content="EditPlus®">
        <meta name="Author" content="范晓君">
        <meta name="Keywords" content="">
        <meta name="Description" content="">
        <title>注册页面</title>
      
    </head>
	<style type="text/css">
        font {
            color: #3164af;
            font-size: 18px;
            font-weight: normal;
            padding: 0 10px;
        }
        #img1{
            width: 110px;
	        height: 40px;
        }
    </style>
	<body>
        <div class="col-md-8"
			    style="background: #fff; padding: 40px 80px; margin: 30px; border: 7px solid #ccc;">
            
            <center>
                <font>用户注册</font>USER REGISTER
				<span style="color: red">${errorMsg }</span>
		        <form method="post" action="${pageContext.request.contextPath }/register">
			        <table>
				        <tr>
					        <td>用户名</td>
					        <td><input type="text" required="required" name="username"></td>
				        </tr>
                        <tr>
					        <td>姓名</td>
					        <td><input type="text" required="required" name="name"></td>
				        </tr>
                        <tr>
					        <td>密码</td>
					        <td><input type="text" required="required" name="password"></td>
				        </tr>
                        <tr>
					        <td>确认密码</td>
					        <td><input type="text" required="required" name="confirmpwd"></td>
				        </tr>
                        <tr>
					        <td>年龄</td>
					        <td><input type="text" required="required" name="age"></td>
				        </tr>
                        <tr>
					        <td>性别</td>
					        <td>&emsp;
                                <input type="radio" name="sex" id="Radio1" value="male" checked="checked">男
                                &emsp;
                                <input type="radio" name="sex" id="Radio1" value="female">女
                            </td>
				        </tr>
                        <tr>
					        <td align="center" colspan="2">
                                <input type="submit" value="注册">
                                <input type="reset" value="重置">
                            </td>
				        </tr>
			        </table>
		        </form>
	        </center>
        </div>
		
	</body>

    <%--切换验证码的逻辑--%>
<script>

    document.getElementById("img1").onclick = function () {

        // alert(1);
        // js 事件中      ->   img
        // 谁触发 该事件 ，this 就指向谁
        // 通过向服务端发送 时间参数  伪造 不是同一个请求的假象， 欺骗tomcat 服务器
        //this.src="${pageContext.request.contextPath}/demo?time="+new Date().getTime();
        this.src="${pageContext.request.contextPath}/demo?time="+Math.random();

    }

    function reImg(){
        var img=document.getElementById("img1");
        img.src="${pageContext.request.contextPath}/demo?time="+Math.random();
    }

</script>
</html>