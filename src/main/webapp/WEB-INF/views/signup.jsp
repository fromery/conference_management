<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>CMS-Sign Up</title>

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

        .sign_up_wrapper {
            width: 490px;
            height: 448px;
            margin: 100px auto;
            border-radius: 2%;
            background-color: #ffffff;
        }

        .sign_up_header {
            padding-top: 15px;
            padding-bottom: 10px;
            color: #000000;
            text-align: center;
            font-size: 35px;
        }

        .line {
            border-top: 2px solid #f2f5f5;
        }

        .sign_up_form {
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

        .create_account_button {
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

        .footer_sign_up {
            margin: 15px;
            text-align: center;
        }

        .log_in {
            text-decoration: none;
        }

        .log_in:hover ,
        .log_in:focus {
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
