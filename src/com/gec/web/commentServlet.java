package com.gec.web;

import com.gec.utils.JDBCUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

@WebServlet(name = "commentServlet",urlPatterns = "/commentServlet")
public class commentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //处理post请求中文乱码问题
        request.setCharacterEncoding("gb2312");
        //获取参数
        HttpSession session=request.getSession();
        String name=(String)session.getAttribute("username");
        String comment=request.getParameter("mycomment");
        String time=new java.util.Date().toLocaleString();//获取当前时间
        try{
            //连接数据库
            Connection conn = JDBCUtils.getConnection();
            //建立Statement
            Statement stmt=conn.createStatement();
            String sql="INSERT into comment(username,content,time)VALUES('"+name+"','"+comment+"','"+time+"')";
            int i = stmt.executeUpdate(sql);
            if(i>0){
                response.sendRedirect(getServletContext().getContextPath()+"/news.jsp");
            }
            else{
                response.sendRedirect("errorComment.html");
            }
            //关闭连接、释放资源
            stmt.close();
            conn.close();
        }catch (Exception e){}

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
