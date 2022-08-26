package com.gec.utils;

/**
 *    因为 刚才在实现 登录 注册的时候，存在重复拷贝 jdbc的 相同代码
 */

import com.mysql.jdbc.Driver;
import java.sql.Connection;
import java.sql.DriverManager;

/**
 *  jdbc 工具类
 */
public class JDBCUtils {
    // 获取连接
    public static Connection getConnection() throws Exception
    {
        DriverManager.registerDriver(new Driver());
        String url ="jdbc:mysql://localhost:3306/hongdb";
        String username = "root";
        String password = "123";
        Connection connection = DriverManager.getConnection(url, username, password);
        return connection;
    }
}
