<%@ page contentType="text/html; charset=gb2312" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="范晓君">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>党建知识抢答小游戏</title>

  <script language="JavaScript" type="text/javascript">
        /*******************************************计时器部分***********************************************************/
        var second=0;//当前用时
        //计时函数
        function timer(){
            second++;
            document.getElementById('timeValue').value=second+'秒';
			if(second==60){//超时自动结束
				clearInterval(clock);
                
			}
        }
        //计时
        function startTimer(){
			if(second!=0){
				clearInterval(clock);
			}
            second=0;
            clock=setInterval(timer,1000);//开始计时
            document.getElementById('timeValue').value=second+'/60秒';

		}

        /*******************************************跑马灯部分***********************************************************/
        var imageNum=0;
		var frontImg=0;
		function changeColor(){
			if(frontImg==51){//跑马灯循环回到第一格，清除第52格(即第二行第一格)内容
				document.getElementById("image52").src="";
			}
			frontImg=imageNum;
			imageNum++;
            document.getElementById("image"+imageNum).src="image/logo.gif";
			document.getElementById("image"+frontImg).src="";
			if(imageNum==52){//跑马灯循环回到第一格
				imageNum=0;
			}
			
        }
  </script>

 </head>

<!--引入css-->
<style type="text/css">
    <!-- @import url("css/css-play.css"); 
    .t ul{
	    list-style: none;/*去除列表格式*/
    }
    -->
