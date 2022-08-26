<%@ page contentType="text/html; charset=gb2312" pageEncoding="UTF-8" language="java"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
 <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>文章</title>
 </head>
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

 %>
 <style>
    <!-- @import url("css/css-news.css"); -->
 </style>
 <body>
    <div style="margin-bottom:0px;" class="head">
        <br>
        <div class="title"><i><font size="15">广州大学红色文化长廊</font></i></div>
    </div>
    <div class="mainBody">
        
        <div class="box1">
            <h3>活用校园空间 广州大学打造千米“红色长廊”</h3>
            <p>
                仪式上，广州大学党委副书记聂贵新介绍了广州大学党建红色文化长廊（一期）的基本建设情况。据介绍，红色长廊建设充分利用
                学校现有信息文化长廊及周边区域，进行整体规划设计、功能改造。长廊一楼的展览宣教区建设由主题雕塑、序厅、228根柱子构成的基础展区、
                宣誓广场、长征精神主题展览厅、科学家精神主题展览区、劳模精神主题展览区、改革开放伟大成就主题展览区等组成。
            </p>
            <p>
                记者了解到，红色长廊展陈包含近12万文字、近300张图片。其中，近50幅为广州大学师生创作的作品。展陈形式丰富多样，运用
                了文字、图片、浮雕、灯光、音效、多媒体技术等，涉及人物300多位，事件近300件。红色长廊把握百年党史发展中的重大关键节点，生动讲述
                中国共产党走过的峥嵘岁月和光辉历程，着重凸显中国共产党人的精神谱系。师生们行走在长廊中，了解、学习党的光辉历史，传承红色基因、
                赓续精神血脉。
            </p>
            <p>
                广州大学党委书记屈哨兵表示，红色长廊是用好红色资源、发扬红色传统、传承红色基因的重要载体，也为学校推进思政课程与课
                程思政建设找到突破口，成为构建全域思政育人新模式的重要依托。红色长廊以时间为线索，以科技互动、文化体验等多元化表现手段，打造绵延
                千米、沉浸式、立体化的党史学习教育阵地。校园即思政课堂的全域性思政育人新格局呼之欲出。
            </p>
            <p>
                “这是《地球上的红飘带》主题雕塑，以雕塑语言描述红军长征的过程……”启动仪式现场，屈哨兵以及广州大学校长魏明海向广州大学党史学习教育
                师生宣传团的成员代表颁发聘书。随后，宣讲团成员以红色长廊入口处的主题雕塑为源头，生动讲述红色长廊的不同功能分区和展览内容。据悉，
                目前宣讲团已经吸引了近百名师生参与，接下来将进一步扩展规模。
            </p>
            <p>
                “漫步校园、途经红色长廊，我们时常驻足观看，或是约上三五好友前来打卡。”师生宣讲团成员、马克思主义学院20级研究生梁峰表示，红色长廊
                已经成为红色文化打卡点、又一处校园地标。
            </p>
            <p>
                接下来，广州大学还将在长廊二楼建设多功能活动区，为师生提供多元化服务，在周边建设改造主题景观党建园、微型红色广场等。目前，线上云平
                台相关内容建设也在同步进行中。
            </p>
        </div>
        <div class="box2">
            <br><br>
            <ul>
            <%
                //随机获取5条新闻
                String sql="select * from news ORDER BY RAND() LIMIT 5";
                int newsNum=0;
                ResultSet rs=stmt.executeQuery(sql);
                while(rs!=null && rs.next()){
                    newsNum++;
                    out.print("<li><a href=\"selectNews.jsp?id="+rs.getInt("Nno")+"\" target=\"_blank\">0"+newsNum+"   "+rs.getString("title")+"</a></li><br>");
                    if(newsNum==5){break;}
                }
            %>
            </ul>
            
        </div>

        <div class="box3">
            <br />
            <hr>
            <h2>评论区</h2>
            <div>
                <%
                String name=(String)session.getAttribute("username");
                if(name!=null){
                %>
                    <div class="box5">
                        <div class="touxiang">
                            <img src="image/tx.jpg" width="60px" height="60px"/>
                        </div>
                        
                        <form method="post" action="${pageContext.request.contextPath }/commentServlet">
                            <%=name%>:
                            &emsp;<textarea rows="5" cols="50" name="mycomment"></textarea>
                            &emsp;<input type="submit" value="发送">
                        </form>
                    </div>
                <%
                }
                else{
                %>
                    <div class="box4">登录成功后可评论</div>
                <%
                }
                %>
            </div>
            <div class="tab">
                <table>
                    
                    <%
                        String sql2="select * from comment";
                        rs=stmt.executeQuery(sql2);
                        while(rs!=null && rs.next()){
                            out.print("<tr><td>"+rs.getString("username")+"</td>");
                            out.print("<td>"+rs.getString("time")+"</td></tr>");
                            out.print("<tr><td style=\"color: black; text-indent:2em;\">"+rs.getString("content")+"</td></tr>");
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
        </div>
    </div>
    
 </body>
</html>