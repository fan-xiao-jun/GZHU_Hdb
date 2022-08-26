<%@ page contentType="text/html; charset=gb2312" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
   <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>新增/修改试题页面</title>
    </head>
    <style type="text/css">
        .tab{
            /*background: red;/*背景颜色*/
            margin: 20px 10px;/*设置上边距和左边距*/
            text-align:center;/*居中*/
            position: relative;
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
        String sql1 = "SELECT * from `QUEandANS`";
        //执行查询建立ResultSet
        ResultSet rs=stmt.executeQuery(sql1);
        int TotalQnum=0;//题库中题目总数
        while(rs.next()){
            TotalQnum++;//获取题库题目总数
        }

		//rs=stmt.executeQuery("select * from queandans");

		String action=request.getParameter("action");//获取动作
		String actiontype="";
		String actionaim="";
		String editQno="";//获取题号
        

		if(action.equals("1")){
			actiontype="新增试题";
			actionaim="QueAdd.jsp";
		}else{
			actiontype="修改试题";
			actionaim="QueEdit.jsp";
			editQno=request.getParameter("id");
			rs=stmt.executeQuery("select * from queandans where Qno='"+editQno+"'");
			if(rs!=null) rs.next();
		} 

        
    %>
  
   <body>
       <div class="tab">
        <%=actiontype%>|<a href="Question.jsp">回到题库</a>
        <hr>
        <form action=<%=actionaim%> method=post>
            <table border=0 cellspacing=0 style="margin: auto">
                <tr>
                    <td>题号：&emsp;</td>
                    <td>
                        <%
                        if(action.equals("1"))//新增试题
                            out.print("<input type=\"text\" required=\"required\" size=\"20\" name=\"Qno\" readonly=\"true\" value="+TotalQnum+" >");
                        else//修改试题
                            out.print("<input type=\"text\" required=\"required\" size=\"20\" name=\"Qno\" readonly=\"true\" value=\""+rs.getString("QNO")+"\">");
                        %>
                    </td>
                </tr>
                <tr>
                    <td>题目：&emsp;</td>
                    <td>
                        <%
                        if(action.equals("1"))
                            out.print("<input type=\"text\" required=\"required\" size=\"20\" name=\"question\" required=\"required\">");
                        else
                            out.print("<input type=\"text\" required=\"required\" size=\"20\" name=\"question\" value=\""+rs.getString("question")+"\" >");
                        %>
                    </td>
                </tr>
                <tr>
                    <td>选项A：&emsp;</td>
                    <td>
                        <%
                        if(action.equals("1"))
                            out.print("<input type=\"text\" required=\"required\" size=\"20\" name=\"optionA\" required=\"required\">");
                        else
                            out.print("<input type=\"text\" required=\"required\" size=\"20\" name=\"optionA\" value=\""+rs.getString("optionA")+"\" >");
                        %>
                    </td>
                </tr>
                <tr>
                    <td>选项B：&emsp;</td>
                    <td>
                        <%
                        if(action.equals("1"))
                            out.print("<input type=\"text\" required=\"required\" size=\"20\" name=\"optionB\" required=\"required\">");
                        else
                            out.print("<input type=\"text\" required=\"required\" size=\"20\" name=\"optionB\" value=\""+rs.getString("optionB")+"\" >");
                        %>
                    </td>
                </tr>
                <tr>
                    <td>选项C：&emsp;</td>
                    <td>
                        <%
                        if(action.equals("1"))
                            out.print("<input type=\"text\" required=\"required\" size=\"20\" name=\"optionC\" required=\"required\">");
                        else
                            out.print("<input type=\"text\" required=\"required\" size=\"20\" name=\"optionC\" value=\""+rs.getString("optionC")+"\" >");
                        %>
                    </td>
                </tr>
                <tr>
                    <td>选项D：&emsp;</td>
                    <td>
                        <%
                        if(action.equals("1"))
                            out.print("<input type=\"text\" required=\"required\" size=\"20\" name=\"optionD\" required=\"required\">");
                        else
                            out.print("<input type=\"text\" required=\"required\" size=\"20\" name=\"optionD\" value=\""+rs.getString("optionD")+"\" >");
                        %>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;正确答案：</td>
                    <td>
                        <%
                        if(action.equals("1"))
                            out.print("<input type=\"text\" required=\"required\" size=\"20\" name=\"answer\" required=\"required\">");
                        else
                            out.print("<input type=\"text\" required=\"required\" size=\"20\" name=\"answer\" value=\""+rs.getString("answer")+"\" >");
                        %>
                    </td>
                </tr>
            </table>
            <input type=submit value="提交">
        </form>
     </div>
   </body>
<%
  rs.close();
  stmt.close();
  conn.close();
%>
</html>