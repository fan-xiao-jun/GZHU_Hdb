package com.gec.web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import com.gec.utils.JDBCUtils;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

//使用注解方式快速添加访问路径
@WebServlet(name = "login",urlPatterns={"/login"})
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //接收前端传来的参数
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try{
            //连接数据库
            Connection connection = JDBCUtils.getConnection();
            Statement statement = connection.createStatement();
            String sql = "SELECT * from `user` where uid='"+username+"' and `password`='"+password+"'";
            ResultSet rs=statement.executeQuery(sql);
            //输出查询结果
            if(rs.next()){
                HttpSession session=request.getSession();
                session.setAttribute("username",username);
                System.out.println("登录成功");
                response.sendRedirect(getServletContext().getContextPath()+"/index.jsp");
            }
            else{
                System.out.println("账号密码错误");
                request.setAttribute("errorMsg","账号密码错误");
                request.getRequestDispatcher("/login.jsp").forward(request,response);
            }
            //关闭连接、释放资源
            rs.close();
            statement.close();
            connection.close();
        }catch (Exception e){e.printStackTrace();}
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("hello");

    }
}
