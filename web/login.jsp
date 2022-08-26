<%@ page contentType="text/html; charset=gb2312" pageEncoding="UTF-8"%>
<html lang="en">
	<head>
        <meta charset="UTF-8">
        <meta name="Generator" content="EditPlus®">
        <meta name="Author" content="范晓君">
        <meta name="Keywords" content="">
        <meta name="Description" content="">
        <title>ex3登录页面</title>
      
    </head>
	<style type="text/css">
		font {
			color: #3164af;
			font-size: 18px;
			font-weight: normal;
			padding: 0 10px;
		}
	</style>
	<body>
		<div class="col-md-8"
			    style="background: #fff; padding: 40px 80px; margin: 30px; border: 7px solid #ccc;">
		<center>
			<font>用户登录</font>USER LOGIN   <span style="color: red">${errorMsg }</span>

		    <form method="post" action="${pageContext.request.contextPath }/login">
			    <table>
				    <tr>
					    <td>用户名</td>
					    <td><input type="text" name="username" required="required"></td>
				    </tr>
				    <tr>
					    <td>密码</td>
					    <td><input type="password" name="password" required="required"></td>
				    </tr>
				    <tr>
					    <td align="center" colspan="2">
                            <input type="submit" value="登录">
                            <input type="reset" value="重置">
                        </td>
				    </tr>
			</table>
		</form>
	</center>
	</div>
	</body>
</html>