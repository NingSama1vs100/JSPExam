<%-- 
    Document   : login
    Created on : Nov 15, 2014, 12:29:33 PM
    Author     : ning jittima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="info"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body onload="document.getElementById('userid').focus()">
        <info:Header title="Login to system"/>
        <form action="Login" method="post">
            <table>
                <tr>
                    <td>User ID</td>
                    <td><input type="number" name="userid" id="userid" required
                    value="${search.userid==null?cookie.userid.value:search.userid}"</td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password" required</td>
                </tr>
                <input type="hidden" name="destination" value="${param.destination}">
                <tr>
                    <td></td>
                    <td><input type="submit" value="Login"></td>
                </tr>
                <tr>
                    <td colspan="2"><span style="color:red"><b>${error}</b></span></td>
                </tr>
            </table>
        </form>
    </body>
</html>
