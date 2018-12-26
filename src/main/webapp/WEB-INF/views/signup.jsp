<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form"
           prefix="springForm"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>CMS</title>

    <spring:url value="/resources/img/browser_tab_icon.ico" var="ico" />
    <link href="${ico}" rel="shortcut icon" type="image/x-icon">

    <spring:url value="/resources/css/reset.css" var="resetCss" />
    <link href="${resetCss}" rel="stylesheet" />

    <spring:url value="/resources/css/signup.css" var="signupCss" />
    <link href="${signupCss}" rel="stylesheet" />

</head>
<body>

<section class="sign_up_wrapper">
    <div class="sign_up_header">

        <span>
            Let's get started!
        </span>
    </div>

    <div class="line"></div>

    <c:url value="/signup" var="signupVar"/>
    <form:form class="sign_up_form" action="${signupVar}" method="POST" modelAttribute="userdto">

        <div class="input_wrapper">
            <div class="field_mes">
                <label class="inputLabel">first name</label>
                <form:errors path="firstName" cssClass="error"/>
            </div>
            <form:input class="input" path="firstName" placeholder="John" cssClass="input"  />
        </div>

        <div class="input_wrapper">
            <div class="field_mes">
                <label class="inputLabel">last name</label>
                <form:errors path="lastName" cssClass="error"/>
            </div>
            <form:input class="input" path="lastName" placeholder="Smith" cssClass="input"  />
        </div>

        <div class="input_wrapper">
            <div class="field_mes">
                <label class="inputLabel">email</label>
                <form:errors path="email" cssClass="error"/>
            </div>
            <form:input class="input" path="email" placeholder="example@email.com" cssClass="input"  />
        </div>

        <div class="input_wrapper">
            <div class="field_mes">
                <label class="inputLabel">username</label>
                <form:errors path="username" cssClass="error"/>
            </div>
            <form:input class="input" path="username" placeholder="michaeljordan" cssClass="input"  />
        </div>

        <div class="input_wrapper">
            <div class="field_mes">
                <label class="inputLabel">password</label>
                <form:errors path="password" cssClass="error"/>
            </div>
            <form:password class="input" path="password" placeholder="******" cssClass="input"  />
        </div>

        <div class="input_wrapper">
            <div class="field_mes">
                <label class="inputLabel">confirm password</label>
                <%--<form:errors path="matchingPassword" cssClass="error"/>--%>
            </div>
            <form:password class="input" path="matchingPassword" placeholder="******" cssClass="input"  />
        </div>

        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" class="create_account_button" value="Create Account">
    </form:form>

    <div class="line"></div>

    <div class="footer_sign_up">

        <p>
            <a class="sign_up" href="<spring:url value="/login"/>">I have an Account!</a>
        </p>
        <p class="back_home">
            GO BACK TO
            <a class="home_page" href="<spring:url value="/"/>">Home Page!</a>
        </p>
    </div>

</section>

</body>
</html>
