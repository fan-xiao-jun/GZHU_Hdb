<%@ page contentType="text/html; charset=gb2312" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ex3修改密码</title>
</head>
<style type="text/css">
    font {
        color: #3164af;
        font-size: 18px;
        font-weight: normal;
        padding: 0 10px;
    }
</style>

<body>
    <div style="background: #fff; padding: 40px 80px; margin: 30px; border: 7px solid #ccc;">
     <center>
        <font>修改密码</font>CHANGE PASSWORD
         <span style="color: red">${errorMsg }</span>
        <form method="post" action="${pageContext.request.contextPath }/CPwdServlet">
            <table>
                <tr>
                    <td>旧密码</td>
                    <td><input type="password" name="OldPwd" required="required"></td>
                </tr>
                <tr>
                    <td>新密码</td>
                    <td><input type="password" name="NewPwd" required="required"></td>
                </tr>
                <tr>
                    <td>确认新密码</td>
                    <td><input type="password" name="ConfNewPwd" required="required"></td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <input type="submit" value="修改密码">
                        <input type="reset" value="重置">
                    </td>
                </tr>
            </table>
        </form>
     </center>
    </div>
</body>
</html>