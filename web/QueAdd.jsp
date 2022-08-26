<%@ page contentType="text/html; charset=gb2312" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>新增试题页面</title>
</head>
<body>
    <%
	  try{
            //获取参数
		    request.setCharacterEncoding("gb2312");
            int qno=Integer.valueOf(request.getParameter("Qno")).intValue();
		    //String qno=request.getParameter("id");
		    String question=request.getParameter("question");
		    String optionA=request.getParameter("optionA");
            String optionB=request.getParameter("optionB");
            String optionC=request.getParameter("optionC");
            String optionD=request.getParameter("optionD");
		    String answer=request.getParameter("answer");
		
		    //装载驱动程序
		    Class.forName("com.mysql.cj.jdbc.Driver");
		    //连接字符串
		    String url ="jdbc:mysql://localhost:3306/hongdb?useSSL=true&serverTimezone=GMT"; 
		    //建立连接
		    Connection conn= DriverManager.getConnection(url,"root","123"); 
		    PreparedStatement pstmt=conn.prepareStatement("insert into queandans values(?,?,?,?,?,?,?)");
		    pstmt.setInt(1,qno);
		    pstmt.setString(2,question);
		    pstmt.setString(3,optionA);
		    pstmt.setString(4,optionB);
		    pstmt.setString(5,optionC);
		    pstmt.setString(6,optionD);
            pstmt.setString(7,answer);
		    pstmt.execute();
		    pstmt.close();
		    conn.close();
		    response.sendRedirect("Question.jsp");
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