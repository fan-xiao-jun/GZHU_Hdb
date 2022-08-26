<%@ page contentType="text/html; charset=gb2312" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>题库管理页面</title>
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
        题库试题如下|<a href="QueRevise.jsp?action=1">新增试题</a><br>
        <hr>
        <table border=1 cellspacing=1 style="margin: auto">
            <tr><td>题号</td><td>题目</td><td>A</td><td>B</td><td>C</td><td>D</td><td>正确答案</td><td>修改</td><td>删除</td></tr>
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
    
                String sql = "select * from queandans";
                ResultSet rs=stmt.executeQuery(sql);

                //输出查询结果
                while(rs!=null && rs.next()){
                    out.print("<tr><td>"+rs.getInt("QNO")+"</td>");
                    out.print("<td>"+rs.getString("question")+"</td>");
                    out.print("<td>"+rs.getString("optionA")+"</td>");
                    out.print("<td>"+rs.getString("optionB")+"</td>");
                    out.print("<td>"+rs.getString("optionC")+"</td>");
                    out.print("<td>"+rs.getString("optionD")+"</td>");
                    out.print("<td>"+rs.getString("answer")+"</td>");
                    out.print("<td><a href=\"QueRevise.jsp?action=2&id="+rs.getInt("QNO")+"\">修改</a></td>");
                    out.print("<td><a href=\"QueDelete.jsp?id="+rs.getInt("QNO")+"\">删除</a></td></tr>");
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