<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
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

<%--<csrf disabled="true"/>--%>

<section class="sign_up_wrapper">
    <div class="sign_up_header">

        <span>
            Let's get started!
        </span>
    </div>

    <div class="line"></div>

    <c:url value="/signup" var="signupVar"/>
    <form class="sign_up_form" action="${signupVar}" method="POST">

        <label class="inputLabel">username</label>
        <input name="username" type="text" class="input" placeholder="johnsmith" required >

        <label class="inputLabel">first name</label>
        <input name="firstName" type="text" class="input" placeholder="John" required >

        <label class="inputLabel">last name</label>
        <input name="lastName" type="text" class="input" placeholder="Smith" required >

        <label class="inputLabel">email</label>
        <input name="email" type="text" class="input" placeholder="example@email.com" required >

        <label class="inputLabel">password</label>
        <input name="password" type="password" class="input" placeholder="********" required>
        <sec:csrfInput/>

        <input type="submit" class="create_account_button" value="Create Account">
    </form>

    <div class="line"></div>

    <div class="footer_sign_up">

        <p>
            <a class="log_in" href="${contextPath}/login">I have an Account!</a>
        </p>
        <p class="back_home">
            GO BACK TO
            <a class="home_page" href="${contextPath}/">Home Page!</a>
        </p>
    </div>

</section>

</body>
</html>
