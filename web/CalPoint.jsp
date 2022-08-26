<%@ page contentType="text/html; charset=gb2312" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<html>
    <head>
        <title>显示得分页面</title>
    </head>
	<body>
        <%
        try{
            /****************************************连接数据库***********************************************************/
            //装载驱动程序
            Class.forName("com.mysql.cj.jdbc.Driver");
            //连接字符串
            String url ="jdbc:mysql://localhost:3306/hongdb?useSSL=false&serverTimezone=GMT%2B8"; 
            //建立连接
            Connection conn= DriverManager.getConnection(url,"root","123"); 
            //建立Statement
            Statement stmt=conn.createStatement();
            String uid=(String)session.getAttribute("username");//获取用户名
            int nowPlaynum=(int)session.getAttribute("nowPlaynum");//获取当前用户名答题次数
            String s0=request.getParameter("select1");
            String s1=request.getParameter("select2");
            String s2=request.getParameter("select3");
            String s3=request.getParameter("select4");
            String s4=request.getParameter("select5");
            //将用户的选项录入数据库
            String sql="update userans set uanswer1='"+s0+"',uanswer2='"+s1+"',uanswer3='"+s2+"',uanswer4='"+s3+"',uanswer5='"+s4+"' WHERE uid='"+uid+"' and num='"+nowPlaynum+"'";
            
            //使用Statement,执行update更新
			int result=stmt.executeUpdate(sql);
			//输出更新结果
            if(result>0){
            }
            else{
                response.sendRedirect("error3.html");
            }

            //计算分数
            int TotalPoint=0;//总得分
        
            String sql1="select answer from queandans where QNO = (select QNO1 from userans where uid='"+uid+"' and num='"+nowPlaynum+"')";
            String sql2="select answer from queandans where QNO = (select QNO2 from userans where uid='"+uid+"' and num='"+nowPlaynum+"')";
            String sql3="select answer from queandans where QNO = (select QNO3 from userans where uid='"+uid+"' and num='"+nowPlaynum+"')";
            String sql4="select answer from queandans where QNO = (select QNO4 from userans where uid='"+uid+"' and num='"+nowPlaynum+"')";
            String sql5="select answer from queandans where QNO = (select QNO5 from userans where uid='"+uid+"' and num='"+nowPlaynum+"')";

            String[] rightans;//数组rightans存储正确答案
            rightans=new String[5];

            ResultSet rs=stmt.executeQuery(sql1);
            if(rs.next()){
                rightans[0]=rs.getString(1);//获取第一题答案
            }
            rs=stmt.executeQuery(sql2);
            if(rs.next()){
                rightans[1]=rs.getString(1);//获取第二题答案
            }
            rs=stmt.executeQuery(sql3);
            if(rs.next()){
                rightans[2]=rs.getString(1);//获取第三题答案
            }
            rs=stmt.executeQuery(sql4);
            if(rs.next()){
                rightans[3]=rs.getString(1);//获取第四题答案
            }
            rs=stmt.executeQuery(sql5);
            if(rs.next()){
                rightans[4]=rs.getString(1);//获取第五题答案
            }
            out.print(uid+" : ");
            out.println("正确答案"+rightans[0]+"  "+rightans[1]+"  "+rightans[2]+"  "+rightans[3]+"  "+rightans[4]);

            if(s0.equals(rightans[0])){TotalPoint=TotalPoint+20;}
            if(s1.equals(rightans[1])){TotalPoint=TotalPoint+20;}
            if(s2.equals(rightans[2])){TotalPoint=TotalPoint+20;}
            if(s3.equals(rightans[3])){TotalPoint=TotalPoint+20;}
            if(s4.equals(rightans[4])){TotalPoint=TotalPoint+20;}

            out.println("得分 : "+TotalPoint);
            String sql7="UPDATE USERANS SET totalPoint="+TotalPoint+" where uid='"+uid+"' and num='"+nowPlaynum+"'";
            //使用Statement,执行update更新
			int re=stmt.executeUpdate(sql7);
            if(re>0){
                %>
                <jsp:forward page="showPoint.jsp">
			        <jsp:param name="TotalPoint" value="<%=TotalPoint %>"/>
			    </jsp:forward>
                <%
            }
            else{
                response.sendRedirect("error3.html");
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
    </body>
</html>