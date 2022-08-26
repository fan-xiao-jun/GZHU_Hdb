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

@WebServlet(name = "CINFServlet",urlPatterns = "/CINFServlet")
public class CINFServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //处理post请求中文乱码问题
        request.setCharacterEncoding("gb2312");
        //获取传来的参数
        HttpSession session=request.getSession();
        String username=(String)session.getAttribute("username");//获取用户名
        String uname=request.getParameter("uuname");//获取姓名
        String age=request.getParameter("age");//获取年龄
        String sex=request.getParameter("sex");//获取性别
        try{
            //连接数据库
            Connection conn = JDBCUtils.getConnection();
            Statement stmt = conn.createStatement();
            //sql语句
            String sql = "Update `user` Set username ='" +uname+"',age='"+age+"',sex='"+sex+"' where uid='"+username+"'";
            //使用Statement
            int i = stmt.executeUpdate(sql);
            if(i>0){
                response.sendRedirect(getServletContext().getContextPath()+"/index.jsp");
            }
            else{
                request.setAttribute("errorMsg","修改信息失败");
                request.getRequestDispatcher("/changeINF.jsp").forward(request,response);
            }
            //关闭连接、释放资源
            stmt.close();
            conn.close();
        }catch (Exception e){}

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
