<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>CMS</title>

    <spring:url value="/resources/img/browser_tab_icon.ico" var="ico" />
    <link href="${ico}" rel="shortcut icon" type="image/x-icon">

    <spring:url value="/resources/css/reset.css" var="resetCss" />
    <link href="${resetCss}" rel="stylesheet" />

    <spring:url value="/resources/css/home.css" var="homeCss" />
    <link href="${homeCss}" rel="stylesheet" />

</head>

<body>

<jsp:include page="header.jsp" />

<section class="main_section_home">
    <p class="title_home">
        Conference Management System
    </p>

    <p class="tagline">
        Stop the long searching for reports over the Internet! Start CMS app and find all them here!
    </p>

    <div class="homepage_pic">
        <img src="<c:url value="/resources/img/home_page.jpg" />" alt="beautiful picture" />
    </div>

</section>

<jsp:include page="footer.jsp" />

</body>
</html>
