<%@ page contentType="text/html; charset=gb2312" pageEncoding="UTF-8" language="java"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="范晓君">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>广大红色文化长廊</title>

  <script language="JavaScript" type="text/javascript">
        function ChangeFont(f){//修改网页显示文字字号大小
	        document.getElementById('content').style.fontSize=f;
	    }
		var i=0;
	    function ChangePictures(){//轮播图
		    if(i==6){i=0;}
		        i++;
		    document.getElementById('pictu').src="image/HPCarouselFigure/"+i+".jpg";
	    }
  </script>

 </head>

    <style type="text/css">
        <!-- @import url("css/mycss.css"); -->
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
    %>


    <body>
		<script language="JavaScript" type="text/javascript">
		    setInterval(ChangePictures,1000);//开启轮播图
	    </script>

		<!--1、标题-->
		<div style="margin-bottom:0px;" class="head">
			<br>
			<div class="title"><i><font size="15">广州大学红色文化长廊</font></i></div>
		</div>

		<!--2、存放网页logo和菜单-->
		<div style="margin-top:0px;" class="menu">
			<div class="logo"><!--logo-->
				<img src="image/logo.gif"/>
		    </div>
			
			<div class="content" style="float: left;"><!--菜单-->
				<ul>
				    <li><a href="">首页</a></li>
					<li><a href="news.jsp" target="_blank">红色文化长廊</a></li>
					<%
					    String name=(String)session.getAttribute("username");
					    if(name!=null){
							%>
							<li ><a href="play.jsp" target="_blank"><font color="#CC0000">党建知识抢答小游戏</font></a></li>
							<%
						}
					%>
				</ul>
			</div>

			
			
			<div class="content" style="float: right;">
				<ul>
					<%
					    //String name=(String)session.getAttribute("username");
					    if(name!=null){
							if(name.equals("root")){
								%>
								<li><a href="newsRevise.jsp" target="_blank">新闻管理</a></li>
								<li><a href="Question.jsp" target="_blank">题库</a></li>
								<li><a href="Record.jsp" target="_blank">答题记录</a></li>
								<li><a href="changePWD.jsp">修改密码</a></li>
								<li><a href="logout.jsp">注销</a></li>
								<li>欢迎<%out.print("管理员");%></li>
							<%}
							else{
							%>
								<li><a href="myRecord.jsp" target="_blank">答题记录</a></li>
								<li><a href="changePWD.jsp">修改密码</a></li>
								<li><a href="changeINF.jsp">修改信息</a></li>
								<li><a href="logout.jsp">注销</a></li>
								<li>欢迎<%out.print(name);%></li>
							<%}
					    }
					    else{
					%>
						    <li><a href="login.jsp">登录</a></li>
			                <li><a href="register.jsp">注册</a></li>
					<%}%>
				</ul>

			</div>
			
		</div>

		<!--添加改变字号的按钮-->
		<div  style="margin-top:10px;">
            <center>
                <input type="button" value="大" onclick="ChangeFont('24px')">
                <input type="button" value="中" onclick="ChangeFont('18px')">
                <button type="button" onclick="ChangeFont('12px')">小</button>
            </center>
            
        </div>

		
		<br>

		<!--主体部分-->
        <div class="mainBody" id="content">
            <h1>广州大学：活用校园空间 打造千米“红色长廊”</h1><!--标题-->

			<div>
				<!--3、图片-->
				<div class="pictures">
					<img id="pictu" width=800px height=533px/>
				</div>
				
				<!--4、咨讯-->
				<div class="ahref">
					
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
				
			</div>
			
			<!--5、文章介绍-->
			<div class="paragraph">
				<p>
					&emsp;&emsp;仪式上，广州大学党委副书记聂贵新介绍了广州大学党建红色文化长廊（一期）的基本建设情况。据介绍，红色长廊建设充分利用
					学校现有信息文化长廊及周边区域，进行整体规划设计、功能改造。长廊一楼的展览宣教区建设由主题雕塑、序厅、228根柱子构成的基础展区、
					宣誓广场、长征精神主题展览厅、科学家精神主题展览区、劳模精神主题展览区、改革开放伟大成就主题展览区等组成。
				</p>
				<p>
					&emsp;&emsp;记者了解到，红色长廊展陈包含近12万文字、近300张图片。其中，近50幅为广州大学师生创作的作品。展陈形式丰富多样，运用
					了文字、图片、浮雕、灯光、音效、多媒体技术等，涉及人物300多位，事件近300件。红色长廊把握百年党史发展中的重大关键节点，生动讲述
					中国共产党走过的峥嵘岁月和光辉历程，着重凸显中国共产党人的精神谱系。师生们行走在长廊中，了解、学习党的光辉历史，传承红色基因、
					赓续精神血脉。
				</p>
				<p>
                    &emsp;&emsp;广州大学党委书记屈哨兵表示，红色长廊是用好红色资源、发扬红色传统、传承红色基因的重要载体，也为学校推进思政课程与课
					程思政建设找到突破口，成为构建全域思政育人新模式的重要依托。红色长廊以时间为线索，以科技互动、文化体验等多元化表现手段，打造绵延
					千米、沉浸式、立体化的党史学习教育阵地。校园即思政课堂的全域性思政育人新格局呼之欲出。
				</p>
			</div>
			
        </div>

        <!-- -->
		
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
