<%-- 
    Document   : Header
    Created on : Nov 15, 2014, 9:44:53 AM
    Author     : ning jittima
--%>

<%@tag description="put the tag description here" pageEncoding="UTF-8"%>
<%@tag body-content="empty" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@attribute name="title" %>


<c:set var="bg" value="border-bottom: teal thin solid"/>
<table width="99%">
    <tr style="background-color: teal">
        <td width="70%" style="${bg}">
            <h3>${title==null?'No Title':title}</h3>
        </td>
        <td width="30%" style="${bg}" align="right">
            <c:choose>
                <c:when test="${user==null}">
                    Hello <a href="Login" title="Login to system">Guest</a>
                </c:when>
                <c:otherwise>
                    Hello <a href="Logout" title="Logout from system">${user.name}</a>
                </c:otherwise>
            </c:choose>
        </td>
    </tr>
</table>