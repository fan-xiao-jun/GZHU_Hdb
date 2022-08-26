<%@ page contentType="text/html; charset=gb2312" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ex3修改信息</title>
</head>
   
<style type="text/css">
    font {
        color: #3164af;
        font-size: 18px;
        font-weight: normal;
        padding: 0 10px;
    }
</style>
   <%
		//装载驱动程序
		Class.forName("com.mysql.cj.jdbc.Driver");
		//连接字符串
		String url ="jdbc:mysql://localhost:3306/hongdb?useSSL=true&serverTimezone=GMT"; 
		//建立连接
		Connection conn= DriverManager.getConnection(url,"root","123"); 
		Statement stmt=conn.createStatement();

        String name=(String)session.getAttribute("username");
		ResultSet rs=stmt.executeQuery("select * from user where uid='"+name+"'");
        if(rs!=null) rs.next();
        

		
    %>
<body>
    <div style="background: #fff; padding: 40px 80px; margin: 30px; border: 7px solid #ccc;">
        <center>
           <font>修改用户信息</font>CHANGE INFORMATION
           <div id="errorMsg"><span style="color: red">  </span></div>
           <form method="post" action="${pageContext.request.contextPath }/CINFServlet">
               <table>
                   <tr>
                       <td>姓名</td>
                       <td><input type="text" name="uuname" value="<%=rs.getString("username")%>"></td>
                   </tr>
                   <tr>
                       <td>年龄</td>
                       <td><input type="text" name="age" value="<%=rs.getInt("age")%>"></td>
                   </tr>
                   <tr>
                       <td>性别</td>
                       <td><input type="text" name="sex" value= "<%=rs.getString("sex")%>"></td>
                   </tr>
                   <tr>
                       <td align="center" colspan="2">
                           <input type="submit" value="修改">
                           <input type="reset" value="重置">
                       </td>
                   </tr>
               </table>
           </form>
        </center>
    </div>
    
</body>
<%
  rs.close();
  stmt.close();
  conn.close();
%>
</html>