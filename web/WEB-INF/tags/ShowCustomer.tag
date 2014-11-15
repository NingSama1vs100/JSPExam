<%-- 
    Document   : ShowCustomer
    Created on : Nov 15, 2014, 11:24:59 AM
    Author     : ning jittima
--%>

<%@tag description="put the tag description here" pageEncoding="UTF-8"%>
<%@tag body-content="scriptless" %>
<%@tag isELIgnored="false" %>
<%@attribute name="listofcustomer" required="true" rtexprvalue="true" type="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table class="table">
    <c:set var="count" value="1" scope="page"/>
    <c:forEach items="${listofcustomer}" var="c">
        <tr>
            <th>#</th>
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
        <tr style="background-color: ${count%2==0?'white':'lightgray'}">
            <td>${count}</td>
            <td align="center">${c.customerid}</td>
            <td><a href="showcustomer?id=${c.customerid}">${c.name}</a></td>
            <td>${c.discountcode}</td>
            <td>${c.zip}</td>
            <td>${c.addressline1}</td>
            <td>${c.addressline2}</td>
            <td>${c.city}</td>
            <td>${c.state}</td>
            <td>${c.phone}</td>
            <td>${c.fax}</td>
            <td>${c.email}</td>
            <td>${c.creditlimit}</td>
        </tr>
        <c:set var="count" value="${count+1}"/>
    </c:forEach>
</table>