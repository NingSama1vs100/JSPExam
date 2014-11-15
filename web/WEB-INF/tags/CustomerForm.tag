<%-- 
    Document   : CustomerForm
    Created on : Nov 15, 2014, 4:01:53 PM
    Author     : ning jittima
--%>

<%@tag description="put the tag description here" pageEncoding="UTF-8"%>
<%@tag body-content="empty" %>
<%@attribute name="isReadOnly" required="true" %>
<%@attribute name="customer" required="true" rtexprvalue="true" type="model.Customer"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table style="text-align: center">
    <tr>
        <th colspan="5">
    <h3>${customer.customerId==0?'Auto Number':customer.customerid}</h3>
</th>
</tr>
<tr>
    <td style="text-align: right">Customer ID: </td>
    <td><input type="text" disabled name="customerid"
               value="${customer.customerid==0?'Auto Number':customer.customerid}"
               style="font-stretch: expanded"</td>
    <td>&nbsp;</td>
    <td style="text-align: right">Name: </td>
    <td><input type="text" name="name" value="${customer.name}" id="name"</td>
</tr>
<tr>
    <td style="text-align: right">Address Line 1:</td>
    <td colspan="4"><textarea name="addressline1" required>${customer.addressline1}</textarea></td>
</tr>
<tr>
    <td style="text-align: right">Address Line 2:</td>
    <td colspan="4"><textarea name="addressline2" required>${customer.addressline2}</textarea></td>
</tr>
<tr>
    <td style="text-align: right">City:</td>
    <td><input type="text" name="city" value="${customer.city}" required></td>
    <td>&nbsp;</td>
    <td style="text-align: right">State:</td>
    <td><input type="text" name="state" value="${customer.state}" required></td>
</tr>
<tr>
    <td style="text-align: right">Zip:</td>
    <td><input type="text" name="zip" value="${customer.zip}" required></td>
    <td>&nbsp;</td>
    <td style="text-align: right">E-Mail Address:</td>
    <td><input type="text" name="email" value="${customer.email}" required></td>        
</tr>
<tr>
    <td style="text-align: right">Phone:</td>
    <td><input type="text" name="phone" value="${customer.phone}" required></td>
    <td>&nbsp;</td>
    <td style="text-align: right">Fax:</td>
    <td><input type="text" name="fax" value="${customer.fax}" required></td>
</tr>                 
<tr>
    <td style="text-align: right">Credit Limit:</td>
    <td><input type="text" name="creditlimit" value="${customer.creditlimit}" required></td>
    <td>&nbsp;</td>
    <td style="text-align: right">Discount Code (H/L/M/N):</td>
    <td><input type="text" name="discountcode" value="${customer.discountcode}" required></td> 
</tr>
<c:if test="${isReadOnly='false'||isReadOnly='no'}">
    <tr>
        <td colspan="5" style="text-align: right">
            <input type="button" value="Cancel" onclick="history.go(-1)">&nbsp;&nbsp;&nbsp;
            <input type="submit" value="Save">
        </td>
    </tr>
</c:if>
</table>
