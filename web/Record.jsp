<%@ page contentType="text/html; charset=gb2312" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=\, initial-scale=1.0">
    <title>有答题记录的用户</title>
</head>
<style type="text/css">
    .tab{
        /*background: red;/*背景颜色*/
	    margin: 20px 10px;/*设置上边距和左边距*/
        text-align:center;/*居中*/
        position: relative;
    }
    td
    {
        width:100px;
        height:20px;
    }
</style>
<body>
    <div class="tab">
        <table border=1 cellspacing=1 style="margin: auto">
            <tr><td>用户</td><td>点击查看</td></tr>
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
                //执行查询建立ResultSet
                
    
                String sql = "select distinct uid from userans";//查询该用户有多少次答题记录
                ResultSet rs=stmt.executeQuery(sql);

                while(rs!=null && rs.next()){
                    out.print("<tr><td>"+rs.getString("uid")+"</td>");
                    out.print("<td><a href=\"userRecord.jsp?action=1&id="+rs.getString("uid")+"\">查看</a></td></tr>");
                }
           
                
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
        </table>    

    </div>
    
</body>
</html>