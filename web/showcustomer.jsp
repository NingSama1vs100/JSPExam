<%-- 
    Document   : showcustomer
    Created on : Nov 15, 2014, 3:58:18 PM
    Author     : ning jittima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <info:Header title="Search Customer"/>
    <jsp:include page="search.jsp" flush="true"/>
    <table>
        <tr>
            <th>Customer ID</th>
            <th>Name</th>
            <th>Discount Code</th>
            <th>Zip</th>
            <th>Address Line (1)</th>
            <th>Address Line (2)</th>
            <th>City</th>
            <th>State</th>
            <th>Phone</th>
            <th>Fax</th>
            <th>E-Mail</th>
            <th>Credit Limit</th>
        </tr>
        <td align="center">${customer.customerid}</td>
        <td>${customer.name}</td>
        <td>${customer.discountcode}</td>
        <td>${customer.zip}</td>
        <td>${customer.addressline1}</td>
        <td>${customer.addressline2}</td>
        <td>${customer.city}</td>
        <td>${customer.state}</td>
        <td>${customer.phone}</td>
        <td>${customer.fax}</td>
        <td>${customer.email}</td>
        <td>${customer.creditlimit}</td>
    </tr>
</table>
</body>
</html>
