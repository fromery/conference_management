<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Users</title>

    <spring:url value="/resources/img/browser_tab_icon.ico" var="ico" />
    <link href="${ico}" rel="shortcut icon" type="image/x-icon">

    <spring:url value="/resources/css/reset.css" var="resetCss" />
    <link href="${resetCss}" rel="stylesheet" />

    <spring:url value="/resources/css/users.css" var="usersCss" />
    <link href="${usersCss}" rel="stylesheet" />

</head>

<body>

<jsp:include page="header.jsp" />

<section class="main_section_home">

    Users

</section>

<jsp:include page="footer.jsp" />

</body>
</html>
