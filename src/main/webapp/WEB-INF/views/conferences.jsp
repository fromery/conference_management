<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>CMS-Conferences</title>

    <spring:url value="/resources/css/reset.css" var="resetCss" />
    <link href="${resetCss}" rel="stylesheet" />

    <spring:url value="/resources/css/conferences.css" var="conferencesCss" />
    <link href="${conferencesCss}" rel="stylesheet" />

</head>

<body>

<jsp:include page="header.jsp" />

<section class="main_section_home">

    Conferences

</section>

<jsp:include page="footer.jsp" />

</body>
</html>
