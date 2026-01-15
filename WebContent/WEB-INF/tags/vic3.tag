<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ attribute name="x" required="true" %>
<%@ attribute name="y" required="true" %>
<%@ variable name-given="add" %>
<%@ variable name-given="sub" %>
<%@ variable name-given="mul" %>
<%@ variable name-given="divid" %>

<c:set var="add"  value="${x + y }"/>
<c:set var="sub"  value="${x - y }"/>
<c:set var="mul"  value="${x * y }"/>
<c:set var="divid"  value="${x / y }"/>

<jsp:doBody />