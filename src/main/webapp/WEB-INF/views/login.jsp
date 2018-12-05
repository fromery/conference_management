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

    <style>

        * {
            padding: 0;
            margin: 0;
        }

        html,
        body {
            width: 100%;
            background-color: #f2f5f5;
        }

        .login_wrapper {
            width: 490px;
            height: 340px;
            margin: 100px auto;
            border-radius: 2%;
            background-color: #ffffff;
        }

        .login_header {
            padding-top: 15px;
            padding-bottom: 10px;
            color: #000000;
            text-align: center;
            font-size: 35px;
        }

        .line {
            border-top: 2px solid #f2f5f5;
        }

        .login_form {
            display: flex;
            flex-direction: column;
            margin: 20px auto;
            margin-bottom: 10px;
            width: 428px;
        }

        .input {
            height: 50px;
            margin-bottom: 10px;
            padding: 20px 10px 0 10px;;
            border: 1px solid #a8b0b5;
            border-radius: 3px;
            font-size: 18px;
        }

        .login_button {
            margin: 0 auto 10px auto;
            width: 146px;
            height: 59px;
            display: block;
            padding: 10px;
            background-color: #60d3ef;
            border-radius: 5px;

            font-size: 18px;
            color: #ffffff;

            cursor: pointer;
        }

        .footer_login {
            margin: 15px;
            text-align: center;
        }

        .sign_up {
            text-decoration: none;
        }

        .sign_up:hover ,
        .sign_up:focus {
            background-color: #60d3ef;
            color: #ffffff;
        }

        .inputLabel {
            margin-bottom: -20px;
            color: #55606E;
            z-index: 1;
            font-family: Arial, sans-serif;
            margin-left: 11px;
            text-transform: uppercase;
            font-weight: 100;
            font-size: 12px;
        }

        .back_home {
            margin-top: 5px;
            font-size: 13px;
        }

        .home_page {
            text-decoration: none;
        }

    </style>
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
