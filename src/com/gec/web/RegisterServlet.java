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

@WebServlet(name = "register",urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //处理post请求中文乱码问题
        request.setCharacterEncoding("gb2312");
        //接收前端传来的参数
        String username=request.getParameter("username");//获取用户名
        String name=request.getParameter("name");//获取姓名
        String password=request.getParameter("password");
        String confirmpwd=request.getParameter("confirmpwd");
        String age=request.getParameter("age");
        String sex =request.getParameter("sex");//获取性别
        if(sex.equals("male")){sex="男";}
        else if(sex.equals("female")){sex="女";}
        int upower=0;//用户权限

        try{
            //连接数据库
            Connection conn = JDBCUtils.getConnection();
            Statement stmt = conn.createStatement();
            //判断两次密码是否一致
            if(password.equals(confirmpwd)){
                //查询用户名是否已存在
                String sql1 = "SELECT uid from `user` where uid='"+username+"'";
                ResultSet rs=stmt.executeQuery(sql1);
                if(rs.next()){//用户名已存在
                    request.setAttribute("errorMsg","用户名已存在");
                    request.getRequestDispatcher("/register.jsp").forward(request,response);
                }
                else{//用户名不存在
                    //插入数据库
                    String sql = "INSERT INTO user(uid,username,password,age,sex,upower)VALUES('"+username+"','"+name+"'" + ",'"+password+"','"+age+"','"+sex+"','"+upower+"')";
                    //使用Statement
                    int i = stmt.executeUpdate(sql);
                    if(i>0){
                        System.out.println("注册成功");
                        response.sendRedirect(getServletContext().getContextPath()+"/login.jsp");
                    }
                    else{
                        System.out.println("注册失败");
                        request.setAttribute("errorMsg","注册失败");
                        request.getRequestDispatcher("/register.jsp").forward(request,response);
                    }
                }
                rs.close();
            }
            else{
                request.setAttribute("errorMsg","密码不一致");
                request.getRequestDispatcher("/register.jsp").forward(request,response);
            }
            //关闭连接、释放资源
            stmt.close();
            conn.close();
        }catch (Exception e){e.printStackTrace();}

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
