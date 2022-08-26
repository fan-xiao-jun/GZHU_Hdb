<%@ page contentType="text/html; charset=gb2312" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="refresh" content="5;url=index.jsp">
    <title>Document</title>
</head>
<style>
    .c{
        text-align:center;/*居中*/
    }
</style>

<body>
    <div class="c">
    <%
		String username=(String)session.getAttribute("username");
		session.invalidate();//注销
		if(username!=null){
            out.print("注销成功!<br>");
		    out.print(username+"再见<br>");
            out.print("5秒后跳转回首页");
		}
	%>
    点击<a href="index.jsp"><font color="red">这里</font></a>直接跳转
    </div>
    
</body>
</html>