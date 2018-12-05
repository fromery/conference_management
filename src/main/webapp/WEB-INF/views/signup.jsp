<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>CMS-Sign Up</title>

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

    <form class="sign_up_form">
        <label class="inputLabel">first name</label>
        <input type="text" class="input" placeholder="John" required >
        <label class="inputLabel">last name</label>
        <input type="text" class="input" placeholder="Smith" required >
        <label class="inputLabel">email</label>
        <input type="text" class="input" placeholder="example@email.com" required >
        <label class="inputLabel">password</label>
        <input type="password" class="input" placeholder="********" required>
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
