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
    <title>CMS-Login</title>

    <spring:url value="/resources/css/reset.css" var="resetCss" />
    <link href="${resetCss}" rel="stylesheet" />

    <spring:url value="/resources/css/login.css" var="loginCss" />
    <link href="${loginCss}" rel="stylesheet" />

</head>
<body>

    <section class="login_wrapper">
        <div class="login_header">
            <p>
                Welcome back!
            </p>
        </div>

        <div class="line"></div>

        <c:url value="/login" var="loginVar"/>
        <form class="login_form" action="${loginVar}" method="POST">
            <label class="inputLabel">email</label>
            <input type="text" name="custom_username" class="input" placeholder="example@email.com" required >
            <label class="inputLabel">password</label>
            <input type="password" name="custom_password" class="input" placeholder="********" required>
            <sec:csrfInput/>
            <input type="submit" class="login_button" value="Login">
        </form>

        <div class="line"></div>

        <div class="footer_login">
            <p>
                Don't have an account?
                <a class="sign_up" href="<spring:url value="/signup/"/>">Sing up now!</a>
            </p>

            <p class="back_home">
                GO BACK TO
                <a class="home_page" href="<spring:url value="/"/>">Home Page!</a>
            </p>
        </div>

    </section>

</body>
</html>
