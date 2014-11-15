<%-- 
    Document   : customerentry
    Created on : Nov 15, 2014, 7:44:01 PM
    Author     : ning jittima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="info"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Entry Form</title>
    </head>
    <body>
        <jsp:useBean id="customer" class="model.Customer"/>
        <info:Header title="Customer Entry Form"/>
        <form action="UpdateCustomer" method="POST">
            <info:CustomerForm isReadOnly="false" customer="${customer}"/>
        </form>
    </body>
</html>
