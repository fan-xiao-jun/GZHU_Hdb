<%@ page contentType="text/html; charset=gb2312" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>我的答题记录</title>

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
        该用户答题记录如下|<a href="Record.jsp">返回</a><br><hr>
        <table border=1 cellspacing=1 style="margin: auto">
            <tr><td>题目</td><td>A</td><td>B</td><td>C</td><td>D</td><td>正确答案</td><td>你的答案</td></tr>
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
                String action=request.getParameter("action");//获取动作
                String uid=request.getParameter("id");;//获取题号
                
                String sql = "select * from userans where uid='"+uid+"'";//查询该用户有多少次答题记录
                ResultSet rs=stmt.executeQuery(sql);
           
                ArrayList list = new ArrayList();//创建集合存储题目
                ArrayList listans = new ArrayList();//创建集合存储用户答案
                ArrayList listpoint = new ArrayList();//创建集合存储用户得分
                int record=0;
                //输出查询结果
                while(rs!=null && rs.next()){
                    record++;
                    list.add(rs.getInt("QNO1"));
                    list.add(rs.getInt("QNO2"));
                    list.add(rs.getInt("QNO3"));
                    list.add(rs.getInt("QNO4"));
                    list.add(rs.getInt("QNO5"));

                    listans.add(rs.getString("uanswer1"));
                    listans.add(rs.getString("uanswer2"));
                    listans.add(rs.getString("uanswer3"));
                    listans.add(rs.getString("uanswer4"));
                    listans.add(rs.getString("uanswer5"));

                    listpoint.add(rs.getInt("totalPoint"));
                    
                }
                int listnum=0;
                for(int i=0;i<record;i++){
                    out.print("<tr><td>第"+(i+1)+"次</td><td></td><td></td><td></td><td></td><td>得分</td><td>"+listpoint.get(i)+"</td></tr>");
                    for(int j=0;j<5;j++){
                        String sql2 = "select * from queandans where QNO='"+list.get(listnum)+"'";
                        rs=stmt.executeQuery(sql2);
                        while(rs!=null && rs.next()){
                            out.print("<tr><td>"+rs.getString("question")+"</td>");
                            out.print("<td>"+rs.getString("optionA")+"</td>");
                            out.print("<td>"+rs.getString("optionB")+"</td>");
                            out.print("<td>"+rs.getString("optionC")+"</td>");
                            out.print("<td>"+rs.getString("optionD")+"</td>");
                            out.print("<td>"+rs.getString("answer")+"</td>");
                            out.print("<td>"+listans.get(listnum)+"</td></tr>");
                            listnum++;
                        }
                    }
                }

                out.print(uid+"的答题次数："+record);
                
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