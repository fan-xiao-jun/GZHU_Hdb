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

@WebServlet(name = "CPwdServlet",urlPatterns = "/CPwdServlet")
public class CPwdServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //处理post请求中文乱码问题
        request.setCharacterEncoding("gb2312");
        //获取传来的参数
        HttpSession session=request.getSession();
        String username=(String)session.getAttribute("username");//获取用户名
        String OldPwd=request.getParameter("OldPwd");//获取旧密码
        String NewPwd=request.getParameter("NewPwd");//获取新密码
        String ConNewPwd=request.getParameter("ConfNewPwd");//获取确认密码ConfNewPwd
        //sql语句
        String sql1 = "SELECT password from `user` where uid='"+username+"' and `password`='"+OldPwd+"'";//提取用户密码
        String sql2 = "Update `user` Set password ='" +NewPwd+"' where uid='"+username+"'";//更改密码
        try {
            //连接数据库
            Connection conn = JDBCUtils.getConnection();
            Statement stmt = conn.createStatement();
            //执行查询建立ResultSet
            ResultSet rs=stmt.executeQuery(sql1);
            //使用Statement
            if(rs.next()){
                if(NewPwd.equals(ConNewPwd)){//判断用户输入的两次密码是否一致
                    int i = stmt.executeUpdate(sql2);//修改密码
                    if(i>0){
                        response.sendRedirect(getServletContext().getContextPath()+"/index.jsp");
                    }else{
                        request.setAttribute("errorMsg","新密码与确认密码不一致");
                        request.getRequestDispatcher("/changePWD.jsp").forward(request,response);
                    }
                }
                else{
                    request.setAttribute("errorMsg","新密码与确认密码不一致");
                    request.getRequestDispatcher("/changePWD.jsp").forward(request,response);
                }
            }
            else{
                request.setAttribute("errorMsg","旧密码错误");
                request.getRequestDispatcher("/changePWD.jsp").forward(request,response);
            }
            //关闭连接、释放资源
            rs.close();
            stmt.close();
            conn.close();
        }catch (Exception e){}
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
