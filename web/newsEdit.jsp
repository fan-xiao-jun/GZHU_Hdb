<%@ page contentType="text/html; charset=gb2312" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
   <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>新增/修改新闻页面</title>
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
        String sql1 = "SELECT * from `news`";
        //执行查询建立ResultSet
        ResultSet rs=stmt.executeQuery(sql1);
        int TotalQnum=0;//题库中新闻总数
        while(rs.next()){
            TotalQnum++;
        }

		String action=request.getParameter("action");//获取动作
		String actiontype="";
		String actionaim="";
		String editQno="";//获取序号
        

		if(action.equals("1")){
			actiontype="新增新闻";
			actionaim="newsAdd.jsp";
		}else{
			actiontype="修改新闻";
			actionaim="newsChange.jsp";
			editQno=request.getParameter("id");
			rs=stmt.executeQuery("select * from news where Nno='"+editQno+"'");
			if(rs!=null) rs.next();
		} 

        
    %>
  
   <body>
       <div class="tab">
        <%=actiontype%>|<a href="newsRevise.jsp">返回</a>
        <hr>
        <form action=<%=actionaim%> method=post>
            <table border=0 cellspacing=0 style="margin: auto">
                <tr>
                    <td>序号：&emsp;</td>
                    <td>
                        <%
                        if(action.equals("1"))//新增试题
                            out.print("<input type=\"text\" required=\"required\" size=\"20\" name=\"Nno\" readonly=\"true\" value="+TotalQnum+" >");
                        else//修改试题
                            out.print("<input type=\"text\" required=\"required\" size=\"20\" name=\"Nno\" readonly=\"true\" value=\""+rs.getString("NnO")+"\">");
                        %>
                    </td>
                </tr>
                <tr>
                    <td>标题：&emsp;</td>
                    <td>
                        <%
                        if(action.equals("1"))
                            out.print("<input type=\"text\" required=\"required\" size=\"20\" name=\"title\" required=\"required\">");
                        else
                            out.print("<input type=\"text\" required=\"required\" size=\"20\" name=\"title\" value=\""+rs.getString("title")+"\" >");
                        %>
                    </td>
                </tr>
                <tr>
                    <td>图片路径：&emsp;</td>
                    <td>
                        <%
                        if(action.equals("1"))
                            out.print("<input type=\"text\" required=\"required\" size=\"20\" name=\"picsrc\" required=\"required\">");
                        else
                            out.print("<input type=\"text\" required=\"required\" size=\"20\" name=\"picsrc\" value=\""+rs.getString("picsrc")+"\" >");
                        %>
                    </td>
                </tr>
                <tr>
                    <td>新闻内容：&emsp;</td>
                    <td>
                        <%
                        if(action.equals("1"))
                            out.print("<input type=\"text\" required=\"required\" size=\"20\" name=\"content\" required=\"required\">");
                        else
                            out.print("<input type=\"text\" required=\"required\" size=\"20\" name=\"content\" value=\""+rs.getString("content")+"\" >");
                        
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