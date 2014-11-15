<%-- 
    Document   : listcustomer
    Created on : Nov 15, 2014, 7:56:39 PM
    Author     : ning jittima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="info"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <info:Header title="Search Customer"/>
        <jsp:include page="search.jsp" flush="true"/>
        <hr>
        <info:ShowCustomer listofcustomer="${customer}"></info:ShowCustomer>
    </body>
</html>
