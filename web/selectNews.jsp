<%@ page contentType="text/html; charset=gb2312" pageEncoding="UTF-8" language="java"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>新闻</title>
</head>
<style>
    <!-- @import url("css/mycss.css"); -->
    .mainBody{
	    /*background: lightblue;*/
	    margin: 10px 10px;/*设置上边距和左边距*/
    }
    h2{
        text-align:center;/*居中*/
    }
    
    .content{
        text-indent:2em;/*空两格*/
        width: 800px;
        margin: 5px 50px 0px 220px;/*上、右、下、左*/
    }

</style>
<%
try{
    //装载驱动程序
    Class.forName("com.mysql.cj.jdbc.Driver");
    //连接字符串
    String url ="jdbc:mysql://localhost:3306/hongdb?useSSL=false&serverTimezone=GMT%2B8"; 
    //建立连接
    Connection conn= DriverManager.getConnection(url,"root","123"); 
    //建立Statement
    Statement stmt=conn.createStatement();
    String Nno=request.getParameter("id");;
    String sql="select * from news where Nno='"+Nno+"'";
    ResultSet rs=stmt.executeQuery(sql);
    if(rs!=null) rs.next();

%>
<body>
    <div style="margin-bottom:0px;" class="head">
        <br>
        <div class="title"><i><font size="15">广州大学红色文化长廊</font></i></div>
    </div>
    <div class="mainBody">
        <h2><%=rs.getString("title")%></h2>
        <center><div><img src="<%=rs.getString("picsrc")%>" width=800px height=450px /></div></center>
        <br>
        <div class="content"><%=rs.getString("content")%></div>
    </div>
    
</body>
<%
    //关闭连接、释放资源
    rs.close();
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
</html>