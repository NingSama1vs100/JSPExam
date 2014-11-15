<%-- 
    Document   : searchcustomer
    Created on : Nov 15, 2014, 3:54:13 PM
    Author     : ning jittima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="info"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Customer</title>
    </head>
    <body>
        <info:Header title="Search Customer"/>
        <h1>Search Customer</h1>
        <jsp:include page="search.jsp" flush="true"/>
        <hr>
        <h3 style="color: red">${requestScope.error}</h3>
    </body>
</html>
