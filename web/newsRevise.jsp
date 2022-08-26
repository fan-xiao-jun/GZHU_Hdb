<%@ page contentType="text/html; charset=gb2312" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>新闻管理页面</title>
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
        全部新闻|<a href="newsEdit.jsp?action=1">新增新闻</a><br>
        <hr>
        <table border=1 cellspacing=1 style="margin: auto">
            <tr><td>序号</td><td>新闻标题</td><td>图片路径</td><td width="200px">新闻内容</td><td>修改</td><td>删除</td></tr>
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
    
                String sql = "select * from news";
                ResultSet rs=stmt.executeQuery(sql);

                //输出查询结果
                while(rs!=null && rs.next()){
                    out.print("<tr><td>"+rs.getInt("NnO")+"</td>");
                    out.print("<td>"+rs.getString("title")+"</td>");
                    out.print("<td>"+rs.getString("picsrc")+"</td>");
                    out.print("<td width=\"200px\">"+rs.getString("content")+"</td>");
                    out.print("<td><a href=\"newsEdit.jsp?action=2&id="+rs.getInt("NnO")+"\">修改</a></td>");
                    out.print("<td><a href=\"newsDelete.jsp?id="+rs.getInt("NnO")+"\">删除</a></td></tr>");
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