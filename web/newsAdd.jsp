<%@ page contentType="text/html; charset=gb2312" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>新增新闻页面</title>
</head>
<body>
    <%
	  try{
            //获取参数
		    request.setCharacterEncoding("gb2312");
            int Nno=Integer.valueOf(request.getParameter("Nno")).intValue();
		    String title=request.getParameter("title");
		    String picsrc=request.getParameter("picsrc");
            String content=request.getParameter("content");
		
		    //装载驱动程序
		    Class.forName("com.mysql.cj.jdbc.Driver");
		    //连接字符串
		    String url ="jdbc:mysql://localhost:3306/hongdb?useSSL=true&serverTimezone=GMT"; 
		    //建立连接
		    Connection conn= DriverManager.getConnection(url,"root","123"); 
		    PreparedStatement pstmt=conn.prepareStatement("insert into news values(?,?,?,?)");
		    pstmt.setInt(1,Nno);
		    pstmt.setString(2,title);
		    pstmt.setString(3,picsrc);
		    pstmt.setString(4,content);
		    
		    pstmt.execute();
		    pstmt.close();
		    conn.close();
		    response.sendRedirect("newsRevise.jsp");
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