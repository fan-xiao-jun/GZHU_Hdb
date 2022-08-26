<%@ page contentType="text/html; charset=gb2312" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>显示得分页面</title>

</head>
<body>
    <%
    %>
    <div>
        <center>
            <br><br>
            <font color="#CC0000" size="4">你的得分是：<%=request.getParameter("TotalPoint")%>分</font>
            <br />
            <font color="#CC0000" size="4">点击<a href="index.jsp">这里</a>跳转回首页</font>
        </center>
    </div>
    
</body>
</html>