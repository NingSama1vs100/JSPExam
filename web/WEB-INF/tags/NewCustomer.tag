<%-- 
    Document   : NewCustomer
    Created on : Nov 15, 2014, 9:57:17 AM
    Author     : ning jittima
--%>

<%@tag description="put the tag description here" pageEncoding="UTF-8"%>
<%@tag body-content="empty" %>
<%@variable name-given="customer" scope="AT_BEGIN" variable-class="model.Customer"%>
<%@attribute name="id" required="true"%>
<%@attribute name="name" required="true"%>
<%@attribute name="discountcode" %>
<%@attribute name="zip" %>
<%@attribute name="addressline1" %>
<%@attribute name="addressline2" %>
<%@attribute name="city" %>
<%@attribute name="state" %>
<%@attribute name="phone" %>
<%@attribute name="fax" %>
<%@attribute name="email" %>
<%@attribute name="creditlimit" %>

<jsp:useBean id="customer" class="model.Customer"/>
<jsp:setProperty name="customer" property="customerid" value="${id}"/>
<jsp:setProperty name="customer" property="name" value="${name}"/>
<jsp:setProperty name="customer" property="discountcode" value="${discountcode}"/>
<jsp:setProperty name="customer" property="zip" value="${zip}"/>
<jsp:setProperty name="customer" property="addressline1" value="${addressline1}"/>
<jsp:setProperty name="customer" property="addressline2" value="${addressline2}"/>
<jsp:setProperty name="customer" property="city" value="${city}"/>
<jsp:setProperty name="customer" property="state" value="${state}"/>
<jsp:setProperty name="customer" property="phone" value="${phone}"/>
<jsp:setProperty name="customer" property="fax" value="${fax}"/>
<jsp:setProperty name="customer" property="email" value="${email}"/>
<jsp:setProperty name="customer" property="creditlimit" value="${creditlimit}"/>