</style>

 <body>

	<script language="JavaScript" type="text/javascript">
		setInterval(changeColor,200);//开启跑马灯
        startTimer();
	</script>

    <!--连接数据库部分-->
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

            //获取参数
            String uid=(String)session.getAttribute("username");//从session中获取用户名
            int TotalScort=0;//得分
            int TotalQnum=0;//题库中题目总数
            int playNum=0;//该用户的答题次数
            String sql1 = "SELECT * from `QUEandANS`";
            
            //执行查询建立ResultSet
            ResultSet rs=stmt.executeQuery(sql1);
            while(rs.next()){
                TotalQnum++;//获取题库题目总数
            }
            int qnum1=(int)(Math.random()*(TotalQnum-5));//获取0-(TotalQnum-5)之间的随机整数，题目1
            int qnum2=qnum1+1;//题目2
            int qnum3=qnum2+1;//题目3
            int qnum4=qnum3+1;//题目4
            int qnum5=qnum4+1;//题目5
            //out.print(TotalQnum+"  "+qnum1+"  "+qnum2+"  "+qnum3+"  "+qnum4+"  "+qnum5);

            //从数据库中提取5道题目
            String sql2 = "SELECT * from `QUEandANS` where QNO='"+qnum1+"' or QNO='"+qnum2+"' or QNO='"+qnum3+"' or QNO='"+qnum4+"' or QNO='"+qnum5+"'";
            rs=stmt.executeQuery(sql2);
            //将试题保存于page
            int NowQum=0;//现在题号
            while(rs.next()){
                NowQum++;
                String Que="question"+NowQum;
                String OA="optionA"+NowQum;
                String OB="optionB"+NowQum;
                String OC="optionC"+NowQum;
                String OD="optionD"+NowQum;
                pageContext.setAttribute(Que,new String(rs.getString("question")));
                pageContext.setAttribute(OA,new String(rs.getString("optionA")));
                pageContext.setAttribute(OB,new String(rs.getString("optionB")));
                pageContext.setAttribute(OC,new String(rs.getString("optionC")));
                pageContext.setAttribute(OD,new String(rs.getString("optionD")));
            }
            
            /*将试题存储到试题表中*/
            String sql4="select count(*) from userans where uid='"+uid+"'";//查询该用户有多少次答题记录
            rs=stmt.executeQuery(sql4);
            if(rs.next()){
                playNum=rs.getInt(1);//
            }
            session.setAttribute("nowPlaynum",playNum);
            String sql3="INSERT INTO userans(uid,QNO1,QNO2,QNO3,QNO4,QNO5,num)VALUES('"+uid+"','"+qnum1+"','"+qnum2+"','"+qnum3+"','"+qnum4+"','"+qnum5+"','"+playNum+"')";
            int i =stmt.executeUpdate(sql3);
            


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


    
   <div class="content">
	   <table id="tabbb" border="1px" cellspacing="0">  <!--cellspacing取消单元格之间间距-->
            <tr>
	            <td>
                    <img id="image1" src="" width=50px height="=50px"/>
                </td>
	            <td>
                    <img id="image2" src="" width=50px height="=50px"/>
                </td>
	            <td>
		            <img id="image3" src="" width=50px height="=50px"//>
                </td>
	            <td><img id="image4" src="" width=50px height="=50px"/></td>
	            <td><img id="image5" src="" width=50px height="=50px"/></td>
	            <td><img id="image6" src="" width=50px height="=50px"/></td>
	            <td><img id="image7" src="" width=50px height="=50px"/></td>
	            <td><img id="image8" src="" width=50px height="=50px"/></td>
	            <td><img id="image9" src="" width=50px height="=50px"/></td>
	            <td><img id="image10" src="" width=50px height="=50px"/></td>
                <td><img id="image11" src="" width=50px height="=50px"/></td>
	            <td><img id="image12" src="" width=50px height="=50px"/></td>
	            <td><img id="image13" src="" width=50px height="=50px"/></td>
	            <td><img id="image14" src="" width=50px height="=50px"/></td>
	            <td><img id="image15" src="" width=50px height="=50px"/></td>
	            <td><img id="image16" src="" width=50px height="=50px"/></td>
	            <td><img id="image17" src="" width=50px height="=50px"/></td>
	            <td><img id="image18" src="" width=50px height="=50px"/></td>
	            <td><img id="image19" src="" width=50px height="=50px"/></td>
	   
	        </tr>

	        <tr>
	            <td><img id="image52" src="" width=50px height="=50px"/></td>
	            <td colspan="17" rowspan="7" class="alt2">
                    <div class="yichu">
	                    <div class="t2">用时：<input type="text" id="timeValue" value="0/60秒" readonly></div>
                        <br />
                        <div class="t" style="color: red;">提示：<span id="tips">一共5道题目，每题20分，总分100分，请作答！</span></div>
                        <form method="post" action="CalPoint.jsp">
                            <div class="t"><!--显示题目部分-->
                                <h3 id="h3">题目1：<%=pageContext.getAttribute("question1")%></h3>
                                <div class="Option">
                                    <ul>
                                        <li><input type="radio" name="select1" value="A"><%=pageContext.getAttribute("optionA1")%><br /></li>
                                        <li><input type="radio" name="select1" value="B"><%=pageContext.getAttribute("optionB1")%><br /></li>
                                        <li><input type="radio" name="select1" value="C"><%=pageContext.getAttribute("optionC1")%><br /></li>
                                        <li><input type="radio" name="select1" value="D"><%=pageContext.getAttribute("optionD1")%><br /></li>
                                    </ul>
                        
                                </div>
                                <h3 id="h3">题目2：<%=pageContext.getAttribute("question2")%></h3>
                                <div class="Option">
                                    <ul>
                                        <li><input type="radio" name="select2" value="A"><%=pageContext.getAttribute("optionA2")%><br /></li>
                                        <li><input type="radio" name="select2" value="B"><%=pageContext.getAttribute("optionB2")%><br /></li>
                                        <li><input type="radio" name="select2" value="C"><%=pageContext.getAttribute("optionC2")%><br /></li>
                                        <li><input type="radio" name="select2" value="D"><%=pageContext.getAttribute("optionD2")%><br /></li>
                                    </ul>
                        
                                </div>
                                <h3 id="h3">题目3：<%=pageContext.getAttribute("question3")%></h3>
                                <div class="Option">
                                    <ul>
                                        <li><input type="radio" name="select3" value="A"><%=pageContext.getAttribute("optionA3")%><br /></li>
                                        <li><input type="radio" name="select3" value="B"><%=pageContext.getAttribute("optionB3")%><br /></li>
                                        <li><input type="radio" name="select3" value="C"><%=pageContext.getAttribute("optionC3")%><br /></li>
                                        <li><input type="radio" name="select3" value="D"><%=pageContext.getAttribute("optionD3")%><br /></li>
                                    </ul>
                        
                                </div>
                                <h3 id="h3">题目4：<%=pageContext.getAttribute("question4")%></h3>
                                <div class="Option">
                                    <ul>
                                        <li><input type="radio" name="select4" value="A"><%=pageContext.getAttribute("optionA4")%><br /></li>
                                        <li><input type="radio" name="select4" value="B"><%=pageContext.getAttribute("optionB4")%><br /></li>
                                        <li><input type="radio" name="select4" value="C"><%=pageContext.getAttribute("optionC4")%><br /></li>
                                        <li><input type="radio" name="select4" value="D"><%=pageContext.getAttribute("optionD4")%><br /></li>
                                    </ul>
                        
                                </div>
                                <h3 id="h3">题目5：<%=pageContext.getAttribute("question5")%></h3>
                                <div class="Option">
                                    <ul>
                                        <li><input type="radio" name="select5" value="A"><%=pageContext.getAttribute("optionA5")%><br /></li>
                                        <li><input type="radio" name="select5" value="B"><%=pageContext.getAttribute("optionB5")%><br /></li>
                                        <li><input type="radio" name="select5" value="C"><%=pageContext.getAttribute("optionC5")%><br /></li>
                                        <li><input type="radio" name="select5" value="D"><%=pageContext.getAttribute("optionD5")%><br /></li>
                                    </ul>
                        
                                </div>
    
                            </div><br>
                            <center>
                                <input type="submit" value="提交"><br />        
                            </center><br>
                        </form>

                    </div>

                </td>
                <td><img id="image20" src="" width=50px height="=50px"/></td>
            </tr>

            <tr>
                <td><img id="image51" src="" width=50px height="=50px"/></td>
                <td><img id="image21" src="" width=50px height="=50px"//></td>
            </tr>

            <tr>
                <td><img id="image50" src="" width=50px height="=50px"/></td>
                <td><img id="image22" src="" width=50px height="=50px"/></td>  
            </tr>

            <tr>
                <td><img id="image49" src="" width=50px height="=50px"/></td>
                <td><img id="image23" src="" width=50px height="=50px"/></td>
	   
            </tr>

            <tr>
                <td><img id="image48" src="" width=50px height="=50px"/></td>
                <td><img id="image24" src="" width=50px height="=50px"/></td>
            </tr>

            <tr>
                <td><img id="image47" src="" width=50px height="=50px"/></td>
                <td><img id="image25" src="" width=50px height="=50px"/></td>
            </tr>

            <tr>
                <td><img id="image46" src="" width=50px height="=50px"/></td>
                <td><img id="image26" src="" width=50px height="=50px"/></td>
            </tr>

            <tr>
                <td><img id="image45" src="" width=50px height="=50px"/></td>
                <td><img id="image44" src="" width=50px height="=50px"/></td>
                <td><img id="image43" src="" width=50px height="=50px"/></td>
                <td><img id="image42" src="" width=50px height="=50px"/></td>
                <td><img id="image41" src="" width=50px height="=50px"/></td>
                <td><img id="image40" src="" width=50px height="=50px"/></td>
                <td><img id="image39" src="" width=50px height="=50px"/></td>
                <td><img id="image38" src="" width=50px height="=50px"/></td>
                <td><img id="image37" src="" width=50px height="=50px"/></td>
                <td><img id="image36" src="" width=50px height="=50px"/></td>
                <td><img id="image35" src="" width=50px height="=50px"/></td>
                <td><img id="image34" src="" width=50px height="=50px"/></td>
                <td><img id="image33" src="" width=50px height="=50px"/></td>
                <td><img id="image32" src="" width=50px height="=50px"/></td>
                <td><img id="image31" src="" width=50px height="=50px"/></td>
                <td><img id="image30" src="" width=50px height="=50px"/></td>
                <td><img id="image29" src="" width=50px height="=50px"/></td>
                <td><img id="image28" src="" width=50px height="=50px"/></td>
                <td><img id="image27" src="" width=50px height="=50px"/></td>
            </tr>
        </table>
   </div>

 </body>

</html>