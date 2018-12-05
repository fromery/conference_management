<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<spring:url value="/resources/css/header.css" var="headerCss" />

<link href="${headerCss}" rel="stylesheet" />

<section id="header">

    <div class="logo">
        <img src="<c:url value="/resources/img/logo.jpg" />" alt="logo" />
    </div>

    <ul class="menu">
        <li class="menu_item"><a class="menu_item_link" href="<spring:url value="/"/>">Home</a></li>
        <li class="menu_item"><a class="menu_item_link" href="<spring:url value="/users/"/>">Users</a></li>
        <li class="menu_item"><a class="menu_item_link" href="<spring:url value="/reports/"/>">Reports</a></li>
        <li class="menu_item"><a class="menu_item_link" href="<spring:url value="/conferences/"/>">Conferences</a></li>
        <li class="menu_item"><a class="menu_item_link" href="<spring:url value="/login/"/>">Log In</a></li>
        <li class="menu_item"><a class="menu_item_link" id="sign_up" href="<spring:url value="/signup/"/>">Sign Up</a></li>
    </ul>

</section>
