<%@ page contentType="text/html; charset=gb2312" language="java"%> 
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <%
	  try{
		String id=request.getParameter("id");//获取题号
		//装载驱动程序
		Class.forName("com.mysql.cj.jdbc.Driver");
		//连接字符串
		String url ="jdbc:mysql://localhost:3306/hongdb?useSSL=true&serverTimezone=GMT"; 
		//建立连接
		Connection conn= DriverManager.getConnection(url,"root","123"); 
		Statement stmt=conn.createStatement();
		String sql="delete from news where NnO='"+id+"'";
		int result=stmt.executeUpdate(sql);
		response.sendRedirect("newsRevise.jsp");
		stmt.close();
		conn.close();
	  }catch(ClassNotFoundException cnfe){
		out.print(cnfe);
	  }catch(SQLException sqle){
		out.print(sqle);
	  }catch(Exception e){
		out.print(e);
	  }
	%>
    
</body>
</html>